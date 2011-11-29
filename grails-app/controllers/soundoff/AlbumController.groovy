package soundoff

import grails.plugins.springsecurity.Secured

class AlbumController {

    static navigation = [
        order: 2,
        title: 'Albums',
        action: 'list',
        subItems: [
            [action:'create', order: 0, title: 'Create'],
            [action:'list', order: 1, title: 'List']
        ]
    ]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def index = {
        redirect(action: "list", params: params)
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [albumInstanceList: Album.list(params), albumInstanceTotal: Album.count()]
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def create = {
        def albumInstance = new Album()
        albumInstance.properties = params
        return [albumInstance: albumInstance]
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def save = {
        def albumInstance = new Album(params)
        if (albumInstance.save(flush: true)) {
            flash.message = "Album '${albumInstance.name}' created."
            redirect(action: "show", id: albumInstance.id)
        }
        else {
            render(view: "create", model: [albumInstance: albumInstance])
        }
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def show = {
        def albumInstance = Album.get(params.id)
        if (!albumInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
            redirect(action: "list")
        }
        else {
            // we're going to add a aggregate rating for this album
            
            [albumInstance: albumInstance, aggregateRating: albumInstance.getAggregateRating() ]
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY', 'ROLE_ADMIN'])
    def edit = {
        def albumInstance = Album.get(params.id)
        if (!albumInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [albumInstance: albumInstance]
        }
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def update = {
        def albumInstance = Album.get(params.id)
        if (albumInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (albumInstance.version > version) {
                    
                    albumInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'album.label', default: 'Album')] as Object[], "Another user has updated this Album while you were editing")
                    render(view: "edit", model: [albumInstance: albumInstance])
                    return
                }
            }
            albumInstance.properties = params
            if (!albumInstance.hasErrors() && albumInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'album.label', default: 'Album'), albumInstance.id])}"
                redirect(action: "show", id: albumInstance.id)
            }
            else {
                render(view: "edit", model: [albumInstance: albumInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED', 'ROLE_ADMIN'])
    def delete = {
        def albumInstance = Album.get(params.id)
        if (albumInstance) {
            try {
                albumInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def viewImage = {
        def albumInstance = Album.get(params.id)
        if (albumInstance) {
            response.contentType = "image/jpeg"
            response.contentLength = albumInstance.artwork.length
            response.outputStream << albumInstance.artwork
        }
        else {
            // TODO: show a default?
        }
    }
}

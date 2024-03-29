package soundoff

import grails.plugins.springsecurity.Secured

class ReviewController {
    
    def springSecurityService

    static navigation = [
        order: 3,
        title: 'Reviews',
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
        [reviewInstanceList: Review.list(params), reviewInstanceTotal: Review.count()]
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def create = {
        def reviewInstance = new Review()
        reviewInstance.properties = params
        return [reviewInstance: reviewInstance, albumId: (params.id ?: 1)]
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def save = {
        def reviewInstance = new Review(params)
        reviewInstance.creator = springSecurityService.currentUser
        
        if (reviewInstance.save(flush: true)) {
            flash.message = "Review of ${reviewInstance.album.name} added."
            redirect(action: "show", id: reviewInstance.id)
        }
        else {
            render(view: "create", model: [reviewInstance: reviewInstance])
        }
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def show = {
        def reviewInstance = Review.get(params.id)
        if (!reviewInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reviewInstance: reviewInstance]
        }
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def edit = {
        def reviewInstance = Review.get(params.id)
        if (!reviewInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reviewInstance: reviewInstance]
        }
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def update = {
        def reviewInstance = Review.get(params.id)
        if (reviewInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reviewInstance.version > version) {
                    
                    reviewInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'review.label', default: 'Review')] as Object[], "Another user has updated this Review while you were editing")
                    render(view: "edit", model: [reviewInstance: reviewInstance])
                    return
                }
            }
            reviewInstance.properties = params
            if (!reviewInstance.hasErrors() && reviewInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'review.label', default: 'Review'), reviewInstance.id])}"
                redirect(action: "show", id: reviewInstance.id)
            }
            else {
                render(view: "edit", model: [reviewInstance: reviewInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def delete = {
        def reviewInstance = Review.get(params.id)
        if (reviewInstance) {
            try {
                reviewInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'review.label', default: 'Review'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'review.label', default: 'Review'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), params.id])}"
            redirect(action: "list")
        }
    }
}

package soundoff

import grails.plugins.springsecurity.Secured

class HomeController {

    static allowedMethods = [save: "POST", update: "POST"]

    static navigation = [
        order: 0,
        title: 'Home',
        action: 'index'
    ]

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def index = { 
        [ recentReviews: Review.list([max: 5, order: "desc" ]) ]
    }
    
    /**
     * Searches the albums, artists and reviews.  This does 3 different searches in order to 
     * find the correct information.
     */
     @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def search = {

        def reviewCriteria = Review.createCriteria()
        def reviewResults = reviewCriteria {
            or {
                ilike("title", "%${params.query}%")
                ilike("text", "%${params.query}%")
            }
        }
        
        [ 
            albums: Album.findAllByNameIlike("%${params.query}%"), 
            artists: Artist.findAllByNameIlike("%${params.query}%"), 
            reviews: reviewResults,
            query: params.query
        ]
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def save = {
        def userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            flash.message = "User '${userInstance.username}' has been created.  Please login."
            redirect(controller: "login", action: "auth")
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
}

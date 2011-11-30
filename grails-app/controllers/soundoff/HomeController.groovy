package soundoff

import grails.plugins.springsecurity.Secured

class HomeController {

    def springSecurityService

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

    def users = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }
    
    def save = {
        def userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            def userRole = Role.findByAuthority("ROLE_USER")
            if (!userInstance.authorities.contains(userRole)) {
                UserRole.create userInstance, userRole
            }
            flash.message = "User '${userInstance.username}' has been created.  Please login."
            redirect(controller: "login", action: "auth")
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }
    
    @Secured(["ROLE_ADMIN"])
    def makeMod = {
        
        def userInstance = User.get(params.id)
        if (userInstance) {
            def modRole = Role.findByAuthority("ROLE_MODERATOR")
            if (!userInstance.authorities.contains(modRole)) {
                UserRole.create userInstance, modRole
            }
            if (springSecurityService.loggedIn &&
                springSecurityService.principal.username == userInstance.username) {
                    springSecurityService.reauthenticate userInstance.username
            }
            flash.message = "User '${userInstance.username}' has been made into a moderator."
        } else {
            flash.message = "The specified user could not be found."
        }
        
        redirect(action: "users")
        
    }
    
    @Secured(["ROLE_ADMIN"])
    def makeAdmin = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            def adminRole = Role.findByAuthority("ROLE_ADMIN")
            if (!userInstance.authorities.contains(adminRole)) {
                UserRole.create userInstance, adminRole
            }
            flash.message = "User '${userInstance.username}' has been made into an admin."
        } else {
            flash.message = "The specified user could not be found."
        }
        
       redirect(action: "users")
    }
}

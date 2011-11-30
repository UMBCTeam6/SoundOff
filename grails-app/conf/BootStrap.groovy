import soundoff.User
import soundoff.Role
import soundoff.UserRole
import soundoff.Artist

class BootStrap {

    // dependency injection
    def springSecurityService

    def init = { servletContext ->
    
        // set up all of our roles.
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def moderatorRole = Role.findByAuthority('ROLE_MODERATOR') ?: new Role(authority: 'ROLE_MODERATOR').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
    
        // We would remove the lines below this one if this product was actually being used.
        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)
 
        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create adminUser, adminRole
        }
        
        // create some fake data for now
        ["Linkin Park", "Jack Johnson", "Stone Temple Pilots"].each { ar ->
            new Artist(name: ar).save(failOnError: false)
        }
    }
    def destroy = {
    }
}

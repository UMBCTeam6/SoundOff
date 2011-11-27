import soundoff.User
import soundoff.Role
import soundoff.UserRole
import soundoff.Artist

class BootStrap {

    // dependency injection
    def springSecurityService

    def init = { servletContext ->
    
        // TODO: this should be removed before we deliver to the customer.  this is used for testing only.
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
    
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

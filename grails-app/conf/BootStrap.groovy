import soundoff.User
import soundoff.Role
import soundoff.UserRole

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
    }
    def destroy = {
    }
}

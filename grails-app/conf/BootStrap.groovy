import soundoff.User
import soundoff.Role
import soundoff.UserRole
import soundoff.Artist
import soundoff.Album
import soundoff.Review

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
        
        def modUser = User.findByUsername('mod') ?: new User(
            username: 'mod',
            password: 'mod',
            enabled: true).save(failOnError: true)
        if (!modUser.authorities.contains(moderatorRole)) {
            UserRole.create modUser, moderatorRole
        }
        
        def random = new Random()
        // create some fake data for now
        [
        "Linkin Park" :
            [ 
            "Hybrid Theory" : 2000,
            "Meteora" : 2002
            ],
        "Jack Johnson" :
            [ 
            "Brushfire Fairytales" : 2001,
            "In Between Dreams" : 2005
            ],
        "Stone Temple Pilots" :
            [
                "Core" : 1992,
                "Purple" : 1994,
                "No. 4" : 1999
            ]
        ].each { ar, al ->
            def artist = new Artist(name: ar).save(failOnError: false)
            al.each { album, year ->
                def alb = new Album(name : album, year: year)
                artist.addToAlbums(alb)
                artist.save()
                
                def num = random.nextInt(5) + 1
                (0..1).each { 
                    def user = it == 0 ? adminUser : modUser
                    def rev = new Review(creator: user, rating: random.nextInt(5) + 1,
                        title: "${num} title", text: "I gave this one a ${num}" )
                    alb.addToReviews(rev)
                    alb.save()
                }                               
                
            }
            artist.save(failOnError: false)
        }
    }
    def destroy = {
    }
}

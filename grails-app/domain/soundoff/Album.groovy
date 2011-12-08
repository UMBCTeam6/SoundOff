package soundoff

class Album {

    String name
    Integer year
    
    byte[] artwork
    
    static belongsTo = [ artist: Artist ]
    static hasMany = [ reviews: Review ]

    static constraints = {
        name(nullable:false, unique: true, blank: false)
        year(nullable:false)
        artwork(nullable:true, maxSize: 100000)
    }
    
    /**
     * This function calculates the aggregrate review of the album.
     * If a moderator has rated an album, their rating counts twice,
     * as to influence the rating moreso than usual users.
     */
    def getAggregateRating() {
        def rating = 0
        if (reviews.size() > 0)
        {
            def total = 0;
            rating = reviews.collect { r ->
                def creatorRole = UserRole.findByUser(r.creator).role.authority
                if (creatorRole && creatorRole == "ROLE_MODERATOR")
                {
                    r.rating * 2
                    total += 2
                }
                else 
                {
                    r.rating
                    total += 1
                }                
            }.sum() / total
        }
        return rating
    }
}

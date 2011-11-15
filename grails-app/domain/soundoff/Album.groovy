package soundoff

class Album {

    String name
    Integer year
    
    byte[] artwork
    
    static belongsTo = [ artist: Artist ]
    static hasMany = [ reviews: Review ]

    static constraints = {
        name(null:false)
        year(null:false)
    }
    
    /**
     * This function calculates the aggregrate review of the album.
     * If a moderator has rated an album, their rating counts twice,
     * as to influence the rating moreso than usual users.
     */
    def getAggregateRating() {
        return reviews.collect { r ->
            def creatorRole = UserRole.findByUser(r.creator).role.authority
            if (creatorRole && creatorRole == "ROLE_MODERATOR")
            {
                r.rating * 2
            }
            else 
            {
                r.rating
            }                
        }.sum() / reviews.size()
    }
}

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
        return reviews.collect { (it.author.role == "Moderator" ? it.rating * 2 : it.rating) }.sum() / reviews.size()
    }
}

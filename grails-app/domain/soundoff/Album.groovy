package soundoff

class Album {

    String name
    Integer year
    
    // TODO: add artwork
    
    static belongsTo = [ artist: Artist ]
    static hasMany = [ reviews: Review ]

    static constraints = {
    }
}

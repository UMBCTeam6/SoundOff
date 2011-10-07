package soundoff

class Album {

    String name
    Integer year
    
    static belongsTo = [ artist: Artist ]
    static hasMany = [ reviews: Review ]

    static constraints = {
    }
}

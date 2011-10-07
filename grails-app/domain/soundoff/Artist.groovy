package soundoff

class Artist {

    String name
    static hasMany = [ albums: Album ]
    static constraints = {
        name(null:false)
    }
}

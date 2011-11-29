package soundoff

class Artist {

    String name
    static hasMany = [ albums: Album ]
    static constraints = {
        name(nullable:false, unique:true, blank:false)
    }
}

package soundoff

class Review {
	
    Integer rating
    String title, text
    
    static belongsTo = [ album: Album, creator: User ]
    
    static constraints = {
        rating(min:1)
    }
}

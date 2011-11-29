package soundoff

class Review {
	
    Integer rating
    String title, text
    Date written = new Date()
    
    static belongsTo = [ album: Album, creator: User ]
    
    static constraints = {
        rating(min:1)
    }
}

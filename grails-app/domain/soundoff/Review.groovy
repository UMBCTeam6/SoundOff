package soundoff

class Review {
	
    Integer rating
    String title, text
    Date written = new Date()
    
    static belongsTo = [ album: Album, creator: User ]
    
    static constraints = {
    	// ensures that a user can only review an album once
    	album(unique: 'creator')
        title(nullable: false, blank: false)
        text(nullable: false, blank: false)
        rating(min:1)
    }
}

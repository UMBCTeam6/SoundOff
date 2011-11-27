package soundoff

class HomeController {

    static navigation = [
        order: 0,
        title: 'Home',
        action: 'index'
    ]

    def index = { 
        render(view:"index")
    }
    
    /**
     * Searches the albums, artists and reviews.  This does 3 different searches in order to 
     * find the correct information.
     */
    def search = {

        def reviewCriteria = Review.createCriteria()
        def reviewResults = reviewCriteria {
            or {
                ilike("title", "%${params.query}%")
                ilike("text", "%${params.query}%")
            }
        }
        
        [ 
            albums: Album.findAllByNameIlike("%${params.query}%"), 
            artists: Artist.findAllByNameIlike("%${params.query}%"), 
            reviews: reviewResults,
            query: params.query
        ]
    }
}

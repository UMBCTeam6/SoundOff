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
}

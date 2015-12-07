package tp1grails

class RedirectController {

    def index() {
        if (session.utilisateur) {
            redirect(action: "home")
        } else {
            redirect(action: "login")
        }
    }

    def login() {
        if (session.utilisateur) {
            redirect(action: 'home')
        } else {
            render(view: '/login')
        }
    }

    def home() {
        if (session.utilisateur) {
            if (session.utilisateur.role.equals("admin")) {
                render(view: '/index')
            } else {
                render(view: '/front/index')
            }
        } else {
            redirect(action: 'login')
        }
    }
}

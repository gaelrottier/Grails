package tp1grails.front

import grails.transaction.Transactional
import tp1grails.Utilisateur
import tp1grails.UtilisateurController

import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.OK

class UtilisateurFrontController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = [action: this.&auth]

    private auth() {
        if (!session.utilisateur) {
            redirect(controller: 'redirect', action: 'login')
            return false
        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Utilisateur.list(params), model: [utilisateurInstanceCount: Utilisateur.count()]
    }

    def show(Utilisateur utilisateurInstance) {
        respond utilisateurInstance
    }

    def edit() {
        respond session.utilisateur
    }

    @Transactional
    def update(Utilisateur utilisateurInstance) {

        if (utilisateurInstance == null) {
            notFound()
            return
        }

        if (utilisateurInstance.hasErrors()) {
            respond utilisateurInstance.errors, view: 'edit'
            return
        }

        utilisateurInstance.save flush: true
        session.utilisateur = utilisateurInstance

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), utilisateurInstance.id])
                redirect(controller: "utilisateurFront", action: "show", id: utilisateurInstance.id)
            }
            '*' { respond utilisateurInstance, [status: OK] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateur.label', default: 'tp1grails.Utilisateur'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

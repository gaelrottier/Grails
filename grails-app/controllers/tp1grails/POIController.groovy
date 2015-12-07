package tp1grails

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class POIController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = [action: this.&auth]

    private auth() {
        if (!session.utilisateur || !session.utilisateur.role.equals("admin")) {
            redirect(controller: 'redirect', action: 'login')
            return false
        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond POI.list(params), model: [POIInstanceCount: POI.count()]
    }

    def show(POI POIInstance) {
        respond POIInstance
    }

    def create() {
        respond new POI(params)
    }

    @Transactional
    def save(POI POIInstance) {
        if (POIInstance == null) {
            notFound()
            return
        }

        if (POIInstance.hasErrors()) {
            respond POIInstance.errors, view: 'create'
            return
        }

        POIInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poi.label', default: 'tp1grails.POI'), POIInstance.id])
                redirect POIInstance
            }
            '*' { respond POIInstance, [status: CREATED] }
        }
    }

    def edit(POI POIInstance) {
        respond POIInstance
    }

    @Transactional
    def update(POI POIInstance) {
        if (POIInstance == null) {
            notFound()
            return
        }

        if (POIInstance.hasErrors()) {
            respond POIInstance.errors, view: 'edit'
            return
        }

        POIInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poi.label', default: 'tp1grails.POI'), POIInstance.id])
                redirect POIInstance
            }
            '*' { respond POIInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(POI POIInstance) {

        if (POIInstance == null) {
            notFound()
            return
        }

        POIInstance.evaluations.each { e ->
            e.delete()
        }

        POIInstance.groupes.each { g ->
            g.removeFromPoints(POIInstance)
        }

        POIInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poi.label', default: 'tp1grails.POI'), POIInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poi.label', default: 'tp1grails.POI'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

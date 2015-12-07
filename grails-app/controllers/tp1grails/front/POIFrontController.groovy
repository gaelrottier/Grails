package tp1grails.front

import grails.transaction.Transactional
import tp1grails.Groupe
import tp1grails.POI

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.OK

class POIFrontController {

    static allowedMethods = [save: "POST", update: "PUT"]

    def beforeInterceptor = [action: this.&auth]

    private auth() {
        if (!session.utilisateur) {
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

        List<Groupe> groupes = POIInstance.groupes.collect()
        groupes.each { g ->
            POIInstance.removeFromGroupes(g)
        }

        POIInstance.save flush: true

        params['groupes'].each { g ->
            POIInstance.addToGroupes(Groupe.findWhere(id: Long.parseLong(g)))
        }

        POIInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poi.label', default: 'tp1grails.POI'), POIInstance.id])
                redirect(controller: "POIFront", action: "show", id: POIInstance.id)
            }
            '*' { respond POIInstance, [status: OK] }
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

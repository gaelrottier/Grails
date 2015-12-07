import tp1grails.Utilisateur
import tp1grails.POI

class BootStrap {
    def populateDBService

    def init = { servletContext ->
        populateDBService.populate()
    }
    def destroy = {
    }
}

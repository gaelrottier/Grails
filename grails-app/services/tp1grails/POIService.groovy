package tp1grails

import grails.transaction.Transactional

@Transactional
class POIService {

    def serviceMethod() {

    }

    def createPOI(params) {
        try {
            POI poi = new POI(nom: params.nom, latitude: params.latitude, longitude: params.longitude, description: params.description)
            poi.save(failOnError: true)
            return poi
        } catch(e) {
            println(e)
            println("erreur creation POI")
        }
    }
}

package tp1grails

import grails.transaction.Transactional

@Transactional
class GroupeService {

    def createGroup(params) {
        try {
            Groupe groupe = new Groupe(nom: params.nom)
            POI[] pois = params.pois

            for(int i =0; i < pois.length; i++) {
                groupe.addToPoints(pois[i]);
            }

            groupe.save(failOnError: true)
            return groupe
        } catch(e) {
            println e
            println("erreur creation groupe")
        }
    }
}

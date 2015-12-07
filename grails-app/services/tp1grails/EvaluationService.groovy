package tp1grails

import grails.transaction.Transactional

@Transactional
class EvaluationService {

    def serviceMethod() {

    }

    def createEvaluation(params) {
        try {
            Evaluation ev = new Evaluation(note: params.note, commentaire: params.commentaire)

            POI poi = params.poi
            poi.addToEvaluations(ev)
            poi.save(failOnError: true)

            Utilisateur utilisateur = params.utilisateur
            utilisateur.addToEvaluations(ev)
            utilisateur.save(failOnError: true)
        } catch(e) {
            println e
            println("erreur creation evaluation")
        }
    }
}

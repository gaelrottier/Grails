package tp1grails

import grails.transaction.Transactional

@Transactional
class UtilisateurService {

    def serviceMethod() {
    }

    def createUtilisateur(params) {
        try {
            Utilisateur utilisateur = new Utilisateur(nom: params.nom, prenom: params.prenom, email: params.email, password: params.password.encodeAsMD5(), role: params.role)
            utilisateur.save(failOnError: true)
            return utilisateur
        } catch(e) {
            println e
            println("erreur creation user")
        }
    }
}

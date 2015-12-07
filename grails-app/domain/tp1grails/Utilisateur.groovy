package tp1grails

import tp1grails.Evaluation

/**
 * Created by Nicolas on 28/10/2015.
 */
class Utilisateur {
    String nom
    String prenom
    String email
    String password
    String role

    static hasMany = [evaluations:Evaluation]

    static constraints = {
        nom blank:false, size: 2..15
        prenom blank:false, size: 2..15
        email blank:false, size: 2..30
        password blank:false, nullable:false
    }
}

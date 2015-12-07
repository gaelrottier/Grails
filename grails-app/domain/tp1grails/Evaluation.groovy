package tp1grails
/**
 * Created by Nicolas on 28/10/2015.
 */
class Evaluation {
    int note
    String commentaire

    static belongsTo = [utilisateur:Utilisateur]
    static hasOne = [poi:POI]

    static constraints = {
        note nullable:false, min:1, max:5
        commentaire blank:false
    }
}

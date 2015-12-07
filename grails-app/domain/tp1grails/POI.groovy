package tp1grails
/**
 * Created by Nicolas on 28/10/2015.
 */
class POI {
    String nom
    double latitude
    double longitude
    String description

    static belongsTo = [Groupe]
    static hasMany = [images:Image, evaluations:Evaluation, groupes:Groupe]

    static constraints = {
        nom blank:false, size: 2..60
    }
}

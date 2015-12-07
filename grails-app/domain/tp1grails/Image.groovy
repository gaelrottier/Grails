package tp1grails
/**
 * Created by Nicolas on 28/10/2015.
 */
class Image {
    String chemin

    static belongsTo = [POI, Groupe]
    static hasMany = [points:POI, groupes:Groupe]

    static constraints = {
        chemin blank:false
    }
}

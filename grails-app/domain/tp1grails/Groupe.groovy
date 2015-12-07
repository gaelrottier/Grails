package tp1grails
/**
 * Created by Nicolas on 28/10/2015.
 */
class Groupe {
    String nom

    static hasMany = [images:Image, points:POI]

    static constraints = {
        nom blank:false, size: 2..60
    }

}

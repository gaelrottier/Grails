package tp1grails

import grails.transaction.Transactional

@Transactional
class PopulateDBService {
    def utilisateurService
    def evaluationService
    def groupeService
    def POIService

    def populate() {
        POI poiNice1 = POIService.createPOI(nom: "Place massena", latitude: 43.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")
        POI poiNice2 = POIService.createPOI(nom: "Promenade des anglais", latitude: 42.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")
        POI poiNice3 = POIService.createPOI(nom: "Nice étoile", latitude: 41.69726420000001, longitude: 6.27050829999996, description: "Une jolie place")
        POI poiNice4 = POIService.createPOI(nom: "Vielle ville", latitude: 45.69726420000001, longitude: 7.24050829999996, description: "Une jolie place")
        POI poiNice5 = POIService.createPOI(nom: "Le chateau", latitude: 46.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")

        POI[] poisNice = [poiNice1, poiNice2, poiNice3, poiNice4, poiNice5];

        groupeService.createGroup(nom: "Nice", pois: poisNice)

        POI poiParis1 = POIService.createPOI(nom: "Tour eiffel", latitude: 43.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")
        POI poiParis2 = POIService.createPOI(nom: "Les invalides", latitude: 42.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")
        POI poiParis3 = POIService.createPOI(nom: "Notre dame", latitude: 41.69726420000001, longitude: 6.27050829999996, description: "Une jolie place")
        POI poiParis4 = POIService.createPOI(nom: "Gare du nord", latitude: 45.69726420000001, longitude: 7.24050829999996, description: "Une jolie place")
        POI poiParis5 = POIService.createPOI(nom: "Viel opéra", latitude: 46.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")

        POI[] poisParis = [poiParis1, poiParis2, poiParis3, poiParis4, poiParis5];

        groupeService.createGroup(nom: "Paris", pois: poisParis)

        POI poiLondres1 = POIService.createPOI(nom: "Chateau", latitude: 43.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")
        POI poiLondres2 = POIService.createPOI(nom: "Big ben", latitude: 42.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")
        POI poiLondres3 = POIService.createPOI(nom: "Stade olympique", latitude: 41.69726420000001, longitude: 6.27050829999996, description: "Une jolie place")
        POI poiLondres4 = POIService.createPOI(nom: "Grande roue", latitude: 45.69726420000001, longitude: 7.24050829999996, description: "Une jolie place")
        POI poiLondres5 = POIService.createPOI(nom: "Quartier des pauvres", latitude: 46.69726420000001, longitude: 7.27050829999996, description: "Une jolie place")

        POI[] poisLondres = [poiLondres1, poiLondres2, poiLondres3, poiLondres4, poiLondres5];

        groupeService.createGroup(nom: "Londres", pois: poisLondres)

        Utilisateur utilisateur1 = utilisateurService.createUtilisateur(nom: "Jean", prenom: "Bide", email: "Jean.Bide@tokidev.com", password: "pass", role:"admin")
        Utilisateur utilisateur2 = utilisateurService.createUtilisateur(nom: "Jean", prenom: "Chaise", email: "Jean.Chaise@tokidev.com", password: "pass", role:"user")
        Utilisateur utilisateur3 = utilisateurService.createUtilisateur(nom: "Jean", prenom: "Table", email: "Jean.Table@tokidev.com", password: "pass", role:"admin")
        Utilisateur utilisateur4 = utilisateurService.createUtilisateur(nom: "Jean", prenom: "Caisse", email: "Jean.Caisse@tokidev.com", password: "pass", role:"user")
        Utilisateur utilisateur5 = utilisateurService.createUtilisateur(nom: "Jean", prenom: "Ty", email: "Jean.Ty@tokidev.com", password: "pass", role:"user")

        evaluationService.createEvaluation(poi: poiNice1, utilisateur: utilisateur1, note: 4, commentaire: "J'ai marché dans une crotte mais la place était très belle")
        evaluationService.createEvaluation(poi: poiParis1, utilisateur: utilisateur5, note: 1, commentaire: "Des policiers partout ça pue l'insécurité")
        evaluationService.createEvaluation(poi: poiLondres3, utilisateur: utilisateur2, note: 3, commentaire: "Beau mais desert...")
        evaluationService.createEvaluation(poi: poiLondres4, utilisateur: utilisateur3, note: 5, commentaire: "Grande et en plus elle tourne !")
        evaluationService.createEvaluation(poi: poiNice5, utilisateur: utilisateur4, note: 5, commentaire: "C'est beau")
    }
}

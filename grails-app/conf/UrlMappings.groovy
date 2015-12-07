class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "redirect", action: "index")
        "500"(view: '/error')
        "/home"(controller: "redirect", action: "home")
        "/login"(controller: "redirect", action: "login")

        name "user": "/user/$action" { controller = "utilisateurFront" }

        name "poi": "/poi/$action" { controller = "POIFront" }

        name "groupe": "/group/$action" {controller = "groupeFront"}
    }
}
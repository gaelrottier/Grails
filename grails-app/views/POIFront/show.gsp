<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityNameS" value="${message(code: 'poi.label.singulier', default: 'tp1grails.POI')}"/>
    <g:set var="entityNameP" value="${message(code: 'poi.label.pluriel', default: 'tp1grails.POI')}"/>
    <g:set var="groupesP" value="${message(code: 'groupe.label.pluriel', default: 'groupe')}"/>
    <g:set var="profil" value="${message(code: 'utilisateur.my.profile.label', default: 'profil')}"/>
    <title><g:message code="default.show.label" args="[entityNameS]"/></title>
</head>

<body>
<a href="#show-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" url="${createLink(mapping: "group", action: "index")}"><g:message
                code="default.list.label" args="[groupesP]"/></g:link></li>
        <li><g:link class="list" url="${createLink(mapping: "poi", action: "index")}"><g:message
                code="default.list.label" args="[entityNameP]"/></g:link></li>
        <li><g:link class="edit"
                    url="${createLink(mapping: "user", action: "show", id: session.utilisateur.id)}"><g:message
                    code="utilisateur.my.profile.label"/></g:link></li>
        <li><g:link class="create" action="create" mapping="poi"><g:message code="default.new.label.masculin" args="[entityNameS]" /></g:link></li>

    </ul>
</div>

<div id="show-POI" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityNameS]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list POI">

        <g:if test="${POIInstance?.nom}">
            <li class="fieldcontain">
                <span id="nom-label" class="property-label"><g:message code="POI.nom.label" default="Nom"/></span>

                <span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${POIInstance}"
                                                                                       field="nom"/></span>

            </li>
        </g:if>

        <g:if test="${POIInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="POI.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${POIInstance}"
                                                                                               field="description"/></span>

            </li>
        </g:if>

        <g:if test="${POIInstance?.evaluations}">
            <li class="fieldcontain">
                <span id="evaluations-label" class="property-label"><g:message code="POI.evaluations.label"
                                                                               default="Evaluations"/></span>

                <g:each in="${POIInstance.evaluations}" var="e">
                    <span class="property-value"
                          aria-labelledby="evaluations-label">${e?.utilisateur.nom + " " + e?.utilisateur.prenom + " : " + e?.commentaire + " : " + e?.note}</span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${POIInstance?.groupes}">
            <li class="fieldcontain">
                <span id="groupes-label" class="property-label"><g:message code="POI.groupes.label"
                                                                           default="Groupes"/></span>

                <g:each in="${POIInstance.groupes}" var="g">
                    <span class="property-value" aria-labelledby="groupes-label"><g:link controller="groupe"
                                                                                         action="show"
                                                                                         id="${g.id}">${g?.nom}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${POIInstance?.images}">
            <li class="fieldcontain">
                <span id="images-label" class="property-label"><g:message code="POI.images.label"
                                                                          default="Images"/></span>

                <g:each in="${POIInstance.images}" var="i">
                    <span class="property-value" aria-labelledby="images-label"><g:link controller="image" action="show"
                                                                                        id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${POIInstance?.latitude}">
            <li class="fieldcontain">
                <span id="latitude-label" class="property-label"><g:message code="POI.latitude.label"
                                                                            default="Latitude"/></span>

                <span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${POIInstance}"
                                                                                            field="latitude"/></span>

            </li>
        </g:if>

        <g:if test="${POIInstance?.longitude}">
            <li class="fieldcontain">
                <span id="longitude-label" class="property-label"><g:message code="POI.longitude.label"
                                                                             default="Longitude"/></span>

                <span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${POIInstance}"
                                                                                             field="longitude"/></span>

            </li>
        </g:if>

    </ol>

    <g:form class="fieldcontain" url="[mapping: 'poi', resource: POIInstance, action: 'comment']" method="POST">
        <label for="note">Note :</label>
        <input type="number" name="note" id="note" step="1" min="0" max="5">/5<br><br>
        <label for="evaluation">
            <g:message code="evaluation.label" default="Evaluation"/>
            <span class="required-indicator">*</span>
        </label>
        <g:textArea name="evaluation" required=""/><br>
        <g:actionSubmit class="btn-danger" action="comment" name="Commenter" value="Commenter"/>
    </g:form>

    <fieldset class="buttons">
        <g:link class="edit"
                url="[mapping: 'poi', resource: POIInstance, action: 'edit']"><g:message
                code="default.button.edit.label"
                default="Edit"/></g:link>
    </fieldset>

</div>
</body>
</html>

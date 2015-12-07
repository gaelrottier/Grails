<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityNameS" value="${message(code: 'utilisateur.label.singulier', default: 'tp1grails.Utilisateur')}"/>
    <g:set var="entityNameP" value="${message(code: 'utilisateur.label.pluriel', default: 'tp1grails.utilisateur')}"/>
    <title><g:message code="default.show.label" args="[entityNameS]"/></title>
</head>

<body>
<a href="#show-utilisateur" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                           args="[entityNameP]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label.voyelle"
                                                              args="[entityNameS]"/></g:link></li>
    </ul>
</div>

<div id="show-utilisateur" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityNameS]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list utilisateur">

        <g:if test="${utilisateurInstance?.nom}">
            <li class="fieldcontain">
                <span id="nom-label" class="property-label"><g:message code="utilisateur.nom.label"
                                                                       default="Nom"/></span>

                <span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${utilisateurInstance}"
                                                                                       field="nom"/></span>

            </li>
        </g:if>

        <g:if test="${utilisateurInstance?.prenom}">
            <li class="fieldcontain">
                <span id="prenom-label" class="property-label"><g:message code="utilisateur.prenom.label"
                                                                          default="Prenom"/></span>

                <span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${utilisateurInstance}"
                                                                                          field="prenom"/></span>

            </li>
        </g:if>

        <g:if test="${utilisateurInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="utilisateur.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${utilisateurInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${utilisateurInstance?.evaluations}">
            <li class="fieldcontain">
                <span id="evaluations-label" class="property-label"><g:message code="utilisateur.evaluations.label"
                                                                               default="Evaluations"/></span>

                <g:each in="${utilisateurInstance.evaluations}" var="e">
                    <span class="property-value" aria-labelledby="evaluations-label"><g:link controller="evaluation"
                                                                                             action="show"
                                                                                             id="${e.id}">${e?.utilisateur.nom + " " + e?.utilisateur.prenom + " : " + e.note}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: utilisateurInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${utilisateurInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>

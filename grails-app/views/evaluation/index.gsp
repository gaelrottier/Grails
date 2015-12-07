<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityNameP" value="${message(code: 'evaluation.label.pluriel', default: 'tp1grails.Evaluations')}"/>
    <g:set var="entityNameS" value="${message(code: 'evaluation.label.singulier', default: 'tp1grails.Evaluation')}"/>
    <title><g:message code="default.list.label" args="[entityNameP]"/></title>
</head>

<body>
<a href="#list-evaluation" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label.feminin"
                                                              args="[entityNameS]"/></g:link></li>
    </ul>
</div>

<div id="list-evaluation" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityNameP]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="note" title="${message(code: 'evaluation.note.label', default: 'Note')}"/>

            <g:sortableColumn property="commentaire"
                              title="${message(code: 'evaluation.commentaire.label', default: 'Commentaire')}"/>

            <th><g:message code="evaluation.poi.label" default="Poi"/></th>

            <th><g:message code="evaluation.utilisateur.label" default="tp1grails.Utilisateur"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${evaluationInstanceList}" status="i" var="evaluationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${evaluationInstance.id}">${fieldValue(bean: evaluationInstance, field: "note")}</g:link></td>

                <td>${fieldValue(bean: evaluationInstance, field: "commentaire")}</td>

                <td><g:link controller="POI" action="show"
                            id="${evaluationInstance.poi.id}">${fieldValue(bean: evaluationInstance, field: "poi.nom")}</g:link></td>

                <td><g:link controller="utilisateur" action="show" id="${evaluationInstance.utilisateur.id}">${fieldValue(bean: evaluationInstance, field: "utilisateur.nom") + " " + fieldValue(bean: evaluationInstance, field: "utilisateur.prenom")}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${evaluationInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>

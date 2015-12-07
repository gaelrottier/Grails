<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityNameP" value="${message(code: 'utilisateur.label.pluriel', default: 'utilisateur')}"/>
    <g:set var="groupesP" value="${message(code: 'groupe.label.pluriel', default: 'groupe')}"/>
    <g:set var="poiP" value="${message(code: 'poi.label.pluriel', default: 'poi')}"/>
    <title>Welcome to Grails</title>
</head>

<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" url="${createLink(mapping: "group", action: "index")}"><g:message
                code="default.list.label" args="[groupesP]"/></g:link></li>
        <li><g:link class="list" url="${createLink(mapping: "poi", action: "index")}"><g:message
                code="default.list.label" args="[poiP]"/></g:link></li>
        <li><g:link class="edit"
                    url="${createLink(mapping: "user", action: "show", id: session.utilisateur.id)}"><g:message
                    code="utilisateur.my.profile.label"/></g:link></li>
    </ul>
</div>

<div id="page-body" role="main">
    Welcome ${session.utilisateur.nom + " " + session.utilisateur.prenom}
</div>

</body>
</html>

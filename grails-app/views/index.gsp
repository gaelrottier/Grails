<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>

<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="page-body" role="main">
    <g:if test="${session.utilisateur.role.equals("admin")}">

        <h1>Welcome, admin ${session.utilisateur.nom + " " + session.utilisateur.prenom}</h1>

        <div id="controller-list" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                    <g:if test="${c.logicalPropertyName != "dbdoc" && c.logicalPropertyName != "redirect" && c.packageName != "tp1grails.front"}">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
                    </g:if>
                </g:each>
            </ul>
        </div>
    </g:if>
    <g:else>
        Welcome ${session.utilisateur.nom + " " + session.utilisateur.prenom}
    </g:else>
</div>

</body>
</html>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <asset:stylesheet src="login.css"/>
</head>

<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="page-body" role="main">

    <g:form url="[action:'login', controller:'Utilisateur']" class="login-block">
        <h1>Connexion</h1>
        <input class="input-login" type="text" value="" placeholder="Email" id="email" name="email"/>
        <input class="input-login" type="password" value="" placeholder="Password" id="password" name="password"/>
        <input type="checkbox" name="remember"/>Se souvenir de moi
        <g:submitButton class="btnConn" name="Se connecter"/>
    </g:form>
</div>
</body>
</html>
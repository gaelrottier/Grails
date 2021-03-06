<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityNameS" value="${message(code: 'utilisateur.label.singulier', default: 'tp1grails.Utilisateur')}"/>
    <g:set var="entityNameP" value="${message(code: 'utilisateur.label.pluriel', default: 'tp1grails.utilisateur')}"/>
    <title><g:message code="default.edit.label" args="[entityNameS]"/></title>
</head>

<body>
<a href="#edit-utilisateur" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="edit-utilisateur" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityNameS]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${utilisateurInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${utilisateurInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[mapping: 'user', resource: utilisateurInstance, action: 'update']" method="PUT">
        <g:hiddenField name="version" value="${utilisateurInstance?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>

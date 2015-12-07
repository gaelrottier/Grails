<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityNameS" value="${message(code: 'poi.label.singulier', default: 'tp1grails.POI')}" />
		<g:set var="entityNameP" value="${message(code: 'poi.label.pluriel', default: 'tp1grails.POI')}" />
		<title><g:message code="default.edit.label" args="[entityNameS]" /></title>
	</head>
	<body>
		<a href="#edit-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityNameP]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label.masculin" args="[entityNameS]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-POI" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityNameS]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${POIInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${POIInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:POIInstance, mapping:'poi', action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${POIInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

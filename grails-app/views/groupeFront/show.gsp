

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityNameS" value="${message(code: 'groupe.label.singulier', default: 'tp1grails.Groupe')}" />
		<g:set var="entityNameP" value="${message(code: 'groupe.label.pluriel', default: 'tp1grails.Groupe')}" />
		<title><g:message code="default.show.label" args="[entityNameS]" /></title>
	</head>
	<body>
		<a href="#show-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityNameP]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label.masculin" args="[entityNameS]" /></g:link></li>
			</ul>
		</div>
		<div id="show-groupe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityNameS]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list groupe">
			
				<g:if test="${groupeInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="groupe.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${groupeInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.images}">
				<li class="fieldcontain">
					<span id="images-label" class="property-label"><g:message code="groupe.images.label" default="Images" /></span>
					
						<g:each in="${groupeInstance.images}" var="i">
						<span class="property-value" aria-labelledby="images-label"><g:link controller="image" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${groupeInstance?.points}">
				<li class="fieldcontain">
					<span id="points-label" class="property-label"><g:message code="groupe.points.label" default="Points" /></span>
					
						<g:each in="${groupeInstance.points}" var="p">
						<span class="property-value" aria-labelledby="points-label"><g:link controller="POI" action="show" id="${p.id}">${p.nom}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:groupeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${groupeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

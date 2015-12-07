

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityNameS" value="${message(code: 'image.label.singulier', default: 'tp1grails.Image')}" />
		<g:set var="entityNameP" value="${message(code: 'image.label.pluriel', default: 'tp1grails.image')}" />
		<title><g:message code="default.show.label" args="[entityNameP]" /></title>
	</head>
	<body>
		<a href="#show-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityNameP]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label.feminin" args="[entityNameS]" /></g:link></li>
			</ul>
		</div>
		<div id="show-image" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityNameS]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list image">
			
				<g:if test="${imageInstance?.chemin}">
				<li class="fieldcontain">
					<span id="chemin-label" class="property-label"><g:message code="image.chemin.label" default="Chemin" /></span>
					
						<span class="property-value" aria-labelledby="chemin-label"><g:fieldValue bean="${imageInstance}" field="chemin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.groupes}">
				<li class="fieldcontain">
					<span id="groupes-label" class="property-label"><g:message code="image.groupes.label" default="Groupes" /></span>
					
						<g:each in="${imageInstance.groupes}" var="g">
						<span class="property-value" aria-labelledby="groupes-label"><g:link controller="groupe" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.points}">
				<li class="fieldcontain">
					<span id="points-label" class="property-label"><g:message code="image.points.label" default="Points" /></span>
					
						<g:each in="${imageInstance.points}" var="p">
						<span class="property-value" aria-labelledby="points-label"><g:link controller="POI" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:imageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${imageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

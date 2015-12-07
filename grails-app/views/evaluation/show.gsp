

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityNameP" value="${message(code: 'evaluation.label.pluriel', default: 'tp1grails.Evaluations')}"/>
		<g:set var="entityNameS" value="${message(code: 'evaluation.label.singulier', default: 'tp1grails.Evaluation')}"/>
		<title><g:message code="default.show.label" args="[entityNameS]" /></title>
	</head>
	<body>
		<a href="#show-evaluation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityNameP]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label.feminin" args="[entityNameS]" /></g:link></li>
			</ul>
		</div>
		<div id="show-evaluation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityNameS]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list evaluation">
			
				<g:if test="${evaluationInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="evaluation.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${evaluationInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluationInstance?.commentaire}">
				<li class="fieldcontain">
					<span id="commentaire-label" class="property-label"><g:message code="evaluation.commentaire.label" default="Commentaire" /></span>
					
						<span class="property-value" aria-labelledby="commentaire-label"><g:fieldValue bean="${evaluationInstance}" field="commentaire"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluationInstance?.poi}">
				<li class="fieldcontain">
					<span id="poi-label" class="property-label"><g:message code="evaluation.poi.label" default="Poi" /></span>
					
						<span class="property-value" aria-labelledby="poi-label"><g:link controller="POI" action="show" id="${evaluationInstance?.poi?.id}">${fieldValue(bean: evaluationInstance, field: "poi.nom")}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluationInstance?.utilisateur}">
				<li class="fieldcontain">
					<span id="utilisateur-label" class="property-label"><g:message code="evaluation.utilisateur.label" default="tp1grails.Utilisateur" /></span>
					
						<span class="property-value" aria-labelledby="utilisateur-label"><g:link controller="utilisateur" action="show" id="${evaluationInstance?.utilisateur?.id}">${fieldValue(bean: evaluationInstance, field: "utilisateur.nom") + " " + fieldValue(bean: evaluationInstance, field: "utilisateur.prenom")}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:evaluationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${evaluationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

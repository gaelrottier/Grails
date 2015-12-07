<%@ page import="tp1grails.POI; tp1grails.Utilisateur" %>




<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="evaluation.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="note" type="number" min="1" max="5" value="${evaluationInstance.note}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'commentaire', 'error')} required">
	<label for="commentaire">
		<g:message code="evaluation.commentaire.label" default="Commentaire" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="commentaire" required="" value="${evaluationInstance?.commentaire}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'poi', 'error')} required">
	<label for="${evaluationInstance.poi.id}">
		<g:message code="evaluation.poi.label" default="Poi" />
		<span class="required-indicator">*</span>
	</label>
	<g:link controller="POI" action="show"
			id="${evaluationInstance.poi.id}">${fieldValue(bean: evaluationInstance, field: "poi.nom")}</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'utilisateur', 'error')} required">
	<label for="${evaluationInstance.utilisateur.id}">
		<g:message code="evaluation.utilisateur.label" default="tp1grails.Utilisateur" />
		<span class="required-indicator">*</span>
	</label>
	<g:link controller="utilisateur" action="show" id="${evaluationInstance.utilisateur.id}">${fieldValue(bean: evaluationInstance, field: "utilisateur.nom") + " " + fieldValue(bean: evaluationInstance, field: "utilisateur.prenom")}</g:link>

</div>


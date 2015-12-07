<%@ page import="tp1grails.Image; tp1grails.POI" %>




<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="groupe.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" maxlength="60" required="" value="${groupeInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'images', 'error')} ">
	<label for="images">
		<g:message code="groupe.images.label" default="Images" />
		
	</label>
	<g:select name="images" from="${tp1grails.Image.list()}" multiple="multiple" optionKey="id" size="5" value="${groupeInstance?.images*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'points', 'error')} ">
	<label for="points">
		<g:message code="groupe.points.label" default="Points" />
		
	</label>
	<g:select name="points" from="${tp1grails.POI.list()}" multiple="multiple" optionKey="id" size="5" value="${groupeInstance?.points?.id}" optionValue="nom" class="many-to-many"/>

</div>


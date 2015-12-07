<%@ page import="tp1grails.Image" %>




<div class="fieldcontain ${hasErrors(bean: POIInstance, field: 'nom', 'error')} required">
    <label for="nom">
        <g:message code="POI.nom.label" default="Nom"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nom" maxlength="60" required="" value="${POIInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: POIInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="POI.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="description" required="" value="${POIInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: POIInstance, field: 'groupes', 'error')} required">
    <label for="groupes">
        <g:message code="POI.groupes.label" default="Groupes"/>
    </label>
    <g:select name="groupes" from="${tp1grails.Groupe.list()}" multiple="multiple" optionKey="id" optionValue="nom" size="5"
              value="${POIInstance?.groupes*.id }" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: POIInstance, field: 'images', 'error')} ">
    <label for="images">
        <g:message code="POI.images.label" default="Images"/>

    </label>
    <g:select name="images" from="${tp1grails.Image.list()}" multiple="multiple" optionKey="id" size="5"
              value="${POIInstance?.images*.chemin}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: POIInstance, field: 'latitude', 'error')} required">
    <label for="latitude">
        <g:message code="POI.latitude.label" default="Latitude"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="latitude" value="${fieldValue(bean: POIInstance, field: 'latitude')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: POIInstance, field: 'longitude', 'error')} required">
    <label for="longitude">
        <g:message code="POI.longitude.label" default="Longitude"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="longitude" value="${fieldValue(bean: POIInstance, field: 'longitude')}" required=""/>

</div>


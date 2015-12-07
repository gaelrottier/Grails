

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityNameS" value="${message(code: 'poi.label.singulier', default: 'tp1grails.POI')}" />
		<g:set var="entityNameP" value="${message(code: 'poi.label.pluriel', default: 'tp1grails.POI')}" />
		<title><g:message code="default.list.label" args="[entityNameS]" /></title>
	</head>
	<body>
		<a href="#list-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label.masculin" args="[entityNameS]" /></g:link></li>
			</ul>
		</div>
		<div id="list-POI" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityNameP]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'tp1grails.POI.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'tp1grails.POI.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="latitude" title="${message(code: 'tp1grails.POI.latitude.label', default: 'Latitude')}" />
					
						<g:sortableColumn property="longitude" title="${message(code: 'tp1grails.POI.longitude.label', default: 'Longitude')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${POIInstanceList}" status="i" var="POIInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${POIInstance.id}">${fieldValue(bean: POIInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: POIInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: POIInstance, field: "latitude")}</td>
					
						<td>${fieldValue(bean: POIInstance, field: "longitude")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${POIInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

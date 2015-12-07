

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityNameS" value="${message(code: 'groupe.label.singulier', default: 'tp1grails.Groupe')}" />
		<g:set var="entityNameP" value="${message(code: 'groupe.label.pluriel', default: 'tp1grails.Groupe')}" />
		<title><g:message code="default.list.label" args="[entityNameS]" /></title>
	</head>
	<body>
		<a href="#list-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label.masculin" args="[entityNameS]" /></g:link></li>
			</ul>
		</div>
		<div id="list-groupe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityNameP]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'groupe.nom.label', default: 'Nom')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${groupeInstanceList}" status="i" var="groupeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${groupeInstance.id}">${fieldValue(bean: groupeInstance, field: "nom")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${groupeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

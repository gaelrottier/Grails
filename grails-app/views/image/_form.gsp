



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'chemin', 'error')} required">
	<label for="chemin">
		<g:message code="image.chemin.label" default="Chemin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="chemin" required="" value="${imageInstance?.chemin}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'nom', 'error')} required">
    <label for="nom">
        <g:message code="utilisateur.nom.label" default="Nom"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nom" maxlength="15" required="" value="${utilisateurInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'prenom', 'error')} required">
    <label for="prenom">
        <g:message code="utilisateur.prenom.label" default="Prenom"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="prenom" maxlength="15" required="" value="${utilisateurInstance?.prenom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: utilisateurInstance, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="utilisateur.email.label" default="Email"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="email" maxlength="30" required="" value="${utilisateurInstance?.email}"/>

</div>

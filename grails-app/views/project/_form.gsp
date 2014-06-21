<%@ page import="com.scrum.Project" %>

<!-- Text input-->
<div class="control-group input-group-lg ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
    <label class="control-label" for="name">Name</label>*
    <div class="controls">
        <input type="text" class="form-control" placeholder="Project Name.." id="name" name="name" required="" value="${projectInstance.name}">
    </div>
</div>
<br />

<!-- Textarea -->
<div class="control-group ${hasErrors(bean: projectInstance, field: 'description', 'error')}">
    <label class="control-label" for="description">Description</label>*
    <div class="controls">
        <textarea id="description"  class="form-control" name="description" placeholder="Description..." required="true">${projectInstance?.description}</textarea>
    </div>
</div>
<br/>
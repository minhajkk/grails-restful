<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div id="create-project" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${projectInstance}">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="list-group-item list-group-item-danger"><strong>Oh snap!</strong></div>
                <div class="list-group">
                    <g:eachError bean="${projectInstance}" var="error"> <div class="list-group-item list-group-item-danger"><g:message error="${error}"/></div> </g:eachError>
                </div>
            </div>
        </div>
    </g:hasErrors>
    <g:form url="[resource: projectInstance, action: 'save']" name="projectForm" method="POST">
        <g:render template="form"/>
        <input type="submit" class="btn btn-primary btn-lg" value="Create" />
    </g:form>
</div>
</body>
</html>

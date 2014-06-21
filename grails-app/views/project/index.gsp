<%@ page import="com.scrum.Project" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<g:if test="${flash.message}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        ${flash.message}
    </div>
</g:if>
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading"><g:message code="default.list.label" args="[entityName]"/></div>
    <g:if test="${!projectInstanceList}">
        <div class="jumbotron">
            <h1>Looks there's no project created yet...!!!!</h1>
            <br/>
            <p><g:link controller="project" action="create" class="btn btn-primary btn-lg" role="button">Create Project...</g:link></p>
        </div>
    </g:if>
    <g:else>
        <!-- Table -->
        <table class="table">
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Created By</th>
                <th>Date Created</th>
                <th></th>
            </tr>
            <tbody>
            <g:each in="${projectInstanceList}" status="i" var="projectInstance">
                <tr>
                    <td>
                        <g:link action="show"
                                id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "name")}</g:link>
                        <span class="badge">${projectInstance.tasks.size()}</span>
                    </td>

                    <td>${fieldValue(bean: projectInstance, field: "description")}</td>

                    <td>${fieldValue(bean: projectInstance, field: "createdBy.username")}</td>

                    <td><g:formatDate date="${projectInstance.dateCreated}" format="yyyy-MM-dd"/></td>
                    <td>
                        <g:form name="delForm${projectInstance.id}" controller="project" action="delete" method="delete">
                            <g:hiddenField name="id" value="${projectInstance.id}"/>
                            <a class="glyphicon glyphicon-trash" href="javascript:void(0);" onclick="$(this).closest('form').submit();"></a>
                        </g:form>
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </g:else>
</div>
</body>
</html>

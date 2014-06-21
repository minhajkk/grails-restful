<%@ page import="com.scrum.Project" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
    <g:if test="${flash.message}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    <div class="jumbotron">
        <h1>${projectInstance.name}</h1><p><a class="btn btn-success btn-lg pull-right" role="button" onclick="$('#task-modal').modal('show');">add task...</a></p>
        <p>${projectInstance.description}</p>
        <g:if test="${projectInstance.tasks}">
            <g:render template="taskList" />
        </g:if>
        <g:else>
            <div class="alert alert-info">No task.</div>
        </g:else>
        <div class="modal fade" id="task-modal">
        <form method="post">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Add Task</h4>
                    </div>
                    <div class="modal-body">
                        <!-- Text input-->
                        <div class="control-group input-group-lg required">
                            <label class="control-label" for="title">Title</label>*
                            <div class="controls">
                                <input type="text" class="form-control" placeholder="Task title.." id="title" name="title" required="true">
                            </div>
                        </div>
                        <br />
                        <!-- Text input-->
                        <div class="control-group input-group-lg required">
                            <label class="control-label" for="description">Description</label>*
                            <div class="controls">
                                <textarea class="form-control" rows="3" placeholder="Task description.." name="description"></textarea>
                            </div>
                        </div>
                        <br/>

                        <div class="control-group input-group-lg required  btn-group btn-input clearfix">
                            <label class="control-label" for="priority">Priority</label>*
                            <div class="controls">
                                <g:select name="priority" from="${com.scrum.PriorityEnum.values()}" class="form-control"/>
                            </div>
                        </div>

                        <div class="control-group input-group-lg required  btn-group btn-input clearfix">
                            <label class="control-label" for="status">Status</label>*
                            <div class="controls">
                                <g:select name="status" from="${com.scrum.StatusEnum.values()}" class="form-control"/>
                            </div>
                        </div>
                        <input type="hidden" name="project" value="${projectInstance.id}">
                        <input type="hidden" name="format" value="json">

                        <div class="control-group input-group-lg required  btn-group btn-input clearfix">
                            <label class="control-label" for="assignedTo">Assign To</label>*
                            <div class="controls">
                                <g:select optionKey="id" optionValue="username" name="assignedTo" from="${com.scrum.auth.User.getAll()}" class="form-control"/>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <g:submitToRemote class="btn btn-primary" url="[action: 'save', controller:'task']" onSuccess="javascript:location.reload();" value="Add Task.." />
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </form>

        </div><!-- /.modal -->
    </div>
</body>
</html>

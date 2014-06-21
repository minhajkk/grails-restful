<table class="table table-hover">
    <thead>
    <tr>
        <th>#</th>
        <th>Title</th>
        <th>Description</th>
        <th>Assigned to</th>
        <th>Reporter</th>
        <th>Priority</th>
        <th>Status</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${projectInstance.tasks}" var="taskInstance">
        <tr>
            <td>
                <g:link controller="task" action="show" id="${taskInstance.id}">
                    ${taskInstance.id}
                </g:link>
            </td>
            <td>${taskInstance.title}</td>
            <td>${taskInstance.description}</td>
            <td>${taskInstance.assignedTo.username}</td>
            <td>${taskInstance.reportedBy.username}</td>
            <td>${taskInstance.priority}</td>
            <td>${taskInstance.status}</td>
            <td>
                <g:form name="delForm${taskInstance.id}" controller="task" action="delete" method="delete">
                    <g:hiddenField name="id" value="${taskInstance.id}"/>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </g:form>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
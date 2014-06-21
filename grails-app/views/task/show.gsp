<%--
  Created by IntelliJ IDEA.
  User: minhaj
  Date: 6/21/14
  Time: 3:48 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.scrum.CommentController; com.scrum.Comment" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Task')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
    <div class="jumbotron">
        <g:if test="${flash.message}">
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                ${flash.message}
            </div>
        </g:if>
        <h1>${taskInstance.title}</h1>
        <p>${taskInstance.description}</p>
        <g:if test="${taskInstance.comments}">
            <g:each in="${taskInstance.comments}" var="commentInstance">
                <div class="panel panel-default">
                    <div class="panel-body">
                        ${commentInstance.description}
                    </div>
                    <div class="panel-footer"><span class="badge">${commentInstance.user.username}</span></div>
                </div>
            </g:each>
        </g:if>

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <g:form controller="comment" action="save" name="commentForm" method="POST">
                <form action="#" method="post" role="form" enctype="multipart/form-data" class="facebook-share-box">

                    <div class="share">
                        <div class="panel panel-default">
                            <div class="panel-heading"><i class="fa fa-file"></i> Post your Comments...</div>
                            <div class="panel-body">
                                <div class="">
                                    <input type="hidden" name="task" value="${taskInstance.id}"/>
                                    <textarea name="description" cols="40" rows="10" id="description" class="form-control message" style="height: 62px; overflow: hidden;" placeholder="What's on your mind ?"></textarea>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <input type="submit" name="submit" value="Post" class="btn btn-primary">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</body>
</html>
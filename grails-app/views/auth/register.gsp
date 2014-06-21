<%--
  Created by IntelliJ IDEA.
  User: techtalk
  Date: 6/15/14
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Register</title>
</head>
<body>
<div class="row">
    <div class="col-sm-6 col-md-4 col-md-offset-4">
        <h1>Create an Account...</h1>

        <div class="account-wall">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="list-group-item list-group-item-danger"><strong>Oh snap!</strong></div>
                        <div class="list-group">
                            <g:eachError bean="${userInstance}" var="error"> <div class="list-group-item list-group-item-danger"><g:message error="${error}"/></div> </g:eachError>
                        </div>
                    </div>
                </div>
            </g:hasErrors>
            <g:form action="save" controller="userRegister" method="POST" name="registerForm" class='cssform' autocomplete='off'>
                <input type="text" class="form-control" placeholder="User Name" id="username" name="username" value="${userInstance?.username}">
                <input type="password" class="form-control" placeholder="Password" id="password" name="password" required="" value="${userInstance?.password}">

                <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>

                <span class="clearfix"></span>
            </g:form>
        </div>

    </div>
</div>

</body>
</html>
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
    <title>Login</title>
</head>
<body>
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Sign in</h1>
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                     alt="">
                <g:if test='${flash.message}'>
                    <div class="alert alert-info">${flash.message}</div>
                </g:if>
                <g:elseif test="${flash.error}">
                    <div class="panel-body">
                        <div class="list-group-item list-group-item-danger"><strong>Oh snap!</strong> ${flash.error}</div>
                    </div>
                </g:elseif>
                <form action="${createLink(uri: '/j_spring_security_check')}" method='POST' id="form-signin" class="cssform" autocomplete="off">
                    <input type="text" name="j_username"  class="form-control" placeholder="Username" required autofocus>
                    <input type="password" name="j_password" id="password" class="form-control" placeholder="Password" required>
                    <span class="clearfix"><br/></span>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>

                    <span class="clearfix"></span>
                </form>
            </div>
            <g:link mapping="register" class="text-center new-account">Create an account </g:link>
        </div>
    </div>
</body>
</html>
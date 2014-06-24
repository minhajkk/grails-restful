<!DOCTYPE html>
<html lang="en">
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <newrelic:browserTimingHeader/>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    %{--Added for drop down selects--}%
    <asset:javascript src="bootstrap-select.min.js"/>
    <asset:stylesheet src="bootstrap-select.min.css"/>
    <g:javascript>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-52230443-1', 'grails-restful.herokuapp.com');
        ga('send', 'pageview');
    </g:javascript>
    <g:layoutHead/>
</head>
<body>


<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${createLink(uri: '/')}">Scrum Project Management</a>
        </div>
        <nav class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${createLink(uri: '/')}"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                <li class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-file"></i> Projects<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="project"> <i class="glyphicon glyphicon-list"></i> All Projects</g:link></li>
                        <li><g:link controller="project" action="create"> <i class="glyphicon glyphicon-plus"></i> Add new</g:link></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:ifNotLoggedIn>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="glyphicon  glyphicon-user  icon-white"></i> User <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><g:link class="glyphicon glyphicon-log-in" controller="auth" action="login" > Login</g:link></li>
                            <li><g:link mapping="register" class="glyphicon glyphicon-user" controller="logout" > Register</g:link></li>
                        </ul>
                    </li>

                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="glyphicon  glyphicon-user  icon-white"></i> <sec:username/> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <g:link class="glyphicon glyphicon-log-out" controller="logout"> Logout</g:link>
                            </li>
                        </ul>
                    </li>


                </sec:ifLoggedIn>
            </ul>
        </nav><!--/.nav-collapse -->
    </div>
</div>
<br/><br/><br/><br/><br/>
<div class="container">
    <g:layoutBody/>
</div>
<newrelic:browserTimingFooter/>
</body>
</html>

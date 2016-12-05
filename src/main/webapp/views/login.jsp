<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">
    <!-- END META -->
    
    <!-- BEGIN SHORTCUT ICON -->
    <link rel="shortcut icon" href="${path}/img/favicon.ico">
    <!-- END SHORTCUT ICON -->
    <title>天津市扬帆教育</title>
    <!-- BEGIN STYLESHEET-->
    <%
		String path = request.getContextPath();
		request.setAttribute("path", path);
	%>
		<link href="${path}/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
		<link href="${path}/css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
		<link href="${path}/assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME ICON CSS -->
		<link href="${path}/css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
		<link href="${path}/css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS -->
     <!-- END STYLESHEET-->
  </head>
  <body class="login-screen">
    <!-- BEGIN SECTION -->
    <div class="container">
      <form class="form-signin" action="${path}/login/loginIn.do">
        <h2 class="form-signin-heading">马上登录</h2>
		<!-- LOGIN WRAPPER  -->
        <div class="login-wrap">
          <input name = "user" type="text" class="form-control" placeholder="User ID" autofocus>
          <input name = "pass" type="password" class="form-control" placeholder="Password">
          <button class="btn btn-lg btn-login btn-block" type="submit">登录</button>
        </div>
		<!-- END LOGIN WRAPPER -->
      </form>
    </div>
    <!-- END SECTION -->
    <!-- BEGIN JS -->
<script src="${path}/js/jquery/jquery.js" ></script><!-- BASIC JS LIABRARY -->
<script src="${path}/js/bootstrap/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
    <!-- END JS -->
  </body>
</html>


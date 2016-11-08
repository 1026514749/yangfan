<!DOCTYPE html>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Custom Theme">
<!-- END META -->


<!-- BEGIN SHORTCUT ICON -->
<link rel="shortcut icon" href="img/favicon.ico">
<!-- END SHORTCUT ICON -->
<title>Blank</title>
 
<!-- BEGIN STYLESHEET -->  
<link href="css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS  -->
<link href="css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS  -->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME CSS  -->
<link href="css/style.css" rel="stylesheet"><!-- THEME BASIC CSS  -->
<link href="css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS  -->
 
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
<!-- END STYLESHEET --> 
</head>
<body>
<!-- BEGIN SECTION --> 
<section id="container" class="">
 <!-- BEGIN HEADER --> 
<header class="header white-bg">
        <!-- SIDEBAR TOGGLE BUTTON -->
        <div class="sidebar-toggle-box">
          <div  data-placement="right" class="fa fa-bars tooltips">
          </div>
        </div>
        <!-- SIDEBAR TOGGLE BUTTON  END-->
 
		<a href="index.html" class="logo">olive<span>admin</span></a>
 
<div class="top-nav ">
<ul class="nav pull-right top-menu">
<li>
<input type="text" class="form-control search" placeholder="Search">
</li>
 
<li class="dropdown">
<a data-toggle="dropdown" class="dropdown-toggle" href="#">
<img alt="" src="img/avatar1_small.jpg">
<span class="username">Pruthvi</span>
<b class="caret"></b>
</a>
<ul class="dropdown-menu extended logout">
<li class="log-arrow-up"></li>
<li><a href="#"><i class="fa fa-bell-o"></i> 修改密码</a></li>
<li><a href="login.html"><i class="fa fa-key"></i>注   销</a></li>
</ul>
</li>
 
</ul>
</div>
<!-- END USER LOGIN DROPDOWN  -->
</header>
 <!-- END HEADER --> 
 
 <!-- BEGIN SIDEBAR --> 
<aside>
<div id="sidebar" class="nav-collapse">
 
<ul class="sidebar-menu" id="nav-accordion">
<li class="sub-menu">
<a href="javascript:;">
<i class="fa fa-cogs"></i>
<span>基本信息</span>
<span class="label label-primary span-sidebar">2</span>
</a>
<ul class="sub">
<li><a href="grids.html">基本信息</a></li>
<li><a href="calendar.html">公司简介</a></li>
</ul>
</li>
<li class="sub-menu">
<a href="javascript:;">
<i class="fa fa-tasks"></i>
<span>栏目管理</span>
<span class="label label-info span-sidebar">3</span>
</a>
<ul class="sub">
<li><a href="form_component.html">栏目管理</a></li>
<li><a href="advanced_form_components.html">栏目简介</a></li>
<li><a href="form_wizard.html">栏目内容</a></li>
</ul>
</li>
<li class="sub-menu">
<a href="javascript:;">
<i class="fa fa-th"></i>
<span>员工管理</span>
<span class="label label-inverse span-sidebar">2</span>
</a>
<ul class="sub">
<li><a href="basic_table.html">员工信息</a></li>
<li><a href="responsive_table.html">用户账号</a></li>
</ul>
</li>
<li class="sub-menu">
<a href="javascript:;">
<i class=" fa fa-envelope"></i>
<span>活动案例</span>
<span class="label label-danger span-sidebar">2</span>
</a>
<ul class="sub">
<li><a href="inbox.html">案例管理</a></li>
<li><a href="inbox_details.html">活动管理</a></li>
</ul>
</li>
</ul>
 
</div>
</aside>
 <!-- END SIDEBAR --> 
 <!-- BEGIN MAIN CONTENT --> 
<section id="main-content">
<section class="wrapper " style="height=700px;">
 
	<iframe style="overflow-y: auto; width=100%;height=650px" id="rightContentFrame" 
                frameBorder="0" name="rtmfrm" scrolling="auto"></iframe>
 
</section>
</section>
 <!-- END MAIN CONTENT --> 
 <!-- BEGIN FOOTER --> 
<footer class="site-footer">
<div class="text-center">
2013 &copy; Olive Admin by <a href="" target="_blank">Custom Theme</a>.
<a href="#" class="go-top">
<i class="fa fa-angle-up"></i>
</a>
</div>
</footer>
 <!-- END FOOTER --> 
</section>
<!-- END SECTION -->  

<!-- BEGIN JS --> 
<script type="text/javascript">
function openView(url){
	$("#rightContentFrame", parent.document.body).attr("src", url);
}
</script>
<script src="js/jquery.js" ></script><!-- BASIC JS LIABRARY -->
<script src="js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
<script src="js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
<script src="js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
<script src="js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
<script src="js/respond.min.js" ></script><!-- RESPOND JS  -->
<script src="js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
<!-- END JS --> 
</body>
</html>


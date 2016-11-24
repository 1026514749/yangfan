<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Custom Theme">
<!-- END META -->


<!-- BEGIN SHORTCUT ICON -->
<link rel="shortcut icon" href="${path}/img/favicon.ico">
<!-- END SHORTCUT ICON -->
<title>后台管理</title>
 
<%@include file="/common/header-back.jsp" %>
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
 
		<a href="javascript:" class="logo">扬帆<span>后台管理</span></a>
 
<div class="top-nav ">
<ul class="nav pull-right top-menu">
 
<li class="dropdown">
<a data-toggle="dropdown" class="dropdown-toggle" href="#">
<img alt="" src="img/avatar1_small.jpg">
<span class="username">Pruthvi</span>
<b class="caret"></b>
</a>
<ul class="dropdown-menu extended logout">
<li class="log-arrow-up"></li>
<li><a href="javascript:"><i class="fa fa-bell-o"></i> 修改密码</a></li>
<li><a href="javascript:"><i class="fa fa-key"></i>注   销</a></li>
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
<a href="javascript:">
<i class="fa fa-cogs"></i>
<span>基本信息</span>
<span class="label label-primary span-sidebar">2</span>
</a>
<ul class="sub">
<li><a href="javascript:" onclick="openView('/admin/info.do')">基本信息</a></li>
<li><a href="javascript:">公司简介</a></li>
</ul>
</li>
<li class="sub-menu">
<a href="javascript:;">
<i class="fa fa-tasks"></i>
<span>栏目管理</span>
<span class="label label-info span-sidebar">3</span>
</a>
<ul class="sub">
<li><a href="javascript:" onclick="openView('/admin/columnList.do')">栏目管理</a></li>
<li><a href="javascript:" onclick="openView('/admin/columnSimpleList.do')">栏目简介</a></li>
<li><a href="javascript:" onclick="openView('/admin/columnDetailList.do')">栏目内容</a></li>
</ul>
</li>
<li class="sub-menu">
<a href="javascript:;">
<i class="fa fa-th"></i>
<span>员工管理</span>
<span class="label label-inverse span-sidebar">2</span>
</a>
<ul class="sub">
<li><a href="javascript:" onclick="openView('/admin/employeeList.do')">员工信息</a></li>
<li><a href="javascript:">用户账号</a></li>
</ul>
</li>
<li class="sub-menu">
<a href="javascript:;">
<i class=" fa fa-envelope"></i>
<span>活动案例</span>
<span class="label label-danger span-sidebar">2</span>
</a>
<ul class="sub">
<li><a href="javascript:" onclick="openView('/admin/caseList.do')">案例管理</a></li>
<li><a href="javascript:" onclick="openView('/admin/activityList.do')">活动管理</a></li>
</ul>
</li>
<li class="sub-menu">
<a href="javascript:;">
<i class=" fa fa-envelope"></i>
<span>客户评价</span>
<span class="label label-danger span-sidebar">1</span>
</a>
<ul class="sub">
<li><a href="javascript:" onclick="openView('/admin/evaluateList.do')">客户评价</a></li>
</ul>
</li>
</ul>
 
</div>
</aside>
 <!-- END SIDEBAR --> 
 <!-- BEGIN MAIN CONTENT --> 
<section id="main-content">
<section class="wrapper " style="height: 700px;margin-top:60px;">
 
	<iframe style="overflow-y: auto; width:100%;height:650px" id="rightContentFrame" 
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
	url = path+url;
	$("#rightContentFrame", parent.document.body).attr("src", url);
}
</script>

<!-- END JS --> 
</body>
</html>


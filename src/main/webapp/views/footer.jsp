<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">

<%@include file="/common/header-front.jsp"%>
<title>天津市扬帆教育</title>
</head>
<body>
<footer>
     <div class="container">
          <div class="main-footer">
                <div class="row">
                      <div class="col-md-6">
                            <div class="recent-posts">
                                 <h4 class="footer-title">最新活动</h4>
                            	 <c:forEach items="${activitys }" var="activity">
                                 	<div class="recent-post">
                                      <div class="recent-post-thumb">
                                           <img src="${activity.image}" style="width:100%;height:100%" alt="">
                                      </div>
                                      <div class="recent-post-info">
                                           <h6><a href="javaScript:" onclick="openActivity(${activity.id })">${activity.title }</a></h6>
                                         	<span>${activity.time }</span>
                                      </div>
                                  	</div>
                            	</c:forEach>
                       		</div>
                	  </div>
                	  <div class="col-md-6">
                            <div class="more-info">
                                 <h4 class="footer-title">更多信息</h4>
                                 <p>如果你想要对我们公司有更深刻的了解，以下是我们公司的联系方式</p>
                                 <ul>
                                     <li><i class="fa fa-phone"></i>${info.mobile }</li>
                                     <li><i class="fa fa-globe"></i>${info.addr }</li>
                                     <li><i class="fa fa-envelope"></i><a href="#">${info.email}</a></li>
                                 </ul>
                            </div>
                      </div>
                </div>
          </div>
          <div class="bottom-footer">
               <p>Copyright © 2016 <a href="#">sjm</a> Collect from </p>
          </div>
     </div>
</footer>
<script type="text/javascript">
function openActivity(id){
	location.href = "${path}/index/activity.do?id="+id;
}
</script>
</body>
</html>
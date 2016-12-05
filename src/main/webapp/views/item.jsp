<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">
<title>天津市扬帆教育</title>
<%@include file="/common/header-front.jsp" %>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
         
    <jsp:include page="relate.jsp"></jsp:include>
    
    <div id ="content"></div>
    
<div id="latest-blog">
    <div class="container">
        <div class="row">
             <div class="col-md-12">
                  <div class="heading-section">
                        <h2>经典案例</h2>
                        <img src="${path}/images/under-heading.png" alt="" >
                  </div>
             </div>
        </div>
        <div class="row">
        	<c:forEach items="${ cases}" var="ncase" varStatus="st">
        		<div class="col-md-4 col-sm-6">
             		<div class="blog-post">
                  		<div class="blog-thumb">
                      		<img src="${ncase.image}" alt="" />
                 		</div>
                  		<div class="blog-content" onclick="openCase(${ncase.id})">
                      		<div class="content-show">
                          		<h4><a href="javaScript:" onclick="openCase('${ncase.id}')">红星幼儿园</a></h4>
                          		<span>${ncase.time}</span>
                      		</div>
                  			<div class="content-hide">
                      			<p>${ncase.simple}</p>
                  			</div>
              			</div>
         			</div>
         		</div>
        	</c:forEach>
        </div>
   </div>
</div>
    
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var design = '${item.content}';
	$("#content").html($.base64.atob(design,true));
});
function openCase(id){
	location.href = "${path}/index/case.do?id="+id;
}
</script>
</html>
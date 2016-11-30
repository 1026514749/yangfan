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
<header>
	<div id="main-header" style="background-color:#FFEFDB">
         <div class="container">
              <div class="row">
                   <div class="col-md-2">
                        <div class="logo">
                            <a href="#"><img src="${path}/images/logo.png" title="扬帆教育" alt="扬帆教育" ></a>
                        </div>
                   </div>
                   <div class="col-md-10">
                        <div class="main-menu">
                             <ul>
                                 <c:forEach items="${columns }" var="column">
                                    <li><a href="javaScript:" onclick="openColumn(${column.code})">${column.name}</a></li>
                                  </c:forEach>
                             </ul>
                        </div>
                   </div>
              </div>
         </div>
    </div>
 </header>
<script type="text/javascript">
function openColumn(code){
	location.href = "${path}/index/column.do?code="+code;
}
</script>
</body>
</html>

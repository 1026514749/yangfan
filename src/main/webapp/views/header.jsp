<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">

<title>天津市扬帆教育</title>
</head>
<body>
<header>
	<div id="main-header" style="background-color:#FFFFFF">
         <div class="container">
              <div class="row" >
                   <div class="col-md-3">
                        <div class="logo">
                            <a href="#"><img src="${path}/images/logo.png" style="height: 64px; width: 220px;" alt="扬帆教育" ></a>
                        </div>
                   </div>
                   <div class="col-md-3 col-md-offset-6">
                                <div class="search-box">  
                                    <form name="search_form" method="get" class="search_form" style="height: 40px;text-shadow: none;">
                                        <input id="search" type="text" style="height: 40px;"/>
                                        <input type="submit" id="search-button" />
                                    </form>
                                </div>
                   </div>
              </div>
         </div>
    </div>
    <div id="main-header" style="background-color:#35679a">
         <div class="container">
              <div class="row" >
              	   <div class="col-md-12">
                        <div class="main-menu">
                             <ul>
                                 <c:forEach items="${columns }" var="column">
                                    <li><a  style="color:#FFFFFF;font-size: 17px;" href="javaScript:" onclick="openColumn('${column.code}')">${column.name}</a></li>
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

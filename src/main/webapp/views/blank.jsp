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
    
    <div id ="content" style="min-height: 400px"></div>
    
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var design = '${item.content}';
	$("#content").html($.base64.atob(design,true));
});
</script>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    request.setAttribute("path", request.getContextPath());
%>

<script type="text/javascript">
    var path = '${path}';
</script>

<link href="${path}/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS  -->
<link href="${path}/css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS  -->
<link href="${path}/assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME CSS  -->
<link href="${path}/css/style.css" rel="stylesheet"><!-- THEME BASIC CSS  -->
<link href="${path}/css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS  -->

<script src="${path}/js/jquery/jquery.js" ></script><!-- BASIC JS LIABRARY -->
<script src="${path}/js/bootstrap/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
<script src="${path}/js/jquery/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
<script src="${path}/js/jquery/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
<script src="${path}/js/jquery/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
<script src="${path}/js/other/respond.min.js" ></script><!-- RESPOND JS  -->
<script src="${path}/js/other/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
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

<link rel="stylesheet" href="${path}/css/bootstrap.css">
<link rel="stylesheet" href="${path}/css/font-awesome.css">
<link rel="stylesheet" href="${path}/css/templatemo_style.css">
<link rel="stylesheet" href="${path}/css/templatemo_misc.css">
<link rel="stylesheet" href="${path}/css/flexslider.css">
<link rel="stylesheet" href="${path}/css/testimonails-slider.css">

<script src="${path}/js/front/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<script src="${path}/js/front/vendor/jquery-1.11.0.min.js"></script>
<!-- <script src="${path}/js/front/vendor/jquery.gmap3.min.js"></script> -->
<script src="${path}/js/plugins.js"></script>
<script src="${path}/js/front/main.js"></script>
<script src="${path}/js/front/jquery.pin.js"></script>
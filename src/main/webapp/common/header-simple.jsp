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
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<link href="${path}/css/zeroModal.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS  -->

<script src="${path}/js/jquery/jquery-2.0.0.min.js" type="text/javascript"></script>
<script src="${path}/js/jquery/jquery.base64.js" type="text/javascript"></script>
<script src="${path}/js/jquery/jquery.validate.min.js" > </script><!-- NICESCROLL JS  -->
<script src="${path}/js/jquery/ajaxfileupload.js"></script><!-- ACCORDING JS -->
<script src="${path}/js/common/zeroModal.js" type="text/javascript"></script>
<script src="${path}/js/common/pts.js" type="text/javascript"></script>


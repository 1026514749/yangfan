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
<link href="${path}/images/fav.ico" rel="shortcut icon" type="image/x-icon">
<link href="${path}/themes/default/style.css" type="text/css" rel="stylesheet"/>
<link href="${path}/js/script/ligerui/skins/Aqua/css/ligerui-all.css" type="text/css" rel="stylesheet"/>
<link href="${path}/js/script/ligerui/skins/ligerui-icons.css" type="text/css" rel="stylesheet"/>
<link href="${path}/js/script/artDialog/skins/default.css" type="text/css" rel="stylesheet"/>
<link href="${path}/js/script/jquery/jquery-ui.css" type="text/css" rel="stylesheet"/>
<link href="${path}/js/script/poshytip/tip-violet/tip-violet.css" type="text/css" rel="stylesheet"/>
<link href="${path}/js/script/lhgdialog/skins/default.css" type="text/css" rel="stylesheet">

<script src="${path}/js/script/jquery/jquery-1.6.1.js" type="text/javascript"></script>
<script src="${path}/js/script/jquery/jquery-ui-1.7.3.js" type="text/javascript"></script>
<script src="${path}/js/script/lhgdialog/lhgdialog.js" type="text/javascript"></script>
<script src="${path}/js/script/artDialog/jquery.artDialog.js" type="text/javascript"></script>
<script src="${path}/js/script/artDialog/jquery.artDialog.plugin.js" type="text/javascript"></script>
<script src="${path}/js/script/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${path}/js/script/validator/jquery.validate.js" type="text/javascript"></script>
<script src="${path}/js/script/validator/jquery.validate.plugin.js" type="text/javascript"></script>
<script src="${path}/js/script/common/json2.js" type="text/javascript"></script>
<script src="${path}/js/script/common/json2-ext.js" type="text/javascript"></script>

<script src="${path}/js/script/ligerui/plugins/base.js" type="text/javascript"></script>
<script src="${path}/js/script/ligerui/plugins/ligerLayout.js" type="text/javascript"></script>
<script src="${path}/js/script/ligerui/plugins/ligerMenu.js" type="text/javascript"></script>
<script src="${path}/js/script/ligerui/plugins/ligerGrid.js" type="text/javascript"></script>
<script src="${path}/js/script/ligerui/plugins/ligerTab.js" type="text/javascript"></script>
<script src="${path}/js/script/ligerui/plugins/ligerVerticalTab.js" type="text/javascript"></script>
<script src="${path}/js/script/ligerui/plugins/ligerTree.js" type="text/javascript"></script>
<script src="${path}/js/script/ligerui/plugins/ligerResizable.js" type="text/javascript"></script>
<script src="${path}/js/script/jquery/ajaxfileupload.js" type="text/javascript"></script>
<script src="${path}/js/script/jquery/jquery.autogrow.js" type="text/javascript"></script>

<script src="${path}/js/script/common/open.extend.js" type="text/javascript"></script>
<script src="${path}/js/script/common/pts.js" type="text/javascript"></script>

<!--[if lte IE 7]>
<script src="${path}/themes/default/style.js" type="text/javascript"></script>
<![endif]-->

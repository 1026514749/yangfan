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

<!-- END SHORTCUT ICON -->
<title>后台管理</title>
<%@include file="/common/header-back.jsp" %>
 
</head>
<body>
<!-- BEGIN SECTION --> 
<section id="container" class="">

 
 <!-- BEGIN SIDEBAR --> 
<section id="main-content">
<section class="wrapper site-min-height">
 
<form class="form-horizontal tasi-form" method="post" id="form" action="info/modify">
	<div class="form-group">
		<label class="col-sm-2 col-sm-2 control-label">公司地址</label>
			<div class="col-sm-5">
            	<input type="text" class="form-control" placeholder="xx省xx市xx区" value="${info.addr}}">
                <span class="help-block">公司的具体地址，精确到楼层</span>
            </div>
       	</div>
		<div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label">公司电话</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" placeholder="020-123456" value="${info.mobile}}">
                <span class="help-block">公司的固话或者常用的联系手机号</span>
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label">客服QQ1</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" placeholder="QQ" value="${info.qq1}">
                <span class="help-block">可提供在线咨询的客服QQ</span>
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label">客服QQ2</label>
            <div class="col-sm-5">
                 <input type="text" class="form-control" placeholder="QQ" value="${info.qq2}">
                 <span class="help-block">可提供在线咨询的客服QQ</span>
            </div>
        </div>
		<div class="form-group">
             <label class="col-sm-2 col-sm-2 control-label">公众号</label>
             <div class="col-sm-5">
                  <input type="text" class="form-control" placeholder="公众号" value="${info.wechat}">
                  <span class="help-block">公司的微信公众号</span>
             </div>
        </div>
		<div class="form-group">
             <label class="col-sm-2 col-sm-2 control-label">邮箱</label>
             <div class="col-sm-5">
                   <input type="text" class="form-control" placeholder="xxxxx@xxx.xxx" value="${info.email}">
                   <span class="help-block">联系使用的邮箱地址</span>
             </div>
        </div>
        <div class="form-group">
             <label class="col-sm-2 col-sm-2 control-label">谷歌地图</label>
             <div class="col-sm-5">
                   <input type="text" class="form-control" placeholder="xxxxx@xxx.xxx" value="${info.map}">
                   <span class="help-block">谷歌地图的坐标，类似22。434236,34.32423</span>
             </div>
        </div>
        <div class="form-group">
        	<button type="button" class="btn btn-shadow btn-default" onclick="modify()">提交</button>
        </div>
    </form>
    
</section>
</section>

</section>
<script type="text/javascript">
	function modify(){
		$("#form").submit();
	}
</script>
</body>
</html>


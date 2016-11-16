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
 
<form class="form-horizontal tasi-form" id="form">
	<div class="form-group">
		<label class="col-sm-2  control-label">公司地址</label>
			<div class="col-sm-5">
            	<input name="addr" type="text" class="form-control" placeholder="xx省xx市xx区" value="${info.addr}">
                <span class="help-block">公司的具体地址，精确到楼层</span>
            </div>
       	</div>
		<div class="form-group">
            <label class="col-sm-2 control-label">公司电话</label>
            <div class="col-sm-5">
                <input name="mobile" type="text" class="form-control" placeholder="020-123456" value="${info.mobile}">
                <span class="help-block">公司的固话或者常用的联系手机号</span>
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label">客服QQ1</label>
            <div class="col-sm-5">
                <input name="qq1" type="text" class="form-control" placeholder="QQ" value="${info.qq1}">
                <span class="help-block">可提供在线咨询的客服QQ</span>
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label">客服QQ2</label>
            <div class="col-sm-5">
                 <input name="qq2" type="text" class="form-control" placeholder="QQ" value="${info.qq2}">
                 <span class="help-block">可提供在线咨询的客服QQ</span>
            </div>
        </div>
		<div class="form-group">
             <label class="col-sm-2 control-label">公众号</label>
             <div class="col-sm-5">
                  <input name="wechat" type="text" class="form-control" placeholder="公众号" value="${info.wechat}">
                  <span class="help-block">公司的微信公众号</span>
             </div>
        </div>
		<div class="form-group">
             <label class="col-sm-2 control-label">邮箱</label>
             <div class="col-sm-5">
                   <input name="email" type="text" class="form-control" placeholder="xxxxx@xxx.xxx" value="${info.email}">
                   <span class="help-block">联系使用的邮箱地址</span>
             </div>
        </div>
        <div class="form-group">
             <label class="col-sm-2 control-label">谷歌地图</label>
             <div class="col-sm-5">
                   <input name="map" type="text" class="form-control" placeholder="xx。xxxxxx，xx。xxxxxxx" value="${info.map}">
                   <span class="help-block">谷歌地图的坐标，类似226.434236,1.324023</span>
             </div>
        </div>
        <div class="form-group">
        	<div class="col-sm-offset-4">
        		<button type="submit" class="btn btn-shadow btn-default">提交</button>
        	</div>
        </div>
    </form>
    
</section>
</section>

</section>
<script type="text/javascript">
	$.validator.setDefaults({   
	  submitHandler: function(form) { 
		  modify();
		  }   
	});
	//电话号检验、、手机号校验
	jQuery.validator.addMethod("mobile", function(value, element) {
		var mobile = /^((1[3|4|5|7|8][0-9]{1})+\d{8})$/;
		var tel = /^((\d{3,4})-(\d{7,8}))|((\d{3,4})-(\d{7,8})-(\d{1,4}))$/; 
		return this.optional(element) || (tel.test(value))||(mobile.test(value)); 
		}, "电话号码格式错误");
	//qq校验
	jQuery.validator.addMethod("qq", function(value, element) { 
		var tel = /^[1-9]\d{4,9}$/; 
		return this.optional(element) || (tel.test(value)); 
		}, "qq号码格式错误");
	jQuery.validator.addMethod("map", function(value, element) { 
		var map = /^(\d{1,3}.\d{6}),(\d{1,3}.\d{6})$/; 		
		return this.optional(element) || (map.test(value)); 
		}, "地图地址错误");
	$(document).ready(function(){
		$("#form").validate({          
		    rules:{
		    	addr:{
		         	required:true,
		         	rangelength:[10,100]
		        },
		        mobile:{
		        	required:true,
		        	mobile:true
		        },
		        qq1:{
		        	qq:true
		        },
		        qq2:{
		        	qq:true
		        },
		        wechat:{
		        	rangelength:[2,20]
		        },
		        email:{
		        	required:true,
		        	email:true
		        },
		        map:{
		        	map:true
		        }
		     }, 
		     messages:{
		    	addr:{
		         	required:"公司地址不能为空",
		        	rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
		        },
		        mobile:{
		        	required:"电话号码不能为空"
		        },
		        wechat:{
		        	rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
		        },
		        email:{
		        	required:"邮箱不能为空",
		        	email:"请输入正确的邮箱地址"
		        }
		     } 
		});
	});
	
		
	function modify(){
		var param = $("#form").serializeArray();
		var url = path+"/admin/modifyInfo.do";
		pts.submit({
			url:url,
			data:param,
			yesClick:function(result){
			}
		});
		
	}
</script>
</body>
</html>


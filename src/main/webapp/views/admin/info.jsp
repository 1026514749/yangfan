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
 	<input type="hidden" id="image" name = "wechat" value="${info.wechat}"/>
	<div class="form-group">
		<label class="col-xs-2  control-label">公司地址</label>
			<div class="col-xs-5">
            	<input name="addr" type="text" class="form-control" value="${info.addr}">
                <span class="help-block">公司的具体地址，越详细越好</span>
            </div>
       	</div>
		<div class="form-group">
            <label class="col-xs-2 control-label">公司电话</label>
            <div class="col-xs-5">
                <input name="mobile" type="text" class="form-control" value="${info.mobile}">
                <span class="help-block">公司的固话或者常用的联系手机号</span>
            </div>
        </div>
		<div class="form-group">
            <label class="col-xs-2 control-label">客服QQ1</label>
            <div class="col-xs-5">
                <input name="qq1" type="text" class="form-control" value="${info.qq1}">
                <span class="help-block">可提供在线咨询的客服QQ</span>
            </div>
        </div>
		<div class="form-group">
            <label class="col-xs-2 control-label">客服QQ2</label>
            <div class="col-xs-5">
                 <input name="qq2" type="text" class="form-control" value="${info.qq2}">
                 <span class="help-block">可提供在线咨询的客服QQ</span>
            </div>
        </div>
		<div class="form-group">
			<label class="col-xs-2 control-label">微信二维码</label>
        	<div class=" col-xs-3">
            	<input id="file" name="file" type="file" value="${simple.image}">
            	<button class="btn btn-shadow btn-default " type= "button" onclick="upload()">上传</button>
            	<div id="imageMsg"></div>
        	</div>
        	<div class=" col-xs-6 row-xs-3">
            	<img id="img" alt="" src="${info.wechat}" style="width:100%;height:100%;">
        	</div>
        </div>
		<div class="form-group">
             <label class="col-xs-2 control-label">邮箱</label>
             <div class="col-xs-5">
                   <input name="email" type="text" class="form-control" value="${info.email}">
                   <span class="help-block">联系使用的邮箱地址</span>
             </div>
        </div>
        <div class="form-group">
        	<div class="col-xs-offset-4">
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
		        email:{
		        	required:true,
		        	email:true
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
		        email:{
		        	required:"邮箱不能为空",
		        	email:"请输入正确的邮箱地址"
		        }
		     } 
		});
	});
	
		
	function modify(){
		var value = $("#image").val();
		if(!value){
			alert("请先上传图片！");
			return;
		}
		var param = $("#form").serializeArray();
		var url = path+"/admin/modifyInfo.do";
		pts.submit({
			url:url,
			data:param,
			yesClick:function(result){
			}
		});
		
	}
	function upload(){
		pts.fileUpload({
			url: path+'/common/upload.do', //用于文件上传的服务器端请求地址
	        secureuri: false, //是否需要安全协议，一般设置为false
	        fileElementId: 'file', //文件上传域的ID
	        dataType : 'text',
	        uploadSuccess: function (data)  //服务器成功响应处理函数
	        {
	            $("#img").attr('src',data.object); 
	            $("#image").val(data.object);
	        },
	        uploadError:function(data){
	        	$("#imageMsg").text(data.message);
	        }
		});
	}
</script>
</body>
</html>


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
<title>员工信息</title>
<%@include file="/common/header-back.jsp" %>
 
</head>
<body>
<!-- BEGIN SECTION --> 
<section id="container" class="">

 
 <!-- BEGIN SIDEBAR --> 
<section id="main-content">
<section class="wrapper">
<form class="form-horizontal" id="form" enctype="multipart/form-data">
 	<input type="hidden" name = "id" value="${employee.id}"/>
 	<input type="hidden" id="image" name = "image" value="${employee.image}"/>
	<div class="form-group">
		<label class=" col-xs-3 control-label">姓名</label>
		<div class="col-xs-9">
            <input name="name" type="text" class="form-control"  value="${employee.name}">
            <span class="help-block">员工姓名，例如：张三</span>
        </div>
    </div>
    <div class="form-group">
        <label class=" col-xs-3 control-label">职位</label>
		<div class="col-xs-9">
            <input name="position" type="text" class="form-control"  value="${employee.position}">
            <span class="help-block">员工职位，例如：总经理</span>
        </div>
    </div>
   	<div class="form-group">
        <label class="col-xs-3 control-label">电话</label>
        <div class="col-xs-9">
            <input name="phone" type="text" class="form-control"  value="${employee.phone}">
            <span class="help-block">电话号码，例如：137xxxxxxxx</span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-3 control-label">排序</label>
        <div class=" col-xs-9">
            <input name="order" type="text" class="form-control"  value="${employee.order}">
            <span class="help-block">排序(1-999)，数值越小显示越靠前</span>
        </div>
    </div>
   	<div class="form-group">
        <label class="col-xs-3 control-label">员工头像</label>
        <div class=" col-xs-3">
            <input id="file" name="file" type="file" value="${employee.image}">
            <button class="btn btn-shadow btn-default " type= "button" onclick="upload()">上传</button>
            <div id="imageMsg"></div>
        </div>

        <div class=" col-xs-6 row-xs-3">
            <img id="img" alt="" src="${employee.image}" style="width:100%;height:100%;">
        </div>
    </div>	
    <div class="form-group">
    	<div class="col-xs-offset-5 col-xs-7">
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
	jQuery.validator.addMethod("phone", function(value, element) {
		var mobile = /^((1[3|4|5|7|8][0-9]{1})+\d{8})$/;
		return this.optional(element) ||(mobile.test(value)); 
		}, "电话号码格式错误");
	$(document).ready(function(){
		$("#form").validate({          
		    rules:{
		    	name:{
		         	required:true,
		         	rangelength:[1,20]
		        },
		        position:{
		        	required:true,
		        	rangelength:[1,20]
		        },
		        phone:{
		        	required:true,
		        	phone:true
		        },
		        order:{
		        	required:true,
		        	digits:true,
		        	rangelength:[1,3]
		        }
		     }, 
		     messages:{
		    	 name:{
			         required:'姓名不能为空',
			         rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			     },
			     position:{
			        required:'职位不能为空',
			        rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			     },
			     phone:{
			        required:'电话号码不能为空'
			     },
			     order:{
			        required:'排序不能为空',
			        digits:'必须为整数',
			        rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			     }
		     } 
		});
	});
	
		
	function modify(){
		var param = $("#form").serializeArray();
		var value = $("#image").val();
		if(!value){
			alert("请先上传图片！");
		}
		var url = path+"/admin/modifyEmployee.do";
		pts.submit({
			url:url,
			data:param,
			yesClick:function(result){
				pts.closeDailog();
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


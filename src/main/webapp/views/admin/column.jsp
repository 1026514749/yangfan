<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">
<!-- END META -->

<!-- END SHORTCUT ICON -->
<title>栏目</title>
<%@include file="/common/header-back.jsp" %>
 
</head>
<body>
<!-- BEGIN SECTION --> 
<section id="container" class="">

 
 <!-- BEGIN SIDEBAR --> 
<section id="main-content">
<section class="wrapper">
<form class="form-horizontal" id="form">
 	<input type="hidden" name = "id" value="${column.id}"/>
	<div class="form-group">
		<label class=" col-xs-3 control-label">栏目编码</label>
		<div class="col-xs-9">
            <input name="code" type="text" class="form-control"  value="${column.code}">
            <span class="help-block">栏目的唯一标识符，例如：yuanzhangzheng</span>
        </div>
    </div>
   	<div class="form-group">
        <label class="col-xs-3 control-label">栏目名称</label>
        <div class="col-xs-9">
            <input name="name" type="text" class="form-control"  value="${column.name}">
            <span class="help-block">栏目的名称，例如：园长证</span>
        </div>
    </div>
	<div class="form-group">
        <label class="col-xs-3 control-label">网页链接</label>
        <div class="col-xs-9">
            <input name="url" type="text" class="form-control"  value="${column.url}">
            <span class="help-block">点击该栏目时打开的网页地址，默认:item</span>
        </div>
   </div>
   <div class="form-group">
        <label class="col-xs-3 control-label">排序</label>
        <div class=" col-xs-9">
            <input name="order" type="text" class="form-control"  value="${column.order}">
            <span class="help-block">排序(1-999)，数值越小显示越靠前</span>
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
	$(document).ready(function(){
		$("#form").validate({          
		    rules:{
		    	code:{
		         	required:true,
		         	rangelength:[5,20]
		        },
		        name:{
		        	required:true,
		        	rangelength:[0,200]
		        },
		        url:{
		        	required:true
		        },
		        order:{
		        	required:true,
		        	digits:true,
		        	rangelength:[1,3]
		        }
		     }, 
		     messages:{
		    	 code:{
			         	required:'栏目编码不能为空',
			         	rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			        },
			        name:{
			        	required:'栏目名称不能为空',
			        	rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			        },
			        url:{
			        	required:'网页地址不能为空'
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
		var url = path+"/admin/modifyColumn.do";
		pts.submit({
			url:url,
			data:param,
			yesClick:function(result){
				pts.closeDailog();
			}
		});
		
	}
</script>
</body>
</html>


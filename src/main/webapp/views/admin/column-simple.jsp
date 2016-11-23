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
<title>栏目简介</title>
<%@include file="/common/header-back.jsp" %>
 
</head>
<body>
<!-- BEGIN SECTION --> 
<section id="container" class="">

 
 <!-- BEGIN SIDEBAR --> 
<section id="main-content">
<section class="wrapper">
<form class="form-horizontal" id="form" enctype="multipart/form-data">
 	<input type="hidden" name = "id" value="${simple.id}"/>
 	<input type="hidden" id="image" name = "image" value="${simple.image}"/>
	<div class="form-group">
		<label class=" col-xs-3 control-label">简介标题</label>
		<div class="col-xs-9">
            <input name="title" type="text" class="form-control"  value="${simple.title}">
            <span class="help-block">简介标题，例如：园长证书</span>
        </div>
    </div>
    <div class="form-group">
        <label class=" col-xs-3 control-label">栏目类型</label>
		<div class="col-xs-9">
            <select name="code" style="width:40%">
            	<c:forEach var="column" items="${columns}">
            		<option value="${column.code}">${column.name}</option>
            	</c:forEach>
            </select>
        </div>
    </div>
   	<div class="form-group">
        <label class="col-xs-3 control-label">按钮名称</label>
        <div class="col-xs-9">
            <input name="button" type="text" class="form-control"  value="${simple.button}">
            <span class="help-block">按钮名称，如：了解详情</span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-3 control-label">排序</label>
        <div class=" col-xs-9">
            <input name="order" type="text" class="form-control"  value="${simple.order}">
            <span class="help-block">排序(1-999)，数值越小显示越靠前</span>
        </div>
    </div>
   	<div class="form-group">
        <label class="col-xs-3 control-label">背景图片</label>
        <div class=" col-xs-3">
            <input id="file" name="file" type="file" value="${simple.image}">
            <button class="btn btn-shadow btn-default " type= "button" onclick="upload()">上传</button>
            <div id="imageMsg"></div>
        </div>

        <div class=" col-xs-6 row-xs-3">
            <img id="img" alt="" src="${simple.image}" style="width:100%;height:100%;">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-3 row-xs-3 control-label">简介内容</label>
        <div class=" col-xs-9 row-xs-3">
        	<textarea rows="3" cols="" name="content" class="form-control">${simple.content}</textarea>
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
		    	title:{
		         	required:true,
		         	rangelength:[1,20]
		        },
		        button:{
		        	required:true,
		        	rangelength:[0,200]
		        },
		        content:{
		        	required:true,
		        	rangelength:[0,200]
		        },
		        order:{
		        	required:true,
		        	digits:true,
		        	rangelength:[1,3]
		        }
		     }, 
		     messages:{
		    	 title:{
			         required:'栏目标题不能为空',
			         rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			     },
			     button:{
			        required:'按钮名称不能为空',
			        rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			     },
			     content:{
			        required:'简介内容不能为空',
			        rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
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
		var url = path+"/admin/modifyColumnSimple.do";
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


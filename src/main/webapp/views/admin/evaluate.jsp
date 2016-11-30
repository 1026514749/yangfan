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
<title>客户评价</title>
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
 	<input type="hidden" name = "status" value="1"/>
	<div class="form-group">
		<label class=" col-xs-3 control-label">姓名</label>
		<div class="col-xs-9">
            <input name="name" type="text" class="form-control"  value="${employee.name}">
            <span class="help-block">客户姓名，例如：张三</span>
        </div>
    </div>
    <div class="form-group">
        <label class=" col-xs-3 control-label">栏目类型</label>
		<div class="col-xs-9">
            <select name="column" style="width:40%">
            	<c:forEach var="column" items="${columns}">
            		<option value="${column.code}">${column.name}</option>
            	</c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-3 control-label">时间</label>
        <div class=" col-xs-9">
            <input name="time" type="text" class="form-control"  value="${employee.time}">
            <span class="help-block">评价时间</span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-3 row-xs-3 control-label">评价</label>
        <div class=" col-xs-9 row-xs-3">
        	<textarea rows="3" cols="" name="content" class="form-control">${employee.content}</textarea>
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
		    	name:{
		         	required:true,
		         	rangelength:[1,20]
		        },
		        content:{
		        	required:true,
		        	rangelength:[0,200]
		        }
		     }, 
		     messages:{
		    	 name:{
			         required:'姓名不能为空',
			         rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			     },
			     content:{
			        required:'评价内容不能为空',
			        rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
			     }

		     } 
		});
	});
	
		
	function modify(){
		var param = $("#form").serializeArray();
		var url = path+"/admin/modifyEvaluate.do";
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


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

<%@include file="/common/header-simple.jsp" %>

<title>案例编辑</title>

	<link href="${path}/css/bootstrap-combined.min.css" rel="stylesheet">
	<link href="${path}/css/layoutit.css" rel="stylesheet">

	<link rel="shortcut icon" href="${path}/img/favicon.png">
	
	<script type="text/javascript" src="${path}/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${path}/js/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="${path}/js/jquery/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="${path}/js/jquery/jquery.htmlClean.js"></script>
	<script type="text/javascript" src="${path}/js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${path}/js/ckeditor/config.js"></script>
	<script type="text/javascript" src="${path}/js/other/scripts.js"></script>
</head>

<body style="min-height: 660px; cursor: auto;" class="edit">
<div class="container-fluid">
	<form id="form" action="">
		<input type="hidden" name = "id" value="${ncase.id}"/>
		<input type="hidden" name="design" id="design" value="${ncase.design }"/>
		<input type="hidden" name="content" id="content" value="${ncase.content }" onchange="modify()"/>
		<input type="hidden" id="image" name = "image" value="${ncase.image}"/>
		<div class="row-fluid">
			<div class="span1"><label class="control-label">栏目类型</label></div>
			<div class="span5">
            	<select name="code" style="height:30px;">
					<c:forEach var="column" items="${columns }">
						<option value="${column.code}" ${column.code eq ncase.code ?'selected="selected"':''}>${column.name}</option>
					</c:forEach>
				</select>
            	<span class="help-block"></span>
        	</div>
        	<div class="span1"><label class="control-label">案例标题</label></div>
			<div class="span5">
            	<input type="text" name="title" value="${ncase.title}"/>
            	<span class="help-block">案例标题，如：xxxx</span>
        	</div>
    	</div>
    	<div class="row-fluid">
    		<div class="span1"><label class="control-label">时间</label></div>
			<div class="span5">
            	<input type="text" name="time" value="${ncase.time}"/>
            	<span class="help-block">时间，如：2016-11-24</span>
        	</div>
        	<div class="span1"><label class="col-xs-3 control-label">排序</label></div>
        	<div class="span5">
            	<input name="order" type="text" class="form-control"  value="${ncase.order}">
            	<span class="help-block">排序(1-999)，数值越小显示越靠前</span>
        	</div>
    	</div>
    	<div class="row-fluid">
    		<div class="span1"><label class="control-label">背景图片</label></div>
        	<div class="span2">
            	<input id="file" name="file" type="file" value="${ncase.image}">
            	<button class="btn btn-shadow btn-default " type= "button" onclick="upload()">上传</button>
            	<div id="imageMsg"></div>
        	</div>

        	<div class="span3">
            	<img id="img" alt="" src="${ncase.image}" style="width:100%;height:100%;">
        	</div>
    		<div class="span1"><label class="control-label">案例简介</label></div>
    		<div class="span5">
        		<textarea rows="3" cols="" name="simple" class="form-control" style="width:100%">${ncase.simple}</textarea>
        	</div>
    	</div>
    </form>
</div>
<div class="navbar">
  <div class="navbar-inner">
    <div class="container-fluid">
      <button data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar" type="button"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <div class="nav-collapse collapse">
      	<ul class="nav" id="menu-layoutit">
          <li class="divider-vertical"></li>
          <li>
            <div class="btn-group" data-toggle="buttons-radio">
              <button type="button" id="edit" class="btn btn-primary active"><i class="icon-edit icon-white"></i>编辑</button>
              <button type="button" class="btn btn-primary" id="devpreview"><i class="icon-eye-close icon-white"></i>布局编辑</button>
              <button type="button" class="btn btn-primary" id="sourcepreview"><i class="icon-eye-open icon-white"></i>预览</button>
            </div>
			<div class="btn-group">
				<button class="btn btn-primary" href="#undo" id="undo" ><i class="icon-arrow-left icon-white"></i>撤销</button>
				<button class="btn btn-primary" href="#redo" id="redo" ><i class="icon-arrow-right icon-white"></i>重做</button>
			</div>
            <div class="btn-group">
              <button type="button" href="#clear" id="clear" class="btn btn-primary" ><i class="icon-trash icon-white"></i>清空</button>
              <button class="btn btn-primary" data-target="#downloadModal" rel="/build/downloadModal" role="button" data-toggle="modal"><i class="icon-chevron-down icon-white"></i>提交</button>
            </div>
          </li>
        </ul>
      </div>
      <!--/.nav-collapse --> 
    </div>
  </div>
</div>
<div class="container-fluid">
  <div class="row-fluid">
    <div class="">
      <div class="sidebar-nav">
        <ul class="nav nav-list accordion-group">
          <li class="nav-header">
            <div class="pull-right popover-info"><i class="icon-question-sign "></i>
              <div class="popover fade right">
                <div class="arrow"></div>
                <h3 class="popover-title">功能</h3>
                <div class="popover-content">在这里设置你的栅格布局, 栅格总数默认为12, 用空格分割每列的栅格值, 如果您需要了解更多信息，请访问<a target="_blank" href="http://twitter.github.io/bootstrap/scaffolding.html#gridSystem">Bootstrap栅格系统.</a></div>
              </div>
            </div>
            <i class="icon-plus icon-white"></i> 布局设置 </li>
          <li style="display: list-item;" class="rows" id="estRows">
            <div class="lyrow ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span>
              <div class="preview">
                <input value="12" type="text">
              </div>
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span12 column"></div>
                </div>
              </div>
            </div>
            <div class="lyrow ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span>
              <div class="preview">
                <input value="6 6" type="text">
              </div>
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span6 column"></div>
                  <div class="span6 column"></div>
                </div>
              </div>
            </div>
            <div class="lyrow ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span>
              <div class="preview">
                <input value="8 4" type="text">
              </div>
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span8 column"></div>
                  <div class="span4 column"></div>
                </div>
              </div>
            </div>
            <div class="lyrow ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span>
              <div class="preview">
                <input value="4 4 4" type="text">
              </div>
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span4 column"></div>
                  <div class="span4 column"></div>
                  <div class="span4 column"></div>
                </div>
              </div>
            </div>
            <div class="lyrow ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span>
              <div class="preview">
                <input value="2 6 4" type="text">
              </div>
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span2 column"></div>
                  <div class="span6 column"></div>
                  <div class="span4 column"></div>
                </div>
              </div>
            </div>
          </li>
        </ul>
        <ul class="nav nav-list accordion-group">
          <li class="nav-header"><i class="icon-plus icon-white"></i> 基本CSS
            <div class="pull-right popover-info"><i class="icon-question-sign "></i>
              <div class="popover fade right">
                <div class="arrow"></div>
                <h3 class="popover-title">帮助</h3>
                <div class="popover-content">这里提供了一系列基本元素样式，你可以通过区块右上角的编辑按钮修改样式设置。如需了解更多信息，请访问<a target="_blank" href="http://twitter.github.io/bootstrap/base-css.html">基本CSS.</a></div>
              </div>
            </div>
          </li>
          <li style="display: none;" class="boxes" id="elmBase">
            <div class="box box-element ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span> 
            	 <span class="configuration"><button type="button" class="btn btn-mini" data-target="#editorModal" role="button" data-toggle="modal">编辑</button> <span class="btn-group"> <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">对齐 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="active"><a href="#" rel="">默认</a></li>
                <li class=""><a href="#" rel="text-left">靠左</a></li>
                <li class=""><a href="#" rel="text-center">居中</a></li>
                <li class=""><a href="#" rel="text-right">靠右</a></li>
              </ul>
              </span> <span class="btn-group"> <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">标记 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="active"><a href="#" rel="">默认</a></li>
                <li class=""><a href="#" rel="muted">禁用</a></li>
                <li class=""><a href="#" rel="text-warning">警告</a></li>
                <li class=""><a href="#" rel="text-error">错误</a></li>
                <li class=""><a href="#" rel="text-info">提示</a></li>
                <li class=""><a href="#" rel="text-success">成功</a></li>
              </ul>
              </span> </span>
              <div class="preview">标题栏</div>
              <div class="view">
                <h3 contenteditable="true">h3. 这是一套可视化布局系统.</h3>
              </div>
            </div>
            <div class="box box-element ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span> <span class="configuration"><button type="button" class="btn btn-mini" data-target="#editorModal" role="button" data-toggle="modal">编辑</button> <span class="btn-group"> <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">对齐 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="active"><a href="#" rel="">默认</a></li>
                <li class=""><a href="#" rel="text-left">靠左</a></li>
                <li class=""><a href="#" rel="text-center">居中</a></li>
                <li class=""><a href="#" rel="text-right">靠右</a></li>
              </ul>
              </span> <span class="btn-group"> <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">标记 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="active"><a href="#" rel="">默认</a></li>
                <li class=""><a href="#" rel="muted">禁用</a></li>
                <li class=""><a href="#" rel="text-warning">警告</a></li>
                <li class=""><a href="#" rel="text-error">错误</a></li>
                <li class=""><a href="#" rel="text-info">提示</a></li>
                <li class=""><a href="#" rel="text-success">成功</a></li>
              </ul>
              </span> <a class="btn btn-mini" href="#" rel="lead">Lead</a> </span>
              <div class="preview">段落</div>
              <div class="view" contenteditable="true">
                <p><em>Git</em>是一个分布式的版本控制系统，最初由<b>Linus Torvalds</b>编写，用作Linux内核代码的管理。在推出后，Git在其它项目中也取得了很大成功，尤其是在Ruby社区中。 </p>
              </div>
            </div>
            <div class="box box-element ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span>
              <span class="configuration"><button type="button" class="btn btn-mini" data-target="#editorModal" role="button" data-toggle="modal">编辑</button></span>
              <div class="preview">地址</div>
              <div class="view">
                <address contenteditable="true">
                <strong>Twitter, Inc.</strong><br>
                795 Folsom Ave, Suite 600<br>
                San Francisco, CA 94107<br>
                <abbr title="Phone">P:</abbr> (123) 456-7890
                </address>
              </div>
            </div>
            <div class="box box-element ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span> <span class="configuration"> <a class="btn btn-mini" href="#" rel="pull-right">右对齐</a> </span>
              <div class="preview">引用块</div>
              <div class="view clearfix">
                <blockquote contenteditable="true">
                  <p>github是一个全球化的开源社区.</p>
                  <small>关键词 <cite title="Source Title">开源</cite></small> </blockquote>
              </div>
            </div>
            <div class="box box-element ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span> <span class="configuration"><button type="button" class="btn btn-mini" data-target="#editorModal" role="button" data-toggle="modal">编辑</button> <a class="btn btn-mini" href="#" rel="unstyled">无样式</a> <a class="btn btn-mini" href="#" rel="inline">嵌入</a> </span>
              <div class="preview">无序列表</div>
              <div class="view">
                <ul contenteditable="true">
                  <li>新闻资讯</li>
                  <li>体育竞技</li>
                  <li>娱乐八卦</li>
                  <li>前沿科技</li>
                  <li>环球财经</li>
                  <li>天气预报</li>
                  <li>房产家居</li>
                  <li>网络游戏</li>
                </ul>
              </div>
            </div>
            <div class="box box-element ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span> <span class="configuration"><button type="button" class="btn btn-mini" data-target="#editorModal" role="button" data-toggle="modal">编辑</button> <a class="btn btn-mini" href="#" rel="unstyled">无样式</a> <a class="btn btn-mini" href="#" rel="inline">嵌入</a> </span>
              <div class="preview">有序列表</div>
              <div class="view">
                <ol contenteditable="true">
                  <li>新闻资讯</li>
                  <li>体育竞技</li>
                  <li>娱乐八卦</li>
                  <li>前沿科技</li>
                  <li>环球财经</li>
                  <li>天气预报</li>
                  <li>房产家居</li>
                  <li>网络游戏</li>
                </ol>
              </div>
            </div>
            <div class="box box-element ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span> <span class="configuration"><button type="button" class="btn btn-mini" data-target="#editorModal" role="button" data-toggle="modal">编辑</button> <a class="btn btn-mini" href="#" rel="dl-horizontal">竖向对齐</a> </span>
              <div class="preview">详细描述</div>
              <div class="view">
                <dl contenteditable="true">
                  <dt>Rolex</dt>
                  <dd>劳力士创始人为汉斯.威尔斯多夫，1908年他在瑞士将劳力士注册为商标。</dd>
                  <dt>Vacheron Constantin</dt>
                  <dd>始创于1775年的江诗丹顿已有250年历史，</dd>
                  <dd>是世界上历史最悠久、延续时间最长的名表之一。</dd>
                  <dt>IWC</dt>
                  <dd>创立于1868年的万国表有“机械表专家”之称。</dd>
                  <dt>Cartier</dt>
                  <dd>卡地亚拥有150多年历史，是法国珠宝金银首饰的制造名家。</dd>
                </dl>
              </div>
            </div>
            <div class="box box-element ui-draggable"> <a href="#close" class="remove label label-important"><i class="icon-remove icon-white"></i>删除</a> <span class="drag label"><i class="icon-move"></i>拖动</span> <span class="configuration"><button type="button" class="btn btn-mini" data-target="#editorModal" role="button" data-toggle="modal">编辑</button> <span class="btn-group"> <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">样式 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="active"><a href="#" rel="">默认</a></li>
                <li class=""><a href="#" rel="table-striped">条纹</a></li>
                <li class=""><a href="#" rel="table-bordered">边框</a></li>
              </ul>
              </span> <a class="btn btn-mini" href="#" rel="table-hover">鼠标指示</a> <a class="btn btn-mini" href="#" rel="table-condensed">紧凑</a> </span>
              <div class="preview">表格</div>
              <div class="view">
                <table class="table" contenteditable="true">
                  <thead>
                    <tr>
                      <th>编号</th>
                      <th>产品</th>
                      <th>交付时间</th>
                      <th>状态</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>TB - Monthly</td>
                      <td>01/04/2012</td>
                      <td>Default</td>
                    </tr>
                    <tr class="success">
                      <td>1</td>
                      <td>TB - Monthly</td>
                      <td>01/04/2012</td>
                      <td>Approved</td>
                    </tr>
                    <tr class="error">
                      <td>2</td>
                      <td>TB - Monthly</td>
                      <td>02/04/2012</td>
                      <td>Declined</td>
                    </tr>
                    <tr class="warning">
                      <td>3</td>
                      <td>TB - Monthly</td>
                      <td>03/04/2012</td>
                      <td>Pending</td>
                    </tr>
                    <tr class="info">
                      <td>4</td>
                      <td>TB - Monthly</td>
                      <td>04/04/2012</td>
                      <td>Call in to confirm</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <!--/span-->
    <div style="min-height: 590px;" class="demo ui-sortable"></div>
    <!--/span-->
    <div id="download-layout">
      <div class="container-fluid"></div>
    </div>
  </div>
  <!--/row--> 
</div>
<!--/.fluid-container--> 
<div class="modal hide fade" role="dialog" id="editorModal">
  <div class="modal-header"> <a class="close" data-dismiss="modal">×</a>
    <h3>编辑</h3>
  </div>
  <div class="modal-body">
    <p>
      <textarea id="contenteditor"></textarea>
    </p>
  </div>
  <div class="modal-footer"> <a id="savecontent" class="btn btn-primary" data-dismiss="modal">保存</a> <a class="btn" data-dismiss="modal">关闭</a> </div>
</div>

<script type="text/javascript">
$(function(){
	var design = "${ncase.design}";
	$(".demo").html($.base64.atob(design,true));
	$("#form").validate({          
	    rules:{
	    	title:{
	         	required:true,
	         	rangelength:[1,20]
	        },
	        time:{
	        	required:true,
	        	rangelength:[0,20]
	        },
	        simple:{
	        	required:true,
	        	rangelength:[1,200]
	        },
	        order:{
	        	required:true,
	        	digits:true,
	        	rangelength:[1,3]
	        }
	     }, 
	     messages:{
	    	 title:{
		         required:'标题不能为空',
		         rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
		     },
		     time:{
		        required:'时间不能为空',
		        rangelength:$.validator.format("输入的范围在 {0}-{1} 之间的字符.")
		     },
		     simple:{
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
	var value = $("#image").val();
	if(!value){
		alert("请先上传图片！");
	}
	if (!$("#form").valid()) {
        return;
    }
	
	var param = $("#form").serializeArray();
	var url = path+"/admin/modifyCase.do";
	pts.submit({
		url:url,
		data:param,
		yesClick:function(result){
			window.close();
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
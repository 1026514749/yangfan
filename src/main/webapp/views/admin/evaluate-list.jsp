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
<title>评价列表</title>
<%@include file="/common/header-back.jsp" %>
 
</head>
<body>
<!-- BEGIN SECTION --> 
<section id="container" class="">

<section class="wrapper site-min-height">
<form id = "form">
	<input type="hidden" name = "takon" value="1">
</form>

<div class="fsarea">
      <h2>评价列表</h2>

      <div class="toolbar">
          <button  class="btn btn-shadow btn-default" onclick="addEvaluate()">新增</button>
      </div>
      <div id="data_div" style="border: solid 1px #A8CFEB"></div>
    </div>
</section>

</section>
<script type="text/javascript">
var dataGrid = null;
var gridMenu = null;
$(function(){
	gridMenu = $.ligerMenu({
        width:110,
        items:[
          { id:'passClick', text:'审批通过', click:menuClick, icon:'pass' },
          { id:'deleteClick', text:'删除评价', click:menuClick, icon:'delete' }
        ]
      });
	dataGrid = $("#data_div").ligerGrid({
    primaryKey:'id',
    columns:[
	  { display:'操作', width:60, oprcol:true, icon:'${path}/images/ico_opr.gif'},
      { display:'名称', name:'name', align:'left', width:200},
      { display:'编码', name:'code', align:'left', width:200},
      { display:'链接', name:'url', align:'left', width:400},
      { display:'排序', name:'order', align:'left', width:100}
    ], width:'99%',
    url:path + "/admin/queryEvaluate.do",
    searchForm:'form',
    onDblClickRow:function (data, index, dom) {
    	passEvaluate(data.id);
      },
    oprcolMenu:gridMenu
  });
});

function menuClick(item, index, jsonObj) 
{
    if (item.id == 'passClick') 
    {
    	passEvaluate(jsonObj.rowData.id);
    } else if (item.id == 'deleteClick') 
    {
    	deleteEvaluate(jsonObj.rowData.id);
    }
}
function deleteEvaluate(id){
	var param = {};
	param.id=id;
	var url = path+"/admin/deleteEvaluate.do";
	pts.submit({
		url:url,
		data:param,
		yesClick:function(result){
			dataGrid.doSearch();
		}
	});
}
function passEvaluate(id){
	var param = {};
	param.id=id;
	var url = path+"/admin/passEvaluate.do";
	pts.submit({
		url:url,
		data:param,
		yesClick:function(result){
			dataGrid.doSearch();
		}
	});
}
function addEvaluate()
{
	pts.dialog({
		title:'新建评价',
		url:path+'/admin/evaluate.do',
		width:'70%',
		height:'70%',
		onClosed:function(result){
			dataGrid.doSearch();
		}
	});
}
</script>
</body>
</html>


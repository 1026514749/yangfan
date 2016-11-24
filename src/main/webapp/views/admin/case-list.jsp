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
<title>案例列表</title>
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
      <h2>栏目列表</h2>

      <div class="toolbar">
          <button  class="btn btn-shadow btn-default" onclick="addCase()">新增</button>
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
          { id:'modifyClick', text:'修改案例', click:menuClick, icon:'modify' },
          { id:'deleteClick', text:'删除案例', click:menuClick, icon:'delete' }
        ]
      });
	dataGrid = $("#data_div").ligerGrid({
    primaryKey:'id',
    columns:[
	  { display:'操作', width:60, oprcol:true, icon:'${path}/images/ico_opr.gif'},
      { display:'栏目', name:'code', align:'left', width:100},
      { display:'标题', name:'title', align:'left', width:100},
      { display:'时间', name:'time', align:'left', width:100},
      { display:'简介', name:'simple', align:'left', width:200},
      { display:'内容', name:'content', align:'left', width:400,render:function(data){
    	  var content = $($.base64.atob(data.content));
    	  return content.text();
      }},
      { display:'图片', name:'image', align:'left', width:100},
      { display:'排序', name:'order', align:'left', width:100}
    ], width:'99%',
    url:path + "/admin/queryCase.do",
    searchForm:'form',
    onDblClickRow:function (data, index, dom) {
    	modifyCase(data.id);
      },
    oprcolMenu:gridMenu
  });
});

function menuClick(item, index, jsonObj) 
{
    if (item.id == 'modifyClick') 
    {
    	modifyCase(jsonObj.rowData.id);
    } else if (item.id == 'deleteClick') 
    {
    	deleteCase(jsonObj.rowData.id);
    }
}

function modifyCase(id){
	var url = path+'/admin/case.do?id='+id;
	pts.openMax(url);
}
function deleteCase(id){
	var param = {};
	param.id=id;
	var url = path+"/admin/deleteCase.do";
	pts.submit({
		url:url,
		data:param,
		yesClick:function(result){
			dataGrid.doSearch();
		}
	});
}
function addCase()
{
	var url = path+'/admin/case.do';
	pts.openMax(url);
}
</script>
</body>
</html>


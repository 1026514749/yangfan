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
<title>活动列表</title>
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
          <button  class="btn btn-shadow btn-default" onclick="addActivity()">新增</button>
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
          { id:'modifyClick', text:'修改活动', click:menuClick, icon:'modify' },
          { id:'deleteClick', text:'删除活动', click:menuClick, icon:'delete' }
        ]
      });
	dataGrid = $("#data_div").ligerGrid({
    primaryKey:'id',
    columns:[
	  { display:'操作', width:60, oprcol:true, icon:'${path}/images/ico_opr.gif'},
      { display:'标题', name:'title', align:'left', width:200},
      { display:'简介图片', name:'image', align:'left', width:200},
      { display:'内容', name:'content', align:'left', width:400,render:function(data){
    	  var content = $($.base64.atob(data.content));
    	  return content.text();
      }},
      { display:'日期', name:'time', align:'left', width:100}
    ], width:'99%',
    url:path + "/admin/queryActivity.do",
    searchForm:'form',
    onDblClickRow:function (data, index, dom) {
    	modifyColumn(data.id);
      },
    oprcolMenu:gridMenu
  });
});

function menuClick(item, index, jsonObj) 
{
    if (item.id == 'modifyClick') 
    {
    	modifyActivity(jsonObj.rowData.id);
    } else if (item.id == 'deleteClick') 
    {
    	deleteActivity(jsonObj.rowData.id);
    }
}

function modifyActivity(id){
	var url = path+'/admin/activity.do?id='+id;
	pts.openMax(url);
}
function deleteActivity(id){
	var param = {};
	param.id=id;
	var url = path+"/admin/deleteActivity.do";
	pts.submit({
		url:url,
		data:param,
		yesClick:function(result){
			dataGrid.doSearch();
		}
	});
}
function addActivity()
{
	var url = path+'/admin/activity.do';
	pts.openMax(url);
}
</script>
</body>
</html>


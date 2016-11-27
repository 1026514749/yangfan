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
<title>栏目详情列表</title>
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
      <h2>栏目详情列表</h2>

      <div class="toolbar">
          <button  class="btn btn-shadow btn-default" onclick="addDetail()">新增</button>
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
          { id:'modifyClick', text:'修改详情', click:menuClick, icon:'modify' },
          { id:'deleteClick', text:'删除详情', click:menuClick, icon:'delete' }
        ]
      });
	dataGrid = $("#data_div").ligerGrid({
    primaryKey:'id',
    columns:[
	  { display:'操作', width:60, oprcol:true, icon:'${path}/images/ico_opr.gif'},
      { display:'栏目类型', name:'code', align:'left', width:200},
      { display:'栏目内容', name:'content', align:'left', width:600,render:function(data){
    	  var content = $($.base64.atob(data.content,true));
    	  return content.text();
      }}
    ], width:'99%',
    url:path + "/admin/queryColumnDetail.do",
    searchForm:'form',
    onDblClickRow:function (data, index, dom) {
    	modifyDetail(data.id);
      },
    oprcolMenu:gridMenu
  });
});

function menuClick(item, index, jsonObj) 
{
    if (item.id == 'modifyClick') 
    {
    	modifyDetail(jsonObj.rowData.id);
    } else if (item.id == 'deleteClick') 
    {
    	deleteDetail(jsonObj.rowData.id);
    }
}

function modifyDetail(id){
	var url = path+'/admin/columnDetail.do?id='+id;
	pts.openMax(url);
}
function deleteDetail(id){
	var param = {};
	param.id=id;
	var url = path+"/admin/deleteColumnDetail.do";
	pts.submit({
		url:url,
		data:param,
		yesClick:function(result){
			dataGrid.doSearch();
		}
	});
}
function addDetail()
{
	var url = path+'/admin/columnDetail.do';
	pts.openMax(url);
}
</script>
</body>
</html>


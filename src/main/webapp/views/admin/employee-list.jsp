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
<title>栏目列表</title>
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
      <h2>员工列表</h2>

      <div class="toolbar">
          <button  class="btn btn-shadow btn-default" onclick="addEmployee()">新增</button>
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
          { id:'modifyClick', text:'修改员工', click:menuClick, icon:'modify' },
          { id:'deleteClick', text:'删除员工', click:menuClick, icon:'delete' }
        ]
      });
	dataGrid = $("#data_div").ligerGrid({
    primaryKey:'id',
    columns:[
	  { display:'操作', width:60, oprcol:true, icon:'${path}/images/ico_opr.gif'},
      { display:'姓名', name:'name', align:'left', width:200},
      { display:'职位', name:'position', align:'left', width:200},
      { display:'电话', name:'phone', align:'left', width:200},
      { display:'头像', name:'image', align:'left', width:200},
      { display:'排序', name:'order', align:'left', width:100}
    ], width:'99%',
    url:path + "/admin/queryEmployee.do",
    searchForm:'form',
    onDblClickRow:function (data, index, dom) {
    	modifyEmployee(data.id);
      },
    oprcolMenu:gridMenu
  });
});

function menuClick(item, index, jsonObj) 
{
    if (item.id == 'modifyClick') 
    {
    	modifyEmployee(jsonObj.rowData.id);
    } else if (item.id == 'deleteClick') 
    {
    	deleteEmployee(jsonObj.rowData.id);
    }
}

function modifyEmployee(id){
	pts.dialog({
		title:'新建员工',
		url:path+'/admin/employee.do?id='+id,
		width:'70%',
		height:'70%',
		onClosed:function(result){
			dataGrid.refresh();
		}
	});
}
function deleteEmployee(id){
	var param = {};
	param.id=id;
	var url = path+"/admin/deleteEmployee.do";
	pts.submit({
		url:url,
		data:param,
		yesClick:function(result){
			dataGrid.doSearch();
		}
	});
}
function addEmployee()
{
	pts.dialog({
		title:'新建员工',
		url:path+'/admin/employee.do',  
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


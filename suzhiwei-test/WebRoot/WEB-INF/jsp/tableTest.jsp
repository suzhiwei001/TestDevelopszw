<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tableTest</title>
<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/resources/jquery-easyui-1.4.1/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/resources/jquery-easyui-1.4.1/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/resources/jquery-easyui-1.4.1/demo/demo.css">
<script type="text/javascript"
	src="<%=basePath%>/resources/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/resources/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script src="<%=basePath%>/resources/json/taffy.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/resources/json/json2.js"
	type="text/javascript"></script>
</head>
<style type="text/css">
#divframe {
	border: 1px solid #999;
	width: 500px;
	margin: 0 auto;
}

.loadTitle {
	background: #CCC;
	height: 30px;
}
</style>
<body>

	<div class="easyui-layout" style="width: 100%; height: 600px;">
		<div data-options="region:'north'" style="height:50px"></div>
		<div data-options="region:'south',split:true,title:'点点滴滴'" style="height: 200px;">
			<div align="center">
				<table id="dg"></table>
				<input type="button" onclick="addData(data,jsonTable)" value="添加">
			</div>
		</div>
		<div data-options="region:'east',split:true,title:'要素值域取值',collapsible:false"
			style="width: 50%;">
			<div align="center">
				<table id="elementTable"></table>
				<input type="button" onclick="addData(dataElements,jsonElements)" value="添加">
			</div>
		</div>
		<div data-options="region:'center',title:'要素',iconCls:'icon-ok',"
			style="padding: 10px；width:50%;">
			<div align="center">
				<table id="elementValueTable"></table>
				<input type="button" onclick="addData(dataElementValues,jsonElementValues)" value="添加">
			</div>
		</div>
	</div>


</body>

<script type="text/javascript">
//下拉数据
var products=[{productid:'1',name:'sss'}];
//定义变量，用于存放数据
var jsonTable={elements:[{id:'1',code:'', name:'',price:'',age:''}]};
var jsonElements={elements:[{id:'1',code:'', name:'',price:'',age:''}]};
var jsonElementValues={elements:[{id:'1',code:'', name:'',price:'',age:''}]};
var data=jsonTable.elements;
var dataElements=jsonElements.elements;
var dataElementValues=jsonElementValues.elements;

var fffff={fffff:[[{field:'checkbox',checkbox:true,width:100},
			{field:'id',title:'id',width:100},
			{field:'code',title:'Code',width:100,editor:'text'},
			{field:'name',title:'Name',width:100,editor:'datebox'},
			{field:'price',title:'Price',width:100,align:'right'},
			{field:'age',title:'age',width:100,align:'center'}]]};
var f=fffff.fffff; 
/* 三、初始化表格  */
$(loading());
function loading(){
	$('#dg').datagrid({
		/* 加载数据json文件中的数据 */
		<%-- url:'<%=basePath%>/resources/datagrid_data.json', --%>
		fitColumns:true,//设置为 true，则会自动扩大或缩小列的尺寸以适应网格的宽度并且防止水平滚动。
		autoRowHeight:false,//显示右侧下拉列表
		striped:true,//
		data:data,
		//pagination:true,//设置为true显示分页栏
		rownumbers:true,//显示带有行号的列
		pageNumber:1,
		pageSize:10,
		showFooter:true,
		checkOnSelect:false,
		onClickCell: function(index,field,value){
 			$(this).datagrid('beginEdit', index);
			//var ed = $(this).datagrid('getEditor', {index:index,field:field});
			//alert("进入时获取的值："+ed);
			alert("单击");
		},
		onDblClickCell: function(index,field,value){
			//alert("结束时的值"+ed);
			alert("双击");
			$(this).datagrid('endEdit', index);
		},
		/* 定义列 */
	    columns:f,
		toolbar: [{
			iconCls: 'icon-add',
			handler: function(){addData(data,jsonTable)}
		},'-',{
			iconCls: 'icon-edit',
			handler: function(){updataData('dg')}
		},'-',{
			iconCls: 'icon-remove',
			handler: function(){deleteData('dg',data)}
		}],

	});
	$('#elementTable').datagrid({
		/* 加载数据json文件中的数据 */
		<%-- url:'<%=basePath%>/resources/datagrid_data.json', --%>
		fitColumns:true,//设置为 true，则会自动扩大或缩小列的尺寸以适应网格的宽度并且防止水平滚动。
		autoRowHeight:false,//显示右侧下拉列表
		striped:true,//
		data:dataElements,
		//pagination:true,//设置为true显示分页栏
		rownumbers:true,//显示带有行号的列
		pageNumber:1,
		pageSize:10,
		showFooter:true,
		checkOnSelect:false,
		onClickCell: function(index,field,value){
 			$(this).datagrid('beginEdit', index);
			//var ed = $(this).datagrid('getEditor', {index:index,field:field});
			//alert("进入时获取的值："+ed);
			alert("单击");
		},
		onDblClickCell: function(index,field,value){
			//alert("结束时的值"+ed);
			alert("双击");
			$(this).datagrid('endEdit', index);
		},
		/* 定义列 */
	    columns:[[
			{field:'checkbox',checkbox:true,width:100},
			{field:'id',title:'id',width:100},
			{field:'code',title:'Code',width:100,editor:'text'},
			{field:'name',title:'Name',width:100,editor:'datebox'},
			{field:'price',title:'Price',width:100,align:'right',editor:{
				type:'checkbox',
				options:{
					on: 'P',
					off: ''
				}
			}},
			{field:'age',title:'age',width:100,align:'center',
				editor:{
				type:'combobox',
				options:{
					valueField:'productid',
					textField:'name',
					data:products,
					required:true
				}
			}}
	    ]],
		toolbar: [{
			iconCls: 'icon-add',
			handler: function(){addData(dataElements,jsonElements)}
		},'-',{
			iconCls: 'icon-edit',
			handler: function(){updataData('elementTable')}
		},'-',{
			iconCls: 'icon-remove',
			handler: function(){deleteData('elementTable',dataElements)}
		}],
		onBeforeEdit:function(index,row){
			alert("当用户开始编辑一行时触发")
			row.editing = true;
			updateActions(index);
		},
		onAfterEdit:function(index,row){
			alert("完成编辑一行时触发")
			saverow(index)
			row.editing = false;
			updateActions(index);
		},
		onCancelEdit:function(index,row){
			alert("取消编辑")
			row.editing = false;
			updateActions(index);
		}
	});
	$('#elementValueTable').datagrid({
		/* 加载数据json文件中的数据 */
		<%-- url:'<%=basePath%>/resources/datagrid_data.json', --%>
		fitColumns:true,//设置为 true，则会自动扩大或缩小列的尺寸以适应网格的宽度并且防止水平滚动。
		autoRowHeight:false,//显示右侧下拉列表
		striped:true,//
		data:dataElementValues,
		//pagination:true,//设置为true显示分页栏
		rownumbers:true,//显示带有行号的列
		pageNumber:1,
		pageSize:10,
		showFooter:true,
		checkOnSelect:false,
		onClickCell: function(index,field,value){
 			$(this).datagrid('beginEdit', index);
			//var ed = $(this).datagrid('getEditor', {index:index,field:field});
			//alert("进入时获取的值："+ed);
			alert("单击");
		},
		onDblClickCell: function(index,field,value){
			//alert("结束时的值"+ed);
			alert("双击");
			$(this).datagrid('endEdit', index);
		},
		/* 定义列 */
	    columns:[[
			{field:'checkbox',checkbox:true,width:100},
			{field:'id',title:'id',width:100},
			{field:'code',title:'Code',width:100,editor:'text'},
			{field:'name',title:'Name',width:100,editor:'datebox'},
			{field:'price',title:'Price',width:100,align:'right',editor:{
				type:'checkbox',
				options:{
					on: 'P',
					off: ''
				}
			}},
			{field:'age',title:'age',width:100,align:'center',
				editor:{
				type:'combobox',
				options:{
					valueField:'productid',
					textField:'name',
					data:products,
					required:true
				}
			}}
	    ]],
		toolbar: [{
			iconCls: 'icon-add',
			handler: function(){addData(dataElementValues,jsonElementValues)}
		},'-',{
			iconCls: 'icon-edit',
			handler: function(){updataData('elementValueTable')}
		},'-',{
			iconCls: 'icon-remove',
			handler: function(){deleteData('elementValueTable',dataElementValues)}
		}],
		onBeforeEdit:function(index,row){
			alert("当用户开始编辑一行时触发")
			row.editing = true;
			updateActions(index);
		},
		onAfterEdit:function(index,row){
			alert("完成编辑一行时触发")
			saverow(index)
			row.editing = false;
			updateActions(index);
		},
		onCancelEdit:function(index,row){
			alert("取消编辑")
			row.editing = false;
			updateActions(index);
		}
	});
}
function updateActions(index){
/* 	$('#dg').datagrid('updateRow',{
		index: index,
		row:{}
	}); */
}

function getRowIndex(target){
	var tr = $(target).closest('tr.datagrid-row');
	return parseInt(tr.attr('datagrid-row-index'));
}
function editrow(target){
	$('#dg').datagrid('beginEdit', getRowIndex(target));
}
function deleterow(target){
	$.messager.confirm('Confirm','Are you sure?',function(r){
		if (r){
			$('#tt').datagrid('deleteRow', getRowIndex(target));
		}
	});
}
function saverow(target){
	var s = $('#dg').datagrid('endEdit', getRowIndex(target));
	alert("结束编辑"+s);
}
function cancelrow(target){
	$('#dg').datagrid('cancelEdit', getRowIndex(target));
}
//行內編輯器
function rowEditor(value){
	for(var i=0; i<products.length; i++){
		if (products[i].productid == value) 
			return products[i].name;
	}
	return value;
};





var str=""; 

//一、添加数据
function addData(datas,jsonTables){
	var element={id:'1',code:'', name:'',price:'',age:''}; 
	var a=0;
	for(var i=0; i<datas.length-1; i++){
		a=datas[i].id;
		datas[i].id<datas[i+1].id;
		a=datas[i+1].id;
	} 
	element.id=parseInt(a)+parseInt(1);
	if(datas.length==1){
		element.id=2;
	}
	jsonTables.elements.push(element);
	loading();
}
/* //二、修改数据
function updataData(tableId){
	var rows;
	var ids = [];
	//获取选中的数据
	rows = $('#'+tableId).datagrid('getSelections');
	for(var i=0; i<rows.length; i++){
		ids.push(rows[i].id);
	}
} */
//三、删除数据
function deleteData(tableId,datas){
	var rows;
	var ids = [];
	//获取选中的数据
	rows = $('#'+tableId).datagrid('getSelections');
	for(var i=0; i<rows.length; i++){
		ids.push(rows[i].id);
	}
	for(var i=0; i<ids.length; i++){
		for(var j=0; j<datas.length; j++){
			if(ids[i]==datas[j].id){
				datas.splice(j,1);
				loading();
				}
			}
		
	}
}
</script>
</html>
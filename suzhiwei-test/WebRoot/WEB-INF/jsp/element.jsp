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
<script src="<%=basePath%>/resources/json/json2.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="easyui-layout" style="width: 100%; height: 600px;">
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
//定义变量，用于存放数据
var jsonTable={elements:[{id:'1',code:'', name:'',price:'',age:''}]};
var jsonElements={elements:[{id:'1',code:'', name:'',price:'',age:''}]};
var jsonElementValues={elements:[{id:'1',code:'', name:'',price:'',age:''}]};
var data=jsonTable.elements;
var dataElements=jsonElements.elements;
var dataElementValues=jsonElementValues.elements;
/* 三、初始化表格  */
$(loading());
function loading(){
	$('#dg').datagrid({
		fitColumns:true,
		autoRowHeight:false,//显示右侧下拉列表
		striped:true,
		data:data,
		rownumbers:true,//显示带有行号的列
		pageNumber:1,
		pageSize:10,
		showFooter:true,
		checkOnSelect:false,
	    columns:[[
			{field:'checkbox',checkbox:true,width:100},
			{field:'id',title:'id',width:100},
			{field:'code',title:'Code',width:100,editor:'text'},
			{field:'name',title:'Name',width:100,editor:'datebox'},
			{field:'price',title:'Price',width:100,align:'right'},
			{field:'age',title:'age',width:100,align:'center'}]],
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
		fitColumns:true,
		autoRowHeight:false,//显示右侧下拉列表
		striped:true,//
		data:dataElements,
		rownumbers:true,//显示带有行号的列
		pageNumber:1,
		pageSize:10,
		showFooter:true,
		checkOnSelect:false,
	    columns:[[
			{field:'checkbox',checkbox:true,width:100},
			{field:'id',title:'id',width:100},
			{field:'code',title:'Code',width:100,editor:'text'},
			{field:'name',title:'Name',width:100,editor:'datebox'},
			{field:'price',title:'Price',width:100,align:'right',},
			{field:'age',title:'age',width:100,align:'center'}
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
		}]
	});
	$('#elementValueTable').datagrid({
		fitColumns:true,
		striped:true,//
		data:dataElementValues,
		rownumbers:true,//显示带有行号的列
		pageNumber:1,
		pageSize:10,
		showFooter:true,
		checkOnSelect:false,
	    columns:[[
			{field:'checkbox',checkbox:true,width:100},
			{field:'id',title:'id',width:100},
			{field:'code',title:'Code',width:100,editor:'text'},
			{field:'name',title:'Name',width:100,editor:'datebox'},
			{field:'price',title:'Price',width:100,align:'right'},
			{field:'age',title:'age',width:100,align:'center',}]],
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
	});
}
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
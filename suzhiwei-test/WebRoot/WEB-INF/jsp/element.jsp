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
<body style="margin:0; padding:0">
	<div class="easyui-layout" style="width:100%; height:600px;position:relative;top:0px">
<!-- 		<div data-options="region:'south',split:true,title:'要素取值约束'" style="height: 200px;">
			<div align="center">
				<table id="elementValueConstraint"></table>
				<input type="button" onclick="addData('elementValueConstraint',dataTable,jsonTable);" value="添加">
			</div>
		</div> -->
		<div data-options="region:'east',split:true,title:'要素值域取值',collapsible:false"
			style="width: 50%;">
			<div align="center">
				<table id="elementValueTable"></table>
				<table id="elementValueConstraint"></table>
				<input type="button" onclick="addData('elementValueTable',dataElementValues,jsonElementValues)" value="添加">
			</div>
		</div>
		<div data-options="region:'center',title:'要素',iconCls:'icon-ok',">
			<div align="center">
				<table id="elementTable"></table>
				<input type="button" onclick="addData('elementTable',dataElements,jsonElements)" value="添加">
			</div>
		</div>
	</div>	
	
</body>

<script type="text/javascript">
<!--定义列-->
var columnsTable={columns:[[{field:'checkbox',checkbox:true,width:100},
	{field:'id',title:'id',width:100},
	{field:'Code',title:'Code',width:100,align:'center',editor:'text'},
	{field:'name',title:'Name',width:100,align:'center',editor:'text'},
	{field:'price',title:'Price',width:100,align:'center',editor:'text'},
	{field:'age',title:'age',width:100,align:'center',editor:'text'},
/* 	{field:'action',title:'Action',width:70,align:'center',
		formatter:function(value,row,index){
			if (row.editing){
				//var s = '<button><a href="#" type="button" onclick="saverow(this)">Save</a></button>';
				var s = '<button onclick="saverow(this)">保存</button>';
				//var c = '<a href="#" onclick="cancelrow(this)">Cancel</a>';
				var c = '<button onclick="cancelrow(this)">取消</button>';
				return s+c;
			} else {
				var e = '<a href="#" onclick="editrow(this)">编辑</a> ';
				var d = '<a href="#" onclick="deleterow(this)">删除</a>';
				return e+d;
			}
		}
	} */]]};
<!--要素列-->
var columnsElement={columns:[[{field:'checkbox',checkbox:true,width:100},
	{field:'id',title:'id',width:100,},
	{field:'elementName',title:'要素名称',width:100,align:'center',editor:'text'},
	{field:'name',title:'要素风险',width:100,align:'center',editor:'text'},
	{field:'price',title:'变更说明',width:100,align:'center',editor:'text'},
	{field:'age',title:'age2',width:100,align:'center',editor:'text'}]]};
<!--要素值域取值列-->
var columnsElementValue={columns:[[{field:'checkbox',checkbox:true,width:100},
	{field:'id',title:'id',width:100},
	{field:'code',title:'Code3',width:100,align:'center',editor:'text'},
	{field:'name',title:'Name3',width:100,align:'center',editor:'text'},
	{field:'price',title:'Price3',width:100,align:'center',editor:'text'},
	{field:'age',title:'age3',width:100,align:'center',editor:'text'}]]};
<!--定义进入表格时的列-->
var columnsTables=columnsTable.columns;
var columnsElements=columnsElement.columns;
var columnsElementValues=columnsElementValue.columns;
<!--定义变量,用于临时存放数据-->
var jsonTable={elements:[{id:'1',code:'', name:'',price:'',age:''}]};
var jsonElements={elements:[{id:'1',elementName:'', name:'',price:'',age:''}]};
var jsonElementValues={elements:[{id:'1',code:'', name:'',price:'',age:''}]};
<!--得到需要的数据,也是后台需要的数据-->
var dataTable=jsonTable.elements;
var dataElements=jsonElements.elements;
var dataElementValues=jsonElementValues.elements;
<!--初始化表格-->
$(function(){
	<!--表格id,表格列,表格的现有数据,定义的表格数据-->
	loading('elementValueConstraint',columnsTables,dataTable,jsonTable);
	loading('elementTable',columnsElements,dataElements,jsonElements);
	loading('elementValueTable',columnsElementValues,dataElementValues,jsonElementValues);
});
<!--更新是调用表格-->
function retreshTable(tableId){
	if('elementValueConstraint'==tableId){
		loading(tableId,columnsTables,dataTable,jsonTable);
	}
	if('elementTable'==tableId){
		loading(tableId,columnsElements,dataElements,jsonElements);
	}
	if('elementValueTable'==tableId){
		loading(tableId,columnsElementValues,dataElementValues,jsonElementValues);
	}
}
var windowHeight;
var windowwidth;
<!--datagrid表格-->
function loading(tableId,columns,data,jsondata){
	if(tableId!='elementValueConstraint'){
		windowHeight=$(window).height()/2;
		windowwidth=$(window).width()/2;
	}else{
		windowHeight=$(window).height();
		windowwidth=$(window).width();
	}

	$('#'+tableId).datagrid({
		width:windowwidth,
		height:windowHeight,
		fitColumns:true,
		autoRowHeight:false,//显示右侧下拉列表
		striped:true,
		data:data,
		rownumbers:true,//显示带有行号的列
		//pageNumber:1,
		pageSize:10,
		view:scrollview,
		showFooter:true,
		checkOnSelect:false,
		fitColumns:true,
		onClickCell:function(index,field,value){updataTable(index,field,value,tableId)},
	    columns:columns,
		toolbar: [{
			iconCls: 'icon-add',
			text:'添加',
			handler: function(){addData(tableId,data,jsondata)}
		},'-',{
			iconCls: 'icon-edit',
			text:'修改',
			handler: function(){updataData(tableId)}
		},'-',{
			iconCls: 'icon-remove',
			text:'删除',
			handler: function(){deleteData(tableId,data)}
		},'-',{
			iconCls: 'icon-edit',
			text:'懒加载测试',
			handler: function(){
				
			}
		}]
/* 		onBeforeEdit:function(index,row){
			row.editing = true;
			updateActions(index);
		},
		onAfterEdit:function(index,row){
			row.editing = false;
			updateActions(index);
		},
		onCancelEdit:function(index,row){
			row.editing = false;
			updateActions(index);
		} */

	});
}
<!--添加数据-->
function addData(tableId,datas,jsonTables){
	var element;
	if('elementValueConstraint'==tableId){
		element={id:'1',code:'', name:'',price:'',age:''};}
	if('elementTable'==tableId){
		element={id:'1',elementName:'', name2:'',price2:'',age2:''};}
	if('elementValueTable'==tableId){
		element={id:'1',code3:'', name3:'',price3:'',age3:''};}
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
	<!--刷新表格-->
	retreshTable(tableId);
}

<!--删除数据-->
	function deleteData(tableId, datas) {
		var rows;
		var ids = [];
		<!--获取选中的数据-->
		rows = $('#' + tableId).datagrid('getSelections');
		if (0 == rows.length) {
			$.messager.alert('消息提示框', '请至少选择一条需要删除的数据！！！');
			return;
		}
		for (var i = 0; i < rows.length; i++) {
			ids.push(rows[i].id);
		}
		for (var i = 0; i < ids.length; i++) {
			for (var j = 0; j < datas.length; j++) {
				if (ids[i] == datas[j].id) {
					datas.splice(j, 1);
				}
			}
			<!--刷新表格-->
			retreshTable(tableId);
		}
	}
 	<!--修改数据-->
  	var editIndex = undefined;
 	function updataTable(index, field, value, tableId) {
		if (editIndex == undefined) {
			$('#' + tableId).datagrid('beginEdit', index);
			var ed = $('#' + tableId).datagrid('getEditor', {
				index : index,
				field : field
			});
			editIndex = index;
			if(editIndex == index){
				ed.target.bind('blur',(function(){
					$('#' + tableId).datagrid('endEdit', editIndex);
						editIndex = undefined;
					}));	
			}

		} else if (editIndex != undefined) {//如果不相等，说明已经打开编辑器了，需要关闭编辑器  
			$('#' + tableId).datagrid('endEdit', editIndex);
			editIndex = undefined;
		}
	}
 	
 	
/* 	function updateActions(index){
		$('#elementValueConstraint').datagrid('updateRow',{
			index: index,
			row:{}
		});
	}
	function getRowIndex(target){
		var tr = $(target).closest('tr.datagrid-row');
		return parseInt(tr.attr('datagrid-row-index'));
	}
	function editrow(target){
		$('#elementValueConstraint').datagrid('beginEdit', getRowIndex(target));
	}
	function deleterow(target){
		$.messager.confirm('Confirm','Are you sure?',function(r){
			if (r){
				$('#elementValueConstraint').datagrid('deleteRow', getRowIndex(target));
			}
		});
	}
	function saverow(target){
		$('#elementValueConstraint').datagrid('endEdit', getRowIndex(target));
	}
	function cancelrow(target){
		$('#elementValueConstraint').datagrid('cancelEdit', getRowIndex(target));
	} */
</script>
</html>
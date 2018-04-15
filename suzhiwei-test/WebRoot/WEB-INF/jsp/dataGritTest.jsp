<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cell Editing in DataGrid - jQuery EasyUI Demo</title>
	<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js" type="text/javascript"></script>	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/jquery-easyui-1.4.1/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/jquery-easyui-1.4.1/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/jquery-easyui-1.4.1/demo/demo.css">
	<script type="text/javascript" src="<%=basePath%>/resources/jquery-easyui-1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/resources/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
</head>
<body>
	<h2>Cell Editing in DataGrid</h2>
	<p>Click a cell to start editing.</p>
	<div style="margin:20px 0;"></div>
	
	<table id="dg" class="easyui-datagrid" title="Cell Editing in DataGrid" style="width:700px;height:auto"
			data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				url: '<%=basePath%>/resources/jquery-easyui-1.4.1/demo/datagrid/datagrid_data1.json',
				method:'get',
				onClickCell: onClickCell
			">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">Item ID</th>
				<th data-options="field:'productid',width:100,editor:'text'">Product</th>
				<th data-options="field:'listprice',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}">List Price</th>
				<th data-options="field:'unitcost',width:80,align:'right',editor:'numberbox'">Unit Cost</th>
				<th data-options="field:'attr1',width:250,editor:'text'">Attribute</th>
				<th data-options="field:'status',width:60,align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">Status</th>
			</tr>
		</thead>
	</table>

	<script type="text/javascript">
		$.extend($.fn.datagrid.methods, {
			editCell: function(jq,param){
				return jq.each(function(){
					var opts = $(this).datagrid('options');
					var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
					for(var i=0; i<fields.length; i++){
						var col = $(this).datagrid('getColumnOption', fields[i]);
						col.editor1 = col.editor;
						if (fields[i] != param.field){
							col.editor = null;
						}
					}
					$(this).datagrid('beginEdit', param.index);
					for(var i=0; i<fields.length; i++){
						var col = $(this).datagrid('getColumnOption', fields[i]);
						col.editor = col.editor1;
					}
				});
			}
		});
		
		var editIndex = undefined;
		function endEditing(){
			if (editIndex == undefined){return true}
			if ($('#dg').datagrid('validateRow', editIndex)){
				$('#dg').datagrid('endEdit', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function onClickCell(index, field){
			if (endEditing()){
				$('#dg').datagrid('selectRow', index)
						.datagrid('editCell', {index:index,field:field});
				editIndex = index;
			}
		}
	</script>

	测试的案例
	<div class="easyui-layout" style="width:100%;height:600px;">
		<!--<div data-options="region:'north'" style="height:50px">发发发</div>-->
		<div data-options="region:'south',split:true" style="height:200px;"></div>
		<div data-options="region:'east',split:true,title:'East',collapsible:false" style="width:50%;">
			<table id="tt" class="easyui-propertygrid" data-options="
						url: 'propertygrid_data1.json',
						method: 'get',
						showGroup: true,
						fit: true,
						border: false
					">
			</table>
		</div>
		<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok',href:'_content.html'" style="padding:10px；width:50%;">
		</div>
	</div>
</body>
</html>
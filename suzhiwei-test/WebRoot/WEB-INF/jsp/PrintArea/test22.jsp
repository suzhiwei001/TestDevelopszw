<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script src="<%=basePath%>/resources/PrintArea/jquery.printarea.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap/dist/css/bootstrap.min.css" type="text/css" />

<title>test2</title>

</head>
<body>
<div id = "dy">
<table>
<tr>
<td><input type="text" value="dfssd"/></td>
</tr>
</table>
</div>


<div id = "dy2">
<table id="elementTable"></table>
</div>

</body>
<script type="text/javascript">
$(function(){dfd()})
function dfd(){
$('#elementTable').datagrid({
	/* 加载数据json文件中的数据 */
	fitColumns:true,//设置为 true，则会自动扩大或缩小列的尺寸以适应网格的宽度并且防止水平滚动。
	autoRowHeight:false,//显示右侧下拉列表
	striped:true,//
	pageNumber:1,
	pageSize:10,
	showFooter:true,
	checkOnSelect:false,
	/* 定义列 */
    columns:[[
		{field:'code',title:'Code',width:100},
		{field:'name',title:'Name',width:100},
		{field:'price',title:'Price',width:100,align:'right'},
		{field:'age',title:'age',width:100,align:'center'}
    ]],
	toolbar: [{
		iconCls: 'icon-add',
		text:"添加",
		handler: function(){addData()}
	},'-',{
		iconCls: 'icon-edit',
		text:"打印",
		handler: function(){
			//alert(JSON.stringify($("#elementTable .datagrid-view")))
			$("#dy").printArea();
			//$('#elementTable:.datagrid-view').printArea();
			}
	}],
});
}
 
//一、添加数据
function addData(){
	$('#elementTable').datagrid('appendRow',{
		id:'1',
		"code":'无法',
		name:'发发发',
		price:'分为非',
		age:'23'
	});
}
</script>
</html>
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
	<title>是是是</title>
	<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js" type="text/javascript"></script>	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/jquery-easyui-1.4.1/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/jquery-easyui-1.4.1/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/jquery-easyui-1.4.1/demo/demo.css">
	<script type="text/javascript" src="<%=basePath%>/resources/jquery-easyui-1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/resources/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
		<script src="<%=basePath%>/resources/json/taffy.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/json/json2.js" type="text/javascript"></script>
</head>
<style type="text/css"> 
#divframe{ border:1px solid #999; width:500px; margin:0 auto;} 
.loadTitle{ background:#CCC; height:30px;} 
</style>
<body>

<!-- 一、表格  -->
<div align="center"><table id="dg"></table>
<input type="button" onclick="aa()" value="单机动态添加数据">
<input type="button" onclick="deletesss(2)" value="shanch"></div>
<!-- 二、点击事件  -->
<input type="button" onclick="updateRows()" value="点击修改指定的行">
<input type="button" onclick="datagridaaa()" value="保存数据">

<!-- 用于测试json文件 -->
<div id="divframe"> 
<div class="loadTitle"> 
<input type="button" value="获取数据" id="btn"/> 
</div> 
<div id="jsonTip"> 
</div> 
</div>
<!-- 用于测试json文件结束 -->
</body>
<script type="text/javascript">

var json={"total":30,"rows":[
	{"code":"AV-CB-01","name":"Amazon Parrot","price":1000,"age":92.00},
	{"code":"002","name":"0022","price":10,"age":20}
]}
/* 三、初始化表格  */
$('#dg').datagrid({
	/* 加载数据json文件中的数据 */
	<%-- url:'<%=basePath%>/resources/datagrid_data.json', --%>
	fitColumns:true,//设置为 true，则会自动扩大或缩小列的尺寸以适应网格的宽度并且防止水平滚动。
	autoRowHeight:false,//显示右侧下拉列表
	striped:true,//
	data: [
		{code:'value11', name:'value12',price:100,age:'cccc'},
		{code:'value11', name:'value12',price:100,age:'text'}
	],
	//pagination:true,//设置为true显示分页栏
	rownumbers:true,//显示带有行号的列
	pageNumber:1,
	pageSize:10,
	showFooter:true,
	/* 定义列 */
    columns:[[
		{field:'checkbox',checkbox:true,width:100},
		{field:'code',title:'Code',width:100,editor:'text'},
		{field:'name',title:'Name',width:100,editor:'datebox'},
		{field:'price',title:'Price',width:100,align:'right',editor:'numberbox'},
		{field:'age',title:'age',width:100,align:'center',editor:'text'}
    ]],
	toolbar: [{
		iconCls: 'icon-edit',
		handler: function(){$('#dg').datagrid('appendRow',data);}
	},'-',{
		iconCls: 'icon-help',
		handler: function(){alert('help')}
	}]
});
/*
 * 用户双击单元格触发修改
 */
$('#dg').datagrid({
	onClickCell: function(index,field,value){
		$(this).datagrid('beginEdit', index);
		var ed = $(this).datagrid('getEditor', {index:index,field:field});
		$(ed.target).focus();
	}
});

function updateRows(){
$('#dg').datagrid('updateRow',{
	index: 2,
	row: {
		name: 'new name',
		note: 'new note message'
	}
});
}



var data ={code:'001',name: 'new name',price: 300,age: '30'}
function aa(){
	/* 动态往表格添加数据 */
	$('#dg').datagrid('appendRow',data);
	/* 需要把数据加载到json */
}
/* 删除行*/
function deletesss(){
	/* 动态往表格添加数据 */
	$('#dg').deleteRow();
	/* 需要把数据加载到json */
}
var code='002';
var codeDe=null;
/* 测试json文件 */
$(function (){
  $("#btn").click(function ()  {
    $.getJSON("<%=basePath%>/resources/datagrid_data2.json", function (data){
    var $jsontip = $("#jsonTip");
      var strHtml = "123";
      //存储数据的变量 
      //清空内容 
      $jsontip.empty();
     // 遍历json文件数据取出需要的值
      $.each(data, function (infoIndex,info){
		if(infoIndex=="rows"){
			$.each(info,function (infoIndex, info){
				//var ntaffy=TAFFY(info);
				//alert(ntaffy);
				$.each(info,function (infoIndex, info){
						//ntaffy({code:'002'}).remove();
						//alert(info)
/* 					if(infoIndex=="AV-CB-01"){
						alert(2);
					} */
				})
				//alert(info);
			})
		}


		
/*         strHtml += "1：" + info["code"] + "<br>";
        strHtml += "2：" + info["name"] + "<br>";
        strHtml += "3：" + info["price"] + "<br>";
        strHtml += "4：" + info["age"] + "<br>";
        strHtml += "<hr>"  */
      }) 
       	var tjson=[{id:'1',name:'marry'},{id:'2',name:'tom'}];
		var ntaffy=TAFFY(tjson);
		var mname=ntaffy({id:'2'}).first().name;//查询
		alert(mname);
		ntaffy({id:'2'}).remove();//删除
		var me=ntaffy({id:'2'}).first().name;//查询
		var me=ntaffy({id:'2'}).first().id;//查询
		alert(me);
		alert(tjson);
		//ntaffy.insert({id:'3',name:'jeek'});//插入
		alert(tjson);
       $jsontip.html(strHtml);
      //显示处理后的数据 
    }) 
  }) 
})

</script>
</html>
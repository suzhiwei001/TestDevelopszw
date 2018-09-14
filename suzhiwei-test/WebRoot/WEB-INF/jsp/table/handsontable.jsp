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
<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/handsontable/dist/handsontable.full.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/handsontable/dist/moment/moment.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/json/json2.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>/resources/handsontable/dist/handsontable.full.min.css">
<title>Insert title here</title>
</head>
<body>	<button onclick="asd()">加载数据</button>
		<div id="example"></div>
		<button name="save" id="save">保存</button>
		<P><span style="color: red;">注：当列存在下拉，选择等特殊属性的时候右键菜单不支持对列的操作</span></P>
</body>
<script type="text/javascript">

	var data = [
			[ 'Year', 'Maserati', 'Mazda', 'Mercedes', 'Mini', 'Mitsubishi' ],
			[ '2009', 0, 'BMW', 4303, 354, 5814 ],
			[ '2010', 3, 'Chrysler', 2867, 412, 5284 ],
			[ '2011', 4, 'Nissan', 4822, 552, 6127 ],
			[ '2010', 3, 'Nissan', 2867, 412, 5284 ],
			[ '2011', 4, 'Chrysler', 4822, 552, 6127 ],
			[ '2010', 3, 'Suzuki', 2867, 412, 5284 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2010', 3, 'Volvo', 2867, 412, 5284 ],
			[ '2011', 4, 'Volvo', 4822, 552, 6127 ],
			[ '2012', 2, 'Suzuki', 5399, 776, 4151 ] ];
	var datas = [
			[ 'Year1', 'Maserati', 'Mazda', 'Mercedes', 'Mini', 'Mitsubishi' ],
			[ '2009', 0, 'BMW1', 4303, 354, 58141111],
			[ '2010', 3, 'Chrysler', 2867111, 412, 5284 ],
			[ '2011', 4, 'Nissan', 4822, 552, 6127 ],
			[ '2010', 3, 'Nissan', 2867, 412, 5284 ],
			[ '2011', 4, 'Chrysler', 4822, 552, 6127 ],
			[ '2010', 3, 'Suzuki', 2867, 412, 5284 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2010', 3, 'Volvo', 2867, 412, 5284 ],
			[ '2011', 4, 'Toyota', 4822, 552, 6127 ],
			[ '2011', 4, 'Volvo', 4822, 552, 6127 ],
			[ '2012', 2, 'Suzuki', 5399, 776, 4151 ] ];
	var container = document.getElementById("example");
	var hot = new Handsontable(container, {
		data : data,
		colHeaders : [,"dasfca"],
		manualRowResize : true,
		manualColumnResize : true,
		manualColumnMove : true,
		manualRowMove : true,
		columnSorting : true,
		rowHeaders : true,
		contextMenu : true,
		autoColumnSize : true,
		mergeCells : true,
		columns : [
				{		
					editor : 'select',
					selectOptions : [ 'Year', '2007', '2008', '2009', '2010',
							'2012', '2013', '2014' ]
				},
				{
					type : 'dropdown',
					source : [ 'Maserati', '0', '1', '2', '3', '4', '5', '6',
							'7' ]
				},
				{
					type : 'autocomplete',
					source : [ 'Mazda', 'BMW', 'Chrysler', 'Nissan', 'Suzuki',
							'Toyota', 'Volvo' ],
					strict : true
				}, {}, {}, {} ]
	});

	$(function() {
		$("#save").click(function() {
			var data = hot.getData();
			var s = hot.getColHeader();
			data = JSON.stringify(data)
			alert("表头:" + s + "\b\r内容：" + data);
		})
	})
	function asd(){
		
		hot.loadData(datas);
	}
</script>
</html>
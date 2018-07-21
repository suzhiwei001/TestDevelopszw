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
<div id="aa" onclick="ssss()">第一个div</div>
<div id="bb" style="display: none;">第二个div</div>
<div class="easyui-layout" data-options="fit:true">	
	<div data-options="region:'center'">
		<!-- 嵌套布局 -->
		<div class="easyui-layout" data-options="fit:true">			
			<div
				data-options="region:'east',iconCls:'icon-reload',title:'East',split:true"
				style="width: 50%;"></div>
			<!--north，south， east，west这几个面板都可以删掉，唯有这个center面板一定不能删掉，否则使用easyui-layout就会出错 -->
			<div data-options="region:'center'"
				style="padding: 0px;">
				<!-- 嵌套布局 -->
				<div class="easyui-layout" data-options="fit:true">
					<div data-options="region:'north',title:'上'"
						style="height: 50%;"></div>
					<!-- 布局中如果不需要south这个面板，那么可以删掉这个div -->
					<div data-options="region:'south',title:'下'"
						style="height: 50%;"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 左侧树话框-->
<jsp:include page="szw-tree.jsp" />
</body>	
</html>
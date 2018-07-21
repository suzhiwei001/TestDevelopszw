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
<body style="margin:0; padding:0">
<iframe src="http://127.0.0.1:8086/suzhiwei-test/test?path=element" style="width:100%; height: 600px;" frameborder="1" scrolling="auto"></iframe>
</body>
</html>
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
<script src="<%=basePath%>/resources/json/json2.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap/dist/css/bootstrap.min.css" type="text/css" />

<title>test2</title>
<script type="text/javascript">
/* 	var a = 0;
	var timer ; */
	<!-- async默认是true,代表异步请求flase时代表同步 -->
	
	function ss(){
		$.ajax({
			async : false,//默认是true为异步，false是同步
			//cache:false,//回显内容是使用ajax的get方式的请求查询数据，ajax的cache默认值为true：使用缓存，这个时候读取的数据是缓存中的数据而不是最新的数据。
	        type : 'POST',  
	        url : '<%=basePath%>/testTestview',
	        contentType : "application/json;charset=utf-8",
	        data : JSON.stringify({fq:'富强',mz:'民主',wm:'文明',hx:'和谐'}),
	        dataType: "json",	        
	        success : function(res) {
	    
	        }
		});	
	}
	function ss2(){
		$.ajax({
			async : false,//默认是true为异步，false是同步
			//cache:false,//回显内容是使用ajax的get方式的请求查询数据，ajax的cache默认值为true：使用缓存，这个时候读取的数据是缓存中的数据而不是最新的数据。
	        type : 'POST',  
	        url : '<%=basePath%>/testTestview',
	        data : {fq:'富强',mz:'民主',wm:'文明',hx:'和谐'},
	        dataType: "jsonp",	        
	        success : function(res) {	    
	        }
		});	
	}

	</script>
</head>
<body>

<button onclick="ss();">111111</button>
<button onclick="ss2();">222222</button>
<div><iframe src='<%=basePath%>/SelectTest/SelectTest'></iframe></div>

</body>
</html>
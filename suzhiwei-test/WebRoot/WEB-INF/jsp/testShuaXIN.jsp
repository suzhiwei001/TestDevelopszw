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
<%@ include file="loadingSu.jsp" %>

<title>test2</title>
 </head>
<body>
<button onclick="ss();">带数据测试</button>
</body>
<script type="text/javascript">
	
	function ss(){
		showBacklayer()
		$.ajax({
			async:true,//默认是true为异步，false是同步
	        success : function() {
	        	var time = dd();
	        	console.log(time)
	        }
		});	
	}
function dd(){
	<!--模拟数据-->
	var startTime = new Date().getTime();
	for (var i = 0; i <= 100000000; i++) {
	if( i >100000){
		
	}
	};
	var endTime = new Date().getTime();
	close_fn();
	return (endTime-startTime)+"ms";
}
</script>
</html>
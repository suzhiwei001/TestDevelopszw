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
<script src="<%=basePath%>/resources/json/json2.js" type="text/javascript"></script>
<title>student</title>
</head>
<body>
<iframe id="student" src="http://127.0.0.1:8086/suzhiwei-test/test?path=studentInfo"  ></iframe> 

</body>
<script type="text/javascript">
function dddd(){
	alert(222222);
}
var data = {'ggggg':'ggggggggg'};
//window.frames.testAss();
console.info(window.frames['student']);
console.info(window.frames.child.sss);
console.info(document.frames);
console.info(window.document.getElementById('student').contentWindow);
</script>
</html>
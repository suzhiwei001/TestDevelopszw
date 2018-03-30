<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js" type="text/javascript"></script>
<title>szw-tree</title>
<script type="text/javascript">

function ssss() {
	var bb = document.getElementById("bb");
	alert(bb);
	if(bb.style.display=="none"){
		bb.style.display="block"
	}else{
		bb.style.display="none"
	}
}

</script>
</head>
<body>
<div id="aa" onclick="ssss()">wwww</div>
<div id="bb" style="display: none;">ffff</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js" type="text/javascript"></script>	
<title>select</title>
</head>
<script type="text/javascript">
/* function jsSelectIsExitItem(){
	alert("s");
} */

function jsSelectIsExitItem(objItemValue) {
	var aa = new Array();
	//被选中的值
	var sel = $("select").val();
	alert(sel);
	
	//定义变量，用于存放select的所用值
	var all = "";
	
	//通过元素选择器，即标签选择器获取，遍历得到每一个option的值
	$("select option").each(function() { 
		//可以添加到变量
		all += $(this).attr("value")+"|";
		});	
	alert(all);	    
   }

</script>
<body>
		<select name="SelectDept">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3"></option>
		<option value="4"></option>
		<option value="${pageContext.request.contextPath}/BussElement/findByBussElement"></option>
		</select>
		<button  onclick="jsSelectIsExitItem()">点击</button>
</body>
<a href="/testTest">点击测试</a>
</html>
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
<!-- <meta http-equiv="refresh" content ="0;url=/BussElement/findByBussElement"> -->
<title>index</title>
</head>
<body>
	<table>
		<tr>
			<td>jsp页面代码格式化</td>
		</tr>
		<tr>
			<td>方式1：crtl+i</td>
		</tr>
		<tr>
			<td>方式2：右键-》source-》Format Active Elements</td>
		</tr>
	</table>
	<%-- <jsp:include page="index2.jsp"/> --%>
	<a href="<%=basePath%>/BussElement/findByBussElement">要素</a>
	<a href="<%=basePath%>/test?path=zhengze">zhengze</a>
	<a href="<%=basePath%>/SelectTest/test">ddd</a>
	<a href="<%=basePath%>/test?path=tableTest">表格</a>
	<a href="<%=basePath%>/test?path=excelImprlt">表格导入</a>
	<a href="<%=basePath%>/test?path=element">完善后的表格</a>
	<a href="<%=basePath%>/test?path=excelImprlt">excelImprlt.jsp</a>
	<a href="<%=basePath%>/test?path=NewFile1">NewFile1.jsp</a>
	<a href="<%=basePath%>/test?path=NewFile2">NewFile2.jsp</a></br>
	
	<a href="<%=basePath%>/test?path=PrintArea/test22">打印</a>
	<a href="<%=basePath%>/test?path=editdd">编辑器</a>
	<a href="<%=basePath%>/test?path=edit">编辑器焦点</a>
	<a href="<%=basePath%>/test?path=index">====首页====</a>
	<a href="<%=basePath%>/test?path=dataGritTest">dataGritTest</a>
	<a href="<%=basePath%>/test?path=student">页面传参数</a>
	<a href="<%=basePath%>/test?path=testShuaXIN">测试等待刷新</a>
	<a href="<%=basePath%>/test?path=table/handsontable">handsontable</a>
	<a href="<%=basePath%>/test?path=ztreeTable">ztreeTable</a>
	<iframe id="iframepage" src="<%=basePath%>/test?path=NewFile1"></iframe>
</body> 
<script type="text/javascript" language="javascript">  
</script> 
</html>
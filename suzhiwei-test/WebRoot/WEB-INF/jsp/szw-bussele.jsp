<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>szw-buele</title>
</head>
<body>
		<table style="text-align: center;" border="1" cellpadding="0"
			cellspacing="0" bordercolor="blue" width="30%">
			<tr>
				<td>名称</td>
			</tr>
				<tr>
					<td>${name}</td>
				</tr>
		</table>

		<a href="/suzhiwei-test/quartz/log">点击查看日志</a>
		<a href="/suzhiwei-test/SelectTest/SelectTest">点击select测试</a>
		<jsp:include page="SelectTest/SelectTest"/>
		
</body>
</html>
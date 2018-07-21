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
	function ss(){
		alert(111)
		
		var str = "aaabbbcccdddeeefff";
		str = str.match(/aaa(\S*)fff/)[1];
		alert(str);//结果bbbcccdddeee	
	}
	function ss2(){
		var str="123[你的]456[我的]789";

		var r = /^.+?\[(.+?)\].+?\[(.+?)\].*$/;

		var m = r.exec(str);

		if(m) {

		alert(m[1]);  //你的

		alert(m[2]);    //我的
		}

		else {

		alert("不匹配");

		}
	}
	function ss3(){
		var str="123[你的]456[我的]789123[你的1]456[我的1]7'wer'89";

		var r = /\[(.+?)\]/g;
		alert(str.match(r));
	}
	
	function ss4(){
 	var str = "dsNULLreretds{success:5 fail:5}NULLa'aa'aaaaaassssssss";
		var regex = /['](.*)[']/;
		alert(str.match(regex));
		console.info(str.match(regex)[1])

	}
	function ss5(){
		var ele="[要素]>='要素取值1'And[要素]>='要素取值1'Or([要素]>='要素取值1')"
			var ss=ele.split("And");
		console.info("切取后的结果--"+ss)
		var num =ele.indexOf("And");
		console.info("包含验证---："+num)
		var str ="[要素]>='要素取值1'"
			var s1 = /\[(.*?)\]/
			var s2 = /['](.*?)[']/
			var s3 = /\](.*?)[']/
			console.info(str.match(s1)[1])
			console.info(str.match(s2)[1])
			console.info(str.match(s3)[1])
			alert("要素---"+str.match(s1)[1])
			alert("要素取值---"+str.match(s2)[1])
			alert("要素与取值的条件---"+str.match(s3)[1])
			}
	</script>
</head>
<body>
111
 <button onclick="ss();">ss</button>
<button onclick="ss2();">ss2</button>
<button onclick="ss3();">ss3</button>
<button onclick="ss4();">ss4</button>
<button onclick="ss5();">ss5</button>

</body>
</html>
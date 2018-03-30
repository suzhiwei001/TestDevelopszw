
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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js" type="text/javascript"></script>	
</head>
	<style type="text/css">
	
	</style>
	<script type="text/javascript">
	var a = 0;
	var timer ;
	<!-- async默认是true,代表异步请求flase时代表同步 -->
	$(function(){
		$.ajax({
			async : true,
			cache:false,
	        type : 'GET',  
	        url : '<%=basePath%>/quartz/readLog',
	        success : function(res) {
	        	    var string = res;
	        	    try{ 
        	    		$("#log").html('');//每次加载清空当前数据
	        	    	for(var i = 0;i<res.length;i++){//循环加载数据
	        	    	  var n = res[i];
        	    		  var m = $("<p>"+n+"</p>")
		        	       $("#log").append(m);
	        	    	}
	        	    	 $('#log').scrollTop( $('#log')[0].scrollHeight);//滚动条始终在下方

	        	    }catch(e) {
	        	        alert(e.message);    
	        	    }      
	        }
		});	
	})
	

	function start(){
		timer = setInterval(function dianji(){
			$.ajax({
				async : true,
				cache:false,
		        type : 'GET',
		        dataType:'json',
		        url : '<%=basePath%>/quartz/readLog',
		        success : function(res) {
		        	    var string = res;    
		        	    try{    
		        	    	$("#log").html('');
		        	    	for(var i = 0;i<res.length;i++){
		        	    	  var n = res[i];
	        	    		  var m = $("<p>"+n+"</p>")
	        	    		  
			        	      $("#log").append(m);
	        	    		  	
		        	    	}
		        	    	 $('#log').scrollTop( $('#log')[0].scrollHeight);
		        	    }catch(e) { 
		        	        alert(e.message);    
		        	    }      
		        }
			});
		}, 5000);
		
		$("#start>a").html("运行中");
	}
	
	function stop(){
		timer=window.clearInterval(timer);
		$("#start>a").html("开始");
	}
	</script>
</head>
<body >
	<div id = "log" style = "height:90%;width:100%;overflow: auto;"></div>
	<div style = "text-align: center;padding:10px">
	
		<button id = "start"   onclick="start()"> <a href = "javascript:void(0)" style = "text-decoration:none">开始</a></button>
		<button id = "stop"  onclick="stop()"><a href = "javascript:void(0)" style = "text-decoration:none">停止</a></button>
	</div>
</body>
</html>








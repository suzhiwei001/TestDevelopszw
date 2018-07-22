<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"  pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type = "text/javascript">
/**
  * 关闭
  * */
//var i = 1;
function close_fn(){
 $(".fullbg").css("display","none");
 $(".upPageDiv").css({"display":"none"});
 //i = null;
 //ssss()
}
//打开
function showBacklayer(){
  $(".fullbg").css("display","block");
  $(".upPageDiv").css("display","block");
  //ssss();
}
//用于测试时间的
/* function ssss(){
	if(i == null){
		return;
	}
	 if(i%2!=1){
		console.info("隐藏")
	 	$("#sss").css("display","none");
	 }else{
		$("#sss").css("display","block");
		console.info("显示")
	 }
	 i++;
	 setTimeout("ssss()",3000);
} */
</script>
	
<style>
  /* 遮罩层样式 */
 .fullbg{
 background-color: #C0C0C0;
 display:none; 
 z-index:3;
 position:absolute;
 left:0px;
 top:0px;
 height:100%;
 width: 100%;
 filter:Alpha(Opacity=30);
 /* IE */
 -moz-opacity:0.4;
 /* Moz + FF */
 opacity: 0.4;
 }
 .upPageDiv{position: absolute;z-index:4;left:43%;top:35%;display:none;}
 </style>
 </head>
<body>
<button onclick="showBacklayer()">没有数据测试，开始</button>
<div class="fullbg" id="fullbg"></div>
<div class="upPageDiv" id="upPageDiv" style="position: absolute;">
    <p>正在加载，请稍后... ...<img alt="" src="resources/jquery-easyui-1.4.1/themes/gray/images/loading.gif"></p>
<!--     <span style="left:100%;top:0px;position: absolute;" onclick="close_fn();" >
        <img src="resources/error.png" alt="close" />
    </span> -->
    <button onclick="close_fn();">没有数据测试，停止</button>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"  pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type = "text/javascript">
/**
  * 关闭
  * */
function close_fn(){
 $(".fullbg").css("display","none");
 $(".upPageDiv").css({"display":"none"});
}
//打开
function showBacklayer(){
  $(".fullbg").css("display","block");
  $(".upPageDiv").css("display","block");
}
</script>
	
<style>
  /* 遮罩层样式 */
 .fullbg{
 background-color: #696969;
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
 position: absolute;
 }
 .upPageDiv{position: absolute;z-index:4;background-color: #C0C0C0; left:43%;top:35%;height: 270px;width:500px;display:none;}
 </style>
 </head>
<body>
<button onclick="showBacklayer()">开始</button>
<div class="fullbg" id="fullbg"></div>
<div class="upPageDiv" id="upPageDiv" style="position: absolute;">
    <b>正在加载，请稍后... ...</b>
    <span style="left:35%;top:0px;position: absolute;" onclick="close_fn();" >
        <img src="resources/error.png" alt="close" />
    </span>
</div>
</body>
</html>
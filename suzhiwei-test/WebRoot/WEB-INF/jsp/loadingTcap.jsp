<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"  pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type = "text/javascript">
//打开
function showBacklayer(){
  $(".fullbg").css("display","block");
  $(".upPageDiv").css("display","block");
}
//关闭
function close_fn(){
 $(".fullbg").css("display","none");
 $(".upPageDiv").css({"display":"none"});
}
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
<div class="fullbg" id="fullbg"></div>
<div class="upPageDiv" id="upPageDiv" style="position: absolute;">
    <p>正在加载，请稍后... ...
    <img alt="" src="resources/jquery-easyui-1.4.1/themes/gray/images/loading.gif">
    </p>
</div>
</body>
</html>
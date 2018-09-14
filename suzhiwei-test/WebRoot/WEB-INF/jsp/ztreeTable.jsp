<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="https://cdn.bootcss.com/zTree.v3/3.5.29/css/zTreeStyle/zTreeStyle.min.css" rel="external nofollow" rel="stylesheet">
 <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://cdn.bootcss.com/zTree.v3/3.5.29/js/jquery.ztree.all.min.js"></script>
<title>ztreeTable</title>
<style>
 body {
  overflow: auto;
 }
 .ztree *{
  font-family: "微软雅黑","宋体",Arial, "Times New Roman", Times, serif;
 }
 .ztree {
  padding: 0;
  border-left: 1px solid #E3E3E3;
  border-right: 1px solid #E3E3E3;
  border-bottom: 1px solid #E3E3E3;
 }
 .ztree li a {
  vertical-align: middle;
  height: 32px;
  padding: 0px;
 }
 .ztree li > a {
  width: 100%;
 }
 .ztree li a.curSelectedNode {
  padding-top: 0px;
  background-color: #FFE6B0;
  border: 1px #FFB951 solid;
  opacity: 1;
  height: 32px;
 }
 .ztree li ul {
  padding-left: 0px
 }
 .ztree div.divTd span {
  line-height: 30px;
  vertical-align: middle;
 }
 .ztree div.divTd {
  height: 100%;
  line-height: 30px;
  border-top: 1px solid #E3E3E3;
  border-left: 1px solid #E3E3E3;
  text-align: center;
  display: inline-block;
  color: #6c6c6c;
  overflow: hidden;
 }
 .ztree div.divTd:first-child {
  text-align: left;
  text-indent: 10px;
  border-left: none;
 }
 .ztree .head {
  background: #E8EFF5;
 }
 .ztree .head div.divTd {
  color: #393939;
  font-weight: bold;
 }
 .ztree .ck{
  padding: 0 5px;
  margin: 2px 3px 7px 3px;
 }
 li:nth-child(odd){
  background-color:#F5FAFA;
 }
 li:nth-child(even){
  background-color:#FFFFFF;
 }
</style>
</head>
 <body>
  <div class="layer">
   <div id="tableMain">
    <ul id="dataTree" class="ztree">
    </ul>
   </div>
  </div>
 </body>
 <script type="text/javascript">
var newOpen =null;
$(function () {
 //初始化数据
 var data = [{"id":"20170525091439001010","name":"企业注册","pId":null,"status":"1","typecode":"02"},{"id":"20170724174119005610","name":"部门沟通演练","pId":"20170525091439001010","status":"1","typecode":"2"},{"id":"20170725085455000110","name":"测试12","pId":null,"status":"1","typecode":"11"},{"id":"20170731171011000410","name":"审批流程","pId":null,"status":"1","typecode":"222"},{"id":"20170803133941018010","name":"单位登记","pId":null,"status":"1","typecode":"188"},{"id":"20170804085419000110","name":"模拟","pId":null,"status":"1","typecode":"122"},{"id":"20170809090321000110","name":"审批模拟（新）测试测试测试测试测试","pId":"20170525091439001010","status":"1","typecode":"110"},{"id":"20170809105407009210","name":"测测测测测测测测测测测测测测测测测测","pId":"20170809090321000110","status":"1","typecode":"123"},{"id":"20170814183837000210","name":"企业登记","pId":null,"status":"1","typecode":"111"},{"id":"20170822183437000710","name":"单事项-部门沟通","pId":"20170814183837000210","status":"1","typecode":"822"},{"id":"20170922112245000510","name":"23","pId":null,"status":"1","typecode":"03"},{"id":"20170922143810000010","name":"sdfa","pId":null,"status":"1","typecode":"04"},{"id":"20170922145203000110","name":"64526","pId":null,"status":"1","typecode":"34262"},{"id":"20170922155403001610","name":"333","pId":null,"status":"1","typecode":"33354"},{"id":"20170922171750000210","name":"4441234","pId":null,"status":"1","typecode":"44444"},{"id":"20170925160636007410","name":"测试数据","pId":"20170731171011000410","status":"1","typecode":"231"},{"id":"20170925163306007510","name":"23462111","pId":null,"status":"1","typecode":"2345"},{"id":"20170925163959007610","name":"242345","pId":"20170922112245000510","status":"1","typecode":"3625346"}];
 queryHandler(data);
});
var setting = {
 view: {
  showLine: false,
  addDiyDom: addDiyDom,
 },
 data: {
  simpleData: {
   enable: true
  }
 }
};
/**
 * 自定义DOM节点
 */
function addDiyDom(treeId, treeNode) {
 var spaceWidth = 15;
 var liObj = $("#" + treeNode.tId);
 var aObj = $("#" + treeNode.tId + "_a");
 var switchObj = $("#" + treeNode.tId + "_switch");
 var icoObj = $("#" + treeNode.tId + "_ico");
 var spanObj = $("#" + treeNode.tId + "_span");
 aObj.attr('title', '');
 aObj.append('<div class="divTd swich fnt" style="width:10%"></div>');
 var div = $(liObj).find('div').eq(0);
 //从默认的位置移除
 switchObj.remove();
 spanObj.remove();
 icoObj.remove();
 //在指定的div中添加
 div.append(switchObj);
 div.append(spanObj);
 //隐藏了层次的span
 var spaceStr = "<span style='height:1px;display: inline-block;width:" + (spaceWidth * treeNode.level) + "px'></span>";
 switchObj.before(spaceStr);
 //图标垂直居中
 icoObj.css("margin-top","9px");
 switchObj.after(icoObj);
 var editStr = '';
 //宽度需要和表头保持一致
 editStr += '<div class="divTd" style="width:10%">' + (treeNode.typecode == null ? '' : treeNode.typecode ) + '</div>';
 editStr += '<div class="divTd" style="width:10%">' + (treeNode.status == '1' ? '有效' : '无效' ) + '</div>';
 editStr += '<div class="divTd" style="width:10%">' + opt(treeNode) + '</div>';
 aObj.append(editStr);
}
//初始化列表
function queryHandler(zTreeNodes){
 //初始化树
 $.fn.zTree.init($("#dataTree"), setting, zTreeNodes);
 //添加表头
 var li_head = ' <li class="head"><a><div class="divTd" style="width:10%">类型名称</div><div class="divTd" style="width:10%">类型编码</div>' +
  '<div class="divTd" style="width:10%">是否有效</div><div class="divTd" style="width:10%">操作</div></a></li>';
 var rows = $("#dataTree").find('li');
 if (rows.length > 0) {
  rows.eq(0).before(li_head)
 } else {
  $("#dataTree").append(li_head);
  $("#dataTree").append('<li ><div style="text-align: center;line-height: 30px;" >无符合条件数据</div></li>')
 }
}
function opt(treeNode) {
 var htmlStr = '';
 htmlStr += '<input type="button" class="ck" onclick="doEdit(\'' + treeNode.tId + '\',\'' + treeNode.id + '\')" value="编辑"/>';
 htmlStr += '<input type="button" class="ck" onclick="doDelete(\'' + treeNode.tId + '\',\'' + treeNode.id + '\', \'' + treeNode.name + '\')" value="删除"/>';
 return htmlStr;
}
</script>
</html>

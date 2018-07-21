<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tableTest</title>
<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/resources/jquery-easyui-1.4.1/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/resources/jquery-easyui-1.4.1/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/resources/jquery-easyui-1.4.1/demo/demo.css">
<script type="text/javascript"
	src="<%=basePath%>/resources/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/resources/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script src="<%=basePath%>/resources/json/taffy.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/resources/json/json2.js"
	type="text/javascript"></script>
</head>
<body>
<table id="dg" title="学生作业" class="easyui-datagrid"  
    style="width: 100%; height: 90%">  
      
  
</table> 
</body>
<script type="text/javascript">

$('#dg').datagrid({      
    url:'${pageContext.request.contextPath}/queryStudentAnswer',   
    queryParams:{"schoolcalendarId":termId},  
    onClickCell: onClickCell,  
    onAfterEdit:onAfterEdit,  
    rownumbers:true,  
    pagination:'true',  
    fitColumns:'true',  
    singleSelect:'true',  
    columns:[[      
       /*  {field:'ck',checkbox:true},    */   
        {field:'id',hidden:true},      
        {field:'studentId',hidden:true},      
        {field:'resultId',hidden:true},      
        {field:'daliyResultRate',hidden:true},      
        {field:'daliyResult',hidden:true},      
        {field:'code',width:30,align:'center',title:'学号'},    
        {field:'name',width:30,align:'center',title:'姓名'},     
        {field:'teachClassName',width:30,align:'center',title:'班级'}  ,   
        {field:'questionTime',width:40,align:'center',title:'留作业时间'},     
        {field:'questionName',width:50,align:'center',title:'作业名称'},     
        {field:'answerName',width:50,align:'center',title:'答案名称'},     
        {field:'preview',width:30,align:'center',title:'预览',formatter: function (value, row, index) { return preview(value, row, index)}} ,    
        {field:'finalRate',width:30,align:'center',title:'期末成绩比例'} ,    
        {field:'finalResult',editor:'text',width:30,align:'center',title:'期末成绩'} ,    
        {field:'totalResult',width:30,align:'center',title:'总分'}   
    ]]      
});  

var editIndex = undefined;  
function endEditing() {//该方法用于关闭上一个焦点的editing状态  
    if (editIndex == undefined) {  
        return true  
    }  
    if ($('#dg').datagrid('validateRow', editIndex)) {  
        $('#dg').datagrid('endEdit', editIndex);  
        editIndex = undefined;  
        return true;  
    } else {  
        return false;  
    }  
}  
//点击单元格事件：  
function onClickCell(index,field,value) {  
    if (endEditing()) {  
        if(field=="finalResult"){  
            $(this).datagrid('beginEdit', index);  
            var ed = $(this).datagrid('getEditor', {index:index,field:field});  
            $(ed.target).focus();  
        }         
        editIndex = index;  
    }  
    $('#dg').datagrid('onClickRow')  
}  
//单元格失去焦点执行的方法  
function onAfterEdit(index, row, changes) {  
    var updated = $('#dg').datagrid('getChanges', 'updated');  
    if (updated.length < 1) {  
        editRow = undefined;  
        $('#dg').datagrid('unselectAll');  
        return;  
    } else {  
        // 传值  
        submitForm(index, row, changes);  
    }  
  
      
}  
  
//提交数据  
function submitForm(index, row, changes) {  
//  alert( row.resultId+"--"+changes.finalResult)daliyResultRate;  
    var resultId=row.resultId;//成绩id  
    if(resultId==""){  
        $.messager.alert('提醒', '没有录入该学生平时成绩！');  
        $("#dg").datagrid('reload');  
        return;  
    }  
    var daliyResultRate=row.daliyResultRate;//平时成绩比例  
    var daliyResult=row.daliyResult;//平时成绩  
    var finalRate=row.finalRate;//期末比例  
    var finalRusult=changes.finalResult;//期末成绩  
    var r =/^-?[1-9]/;//判断输入的是正整数  
    if(!r.test(finalRusult)){  
        $.messager.alert('提醒', '请输入正整数！');  
        return;  
    }  
    var totalRusult=Math.round(daliyResultRate*daliyResult+finalRate*finalRusult);//总成绩  
    $.ajax({  
            type : "get",  
            async : false,  
            url : "${pageContext.request.contextPath}/updateResult",  
            data : {  
                "resultId" : resultId,  
                "finalResult" : finalRusult,  
                "totalResult":totalRusult  
            },  
            success : function(data) {  
                if(data==true){  
                    //alert("保存成功");  
                    $("#dg").datagrid('reload');  
                }  
            }  
        })  
} 


</script>
</html>
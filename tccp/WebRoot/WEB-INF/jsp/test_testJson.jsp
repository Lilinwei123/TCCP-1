<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test_testJson.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">  
  $(function () {
    $("#btnget").click(function () {
        $.ajax({
            type: "get",
            dataType: "json",
            url: "<%=basePath%>user/getAllUserTest",
            success: function (msg) {
                var str = "";
                for (i in msg) {
                    str += "<tr><td>" + msg[i].id + "</td><td>" + msg[i].name + "</td><td>" + msg[i].cla + "</td><td>" + msg[i].sex + "</td><td>" + msg[i].tel + "</td></tr>";
                }
                $("tbody").append(str);
            }
        });
    });
});
</script> 
<style type="text/css">
    table {
        border-collapse: collapse;
    }
    table td {
        text-align: center;
        border: 1px solid gray;
        padding: 3px 10px;
    }
</style>
  </head>
  
  <body>
<table>
    <thead>
        <tr>
            <td>学号</td>
            <td>姓名</td>
            <td>班别</td>
            <td>性别</td>
            <td>电话</td>
        </tr>
    </thead>
    <tbody></tbody>
	</table>
	<input id="btnget" type="button" value="加载数据" /> 
  </body>
</html>

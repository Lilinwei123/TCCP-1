<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试首页</title>
    <style type="text/css">
    .set{
    	color:red;
    }
    </style>
	
  </head>
  
  <body style="text-align:center">
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<h1>空链接页面</h1>
  	
  	<hr>
  	<a href="<%=basePath%>user/toUserLogin"><span class="set">请点击：tccp首页（默认登录页面，如果已登录，则返回登录后页面，保持十五分钟！）</span></a>   	
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<hr>
   		<a href="<%=basePath%>user/getAllUser">tccp框架测试页</a>
   		<a href="<%=basePath%>action/selectAllMoods">测试JSON传输</a>
 		<a href="<%=basePath%>user/getAllUsers">所有用户Json</a>
  	
  </body>
</html>

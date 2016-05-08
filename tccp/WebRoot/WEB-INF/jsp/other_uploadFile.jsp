<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<title>上传文件</title>
</head>
<body>
第三种解析上传文件的方法<hr/>

	<form action="<%=basePath%>other/parserUploadFile" method="post"  enctype="multipart/form-data">
		<input type="file" name="file" /> 
		<input type="submit" value="上传" />
	</form>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>ThoughtCoding实验室登录</title>
	<link rel="stylesheet" type="text/css" href="css/login.css"/>
  </head>
  
  <body class="login_page_background">
		<div id="login_frame">
			<div class="TC"><span class="span">XUPT ThoughtCoding</span></div>
			<div class="login_form">
				<div class="logo_img" align="center">
					<img src="images/cow6.1.jpg" class="logo"/>
				</div>
				<form name="loginform" action="<%=basePath%>user/userLogin" method="post" >
					<div class="user_name" align="center">
						<input class="name_text" type="text" name="username" placeholder="用户名"/>
					</div>
					<div class="password" align="center">
						<input class="password_text" type="password" name="password" placeholder="密码"/>
					</div>
					<div class="login green">
						<button class='login_button' type="submit">
							登录
						</button>
					</div>
				</form>
			</div>
		</div>
	</body>
  
</html>

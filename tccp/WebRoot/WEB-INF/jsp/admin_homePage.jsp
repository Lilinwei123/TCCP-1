<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">



<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>TCCP管理员页面</title>
<link rel="stylesheet" type="text/css" href="css/administrator.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.5-dist/css/bootstrap.css">
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/administrator.js"></script>
</head>

<body>
	<div class="container">
		<nav class="col-md-12">
		<div id="logo">
			<img src="images/cowwomen.png">
			<h1>TCCP管理员</h1>
			<h3>
				<a href="<%=basePath%>user/toUserLogin" style="color:white">主页</a>
			</h3>
		</div>
		</nav>

		<aside class="col-md-2 col-sm-3 col-xs-4">
		<ul>
			<h3>Main</h3>
			<li id="userlist"><a href="<%=basePath%>user/toAdminHomepage">用户列表</a>
			</li>
			<li id="adduser"><a href="<%=basePath%>admin/toAddUser">添加用户</a>
			</li>
			<li id="deluser"><a href="<%=basePath%>admin/toDelUser">删除用户</a>
			</li>
			<li id="moveuser"><a href="<%=basePath%>admin/toAddUser">权限移交</a>
			</li>
		</ul>
		</aside>

		<section class="col-md-10 col-sm-9 col-xs-8">
		<div class="top-nav">
			<h3>用户列表</h3>

		</div>
		<div class="user-list"></div>
		<div id="table-list">
			<table id="table">

				<tr id="tr">
					<td>序号</td>
					<td>姓名</td>
					<td>性别</td>
					<td>联系电话</td>
					<td>年级</td>
					<td>组别</td>
				</tr>

			</table>
		</div>
		</section>
	</div>
	`
	<script type="text/javascript">
	$(document).ready(function(){
		$("#adduser").click(function(){
			event.preventDefault();
			$("section").empty();
			$("section").load("<%=basePath%>admin/toAddUser");
		});
		$("#deluser").click(function(){
			event.preventDefault();
			$("section").empty();
			$("section").load("<%=basePath%>admin/toDelUser");
		});
		$("#moveuser").click(function(){
			event.preventDefault();
			$("section").empty();
			$("section").load("<%=basePath%>admin/toMoveUser");
			});
		});
	</script>
</body>
</html>
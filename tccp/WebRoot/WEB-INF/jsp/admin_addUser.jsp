<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<link rel="stylesheet" type="text/css" href="css/admin_add.css">
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5-dist/css/bootstrap.css">
	<script type="text/javascript">
		//用户添加验证
		function checkAddUser(){  
    		if (document.getElementById("username").value == "" || doucument.getElementById("phonenum")){        
      		 	alert("有空值！请重填！");        
        		return false;    
       		 }
    		else{
        		return true;
        	}
		}					
	</script>
</head>

<body>
 <div class="container">
	<section class="col-md-10 col-sm-9 col-xs-8">
		<div class="top-nav">
			<h3>添加用户</h3>
			<form method="post" onsubmit="return checkAddUser();" action="<%=basePath%>admin/addUser">
				<ul>
					<li>
						姓名：<br>
						<input type="text" id="username" name="username" placeHolder="必填" style="height:26px;width:199px">
					</li>
					<li>分组：<br>
						<select name="groups" id="groups" style="height:26px;width:199px">
							<option>Web组</option><option>嵌入式组</option>
							<option>大数据组</option><option>Android组</option>
						</select>
					</li>
					<li>电话：<br>
						<input type="text" name="phonenum" id="phonenum" placeholder="必填" style="height:26px;width:199px">
					</li>
					<li>
						性别：<br>
						女:<input type="radio" name="sex" value="1" checked="checked">
						男<input type="radio" name="sex" value="0">
					</li>
				</ul>
				<div>
					<input type="submit" id="submit" name="submit" onclick="conf()" value="提交">
				</div>
			</form>
		</div>
	</section>
</div>
<script type="text/javascript">
	function conf(){
		confirm("确定添加？");
	}
	</script>
</body>
</html>
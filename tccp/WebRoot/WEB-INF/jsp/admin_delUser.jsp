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
	<link rel="stylesheet" type="text/css" href="css/admin_del.css">
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5-dist/css/bootstrap.css">
	<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		//用户删除验证
		function checkDelUser(){  
    		if (document.getElementById("delId").value == ""){        
      		 	alert("输入为空请重填！");        
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
				<h3>删除用户</h3>
					<form method="post" onsubmit="return checkDelUser();" action="<%=basePath%>admin/delUser">
					<ul>
						<li>
							<h4>用户ID：</h4>
							<input type="text" name="user_id" id="delId" placeHolder="必填" style="height:26px;width:199px">
						</li>
					</ul>
					<div>
						<input type="submit" id="userName" name="submit" value="删除用户" onclick="conf()">
					</div>
				</form>
			</div>
		</section>
	</div>

	<script type="text/javascript">
	function conf(){
		confirm("确定删除？")
	}
	</script>
</body>
</html>
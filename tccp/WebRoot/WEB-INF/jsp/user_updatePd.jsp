<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>ModifyPassword</title>
	<script type="text/javascript" src="js/modifypassword.js"></script>
</head>
<body>
    <h2 style="color:#2fa4e7">个人信息：</h2>
            <ul class='xform-ul'>
            <form method="post" action="<%=basePath%>user/updatePd">
                                <li>
                                    <div class='form-label'>密码 :${password}</div>
                                    <div class='form-input'>
                                        <input type='password' id="oldpassword" name="oldpassword" class="col-md-9 col-sm-10 col-xs-12"/><div style="display: inline" id="tip1"></div>
                                    </div>  <br>                              
                                </li>
                                <li>
                                    <div class='form-label'>新密码 :</div>
                                    <div class='form-input'>
                                        <input type='password' id="password1" name="password" placeholder="length must be 6-18" class="col-md-9 col-sm-10 col-xs-12"/><div style="display: inline" id="tip2">
                                    </div><br>        
                                </li>                            
                                <li>
                                    <div class='form-label'>再次确认 :</div>
                                    <div class='form-input'>
                                        <input type='password' id="password2" name="password2" placeholder="must match with the first" class="col-md-9 col-sm-10 col-xs-12"/><div style="display: inline" id="tip3">                                       
                                    </div><br>        
                                </li><br>
                                <li class="text-center">
                                    <div class="btn-submit"><div id="btn"><button id="modifypassword" type="submit" onclick="savemodifypassword()">修改密码</button></div></div>  
                                </li>
                                <li class="text-center">
                                    <div id="tip4"></div>
                                </li>
                                </form>
                            </ul>
              
            



</body>
</html>

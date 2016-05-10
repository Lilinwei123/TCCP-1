<%@page import="com.tccp.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>Personal Data</title>
<link rel="stylesheet" type="text/css" href="css/personal_data.css">
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5-dist/css/bootstrap.css">
<link href="http://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/upload_avatar.css" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/3.0.0-beta1/jquery.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.reveal.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/upload_avatar.js"></script>
<script type="text/javascript" src="js/personal_data.js"></script>
</head>
<body>
	<div class="container">
		<nav class="col-md-12">
		<div id="logo">
			<img src="images/cowwomen.png">
			<h1>TCCP个人中心</h1>
			<h3>
				<a href="<%=basePath%>user/toUserLogin" style="color:white">主页</a>
			</h3>
		</div>
		</nav>

		<aside class="col-md-3 col-sm-3 col-xs-4 personalData" id="aside">
		<h2 style="color:#2fa4e7">个人信息：</h2>
		<form method="post" action="<%=basePath%>user/updateUserInfo">
			<header> <a href="#" class="big-link"
				data-reveal-id="myModal"><img src="${userInfo.image}"
				alt="Picture loding failure!" height="100" width="100"
				style="border-radius: 50px"> </a>
			<p style="margin-left:37%">
				<img src="images/cowwomen.png" id="sex" height="25" width="25">${userInfo.username}
			</p>
			<script type="text/javascript">
				if("${userInfo.sex}" == 0){
					 document.getElementById("sex").setAttribute("src", "images/cowman.png");
				}else{
					 document.getElementById("sex").setAttribute("src", "images/cowwomen.png");
				}
			</script>
			<div id="myModal" class="reveal-modal">
				<div class="containertoo">
					<div class="imageBox">
						<div class="thumbBox"></div>
						<div class="spinner" style="display: none">Loading...</div>
					</div>
					<div class="action">
						<div class="new-contentarea tc">
							<a href="javascript:void(0)" class="upload-img"> <label
								for="upload-file">上传图像</label> </a> <input type="file" class=""
								name="upload-file" id="upload-file" />
						</div>
						<input type="button" id="btnCrop" class="Btnsty_peyton" value="确认">
						<input type="button" id="btnZoomIn" class="Btnsty_peyton"
							value="+"> <input type="button" id="btnZoomOut"
							class="Btnsty_peyton" value="-"> <a
							class="close-reveal-modal">×</a>
					</div>
					<div class="cropped"></div>
				</div>
			</div>
			</header>

			<ul>
				<li>级别及专业：<br> <input name="grade" id="grade" type="text"
					value="${userInfo.grade}" class="col-md-6 col-sm-6 col-xs-4">
					<select name="major" id="major" style="width:auto">
						<option value="" class="col-md-3  col-sm-3 col-xs-2"></option>
						<option>计科</option>
						<option>软件</option>
						<option>网工</option>
						<option>通工</option>
						<option>信息</option>
						<option>安全</option>
						<option>自动化</option>
						<option>信息对抗</option>
						<option>物联网</option>
						<option>集成电路</option>
						<option>微电子</option>
						<option>测控</option>
						<option>其他专业</option>
				</select> <!-- 动态设置Select的默认值 --> <script type="text/javascript">
    			 if("${userInfo.major}"=="安全"){ 
					document.getElementById("major").value="安全"; 
					}else if("${userInfo.major}"=="计科"){
					document.getElementById("major").value="计科"; 
					}else if("${userInfo.major}"=="软件"){
					document.getElementById("major").value="软件"; 
					}else if("${userInfo.major}"=="网工"){
					document.getElementById("major").value="网工"; 
					}else if("${userInfo.major}"=="通工"){
					document.getElementById("major").value="通工"; 
					}else if("${userInfo.major}"=="信息"){
					document.getElementById("major").value="信息"; 
					}else if("${userInfo.major}"=="自动化"){
					document.getElementById("major").value="自动化"; 
					}else if("${userInfo.major}"=="信息对抗"){
					document.getElementById("major").value="信息对抗"; 
					}else if("${userInfo.major}"=="物联网"){
					document.getElementById("major").value="物联网"; 
					}else if("${userInfo.major}"=="集成电路"){
					document.getElementById("major").value="集成电路"; 
					}else if("${userInfo.major}"=="微电子"){
					document.getElementById("major").value="微电子"; 
					}else if("${userInfo.major}"=="测控"){
					document.getElementById("major").value="测控"; 
					}else{
					document.getElementById("major").value="其他专业"; 
					}
  			  </script>
				</li>
				<li>分组：<br> <select name="groups" id="groups"
					class="col-md-8  col-sm-9 col-xs-10" style="height:26px">
						<option value=""></option>
						<option>Web组</option>
						<option>嵌入式组</option>
						<option>大数据组</option>
						<option>Android组</option>
				</select> <!-- 动态设置Select的默认值 --> <script type="text/javascript">
    			 if("${userInfo.groups}"=="Web组"){ 
					document.getElementById("groups").value="Web组"; 
					}else if("${userInfo.groups}"=="嵌入式组"){
					document.getElementById("groups").value="嵌入式组"; 
					}else if("${userInfo.groups}"=="大数据组"){
					document.getElementById("groups").value="大数据组"; 
					}else{
					document.getElementById("groups").value="Android组"; 
					}
  			  </script>
				</li>
				<br>
				<li>电话：<br> <input name="phonenum" id="phonenum"
					value="${userInfo.phonenum}" class="col-md-8  col-sm-9 col-xs-10"
					type="text" value="15802938410">
				</li>
				<br>
				<li>邮箱：<br> <input name="mail" id="mail"
					value="${userInfo.mail}" class="col-md-8  col-sm-9 col-xs-10"
					type="text" onclick="return chkForm()" autocomplete="off">
				</li>
				<br>
				<li>QQ：<br> <input name="qq" id="qq"
					value="${userInfo.qq}" class="col-md-8  col-sm-9 col-xs-10"
					type="text" onclick="checkEmail()">
				</li>
				<br>
				<li>工作地点：<br> <input name="workplace" id="workplace"
					value="${userInfo.workplace}" class="col-md-8  col-sm-9 col-xs-10"
					type="text">
				</li>
				<br>
				<li>职位：<br> <input name="job" id="job"
					value="${userInfo.job}" class="col-md-8  col-sm-9 col-xs-10"
					type="text">
				</li>
				<br>
				<li>博客地址：<br> <input name="blog" id="blog"
					value="${userInfo.blog}" class="col-md-8  col-sm-9 col-xs-10"
					type="text">
				</li>
				<br>
				<li><strong>github:</strong><br> <input name="github"
					type="text" value="${userInfo.github}"
					class="col-md-8  col-sm-9 col-xs-10" onclick="personalData.html">
				</li>
				<br>

				<li>人生格言：<br> <input type="text" name="motto" id="motto"
					value="${userInfo.motto }" class="col-md-8  col-sm-9 col-xs-10"
					rows="3" cols="33"> </textarea>
				</li>
				<br>
				<br>
				<li><br>
					<button id="submit" onclick="saveInform()">保存信息</button>
					<button id="modify">修改密码</button>
				</li>
			</ul>
		</form>
		</aside>

		<section class="col-md-9 col-sm-9 col-xs-8">
		<div class="middlecontent">
			<form method="post" action="">
				<fieldset class="row comment">
					<textarea class="col-xs-12 col-sm-8" placeholder="说点什么儿吧"
						style="height:82px" name="text-area"></textarea>
					<!-- 照片发表 -->
					<button type="button"
						class="btn btn-default camera col-xs-6 col-sm-2"
						aria-label="Center Align">
						<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
					</button>
					<!-- 发表 -->
					<div class="btn-group btn-group-lg col-xs-6 col-sm-2" role="group">
						<input type="submit" name="submit" value="发表"
							onclick="makecomment()" align="center" />
					</div>
				</fieldset>
				<!-- 上传图片的显示框 -->
				<div class="row">
					<div id="pic_trans">
						<div class="pic-show col-md-10 col-sm-10 col-xs-10">
							<img id="portrait" src="" alt="" />
						</div>
						<div class="del-picture col-md-2 col-sm-2 col-xs-2">
							<input type="button" id="conf-pic" name="conf-pic" value="上传" />
							<input type="submit" id="del-pic" name="del-pic" value="删除" />
						</div>
						<div class="none">
							<input type="file" name="_f" id="_f" onchange="showPreview(this)" />
						</div>
					</div>
				</div>
			</form>

			<div class="row">
				<div class="col-md-12 col-sm-12 update">
					全部动态 <a id="feed_friend_refresh" title="刷新动态" href="javascript:;"
						class="item-left"> <span class="glyphicon glyphicon-repeat"
						aria-hidden="true"></span> </a>
				</div>
				<!-- update -->
				<div class="col-md-12 col-sm-12 col-xs-12 friend-trends">
					<div class="trends">
						<img src="images/bg.png" alt="user icon" class="user-icon"><br>
						<p id="trends-name" style="margin-top:5px">
							<a href="#"></a>
						</p>
						<div id="now-time" style="margin-top:-5px"></div>
						<hr>
						<p style="margin-left:10%" id="act_mes"></p>
						<div class="pull-right">
							<i class="fa fa-comments btn-lg" style="padding-bottom:10px;"
								data-action="comment" data-toggle="modal" data-target="#myModal"></i>
							<i class="fa fa-thumbs-up btn-lg" style="padding-bottom:10px;"
								data-action="thumbs-up" id="count" onclick="count()"></i>
						</div>
						<br>
						<hr>
					</div>
					<!-- pull-right -->
					<!-- 评论部分 -->
					<div class="col-md-12 col-sm-12 col-xs-12 mod-content">
						<div id="user-icon">
							<img src="images/bg.png" alt="user icon">
						</div>
						<div id="comment-content">
							<a class="q_namecard" link="nameCard_470147204" target="_blank"
								href="#" id="comment-name"></a>&nbsp;:&nbsp; <span id="content"></span>
							<div id="sub_time">Time</div>
						</div>
						<!-- comment-content -->
					</div>
					<!--点击评论栏,先隐藏  -->
					<!-- Modal -->
				</div>
				<!-- row -->
			</div>
			<!-- middle-list -->
		</div>
		<!-- <col-sm-8 col-md-8 col-xs-12 -->
	</div>
	</section>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('#modify').click(function(event){
		event.preventDefault();
               $('#aside').empty();
	$('#aside').load('<%=basePath%>user/toUpdatePd');
	$.getScript('js/modifypassword.js');
	});
	});
</script>
</html>
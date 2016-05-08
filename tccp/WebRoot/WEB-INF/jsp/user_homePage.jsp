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



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统</title>
<link rel="stylesheet" type="text/css" href="css/homepage.css" />
<link
	href="http://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.5-dist/css/bootstrap.css">
<script src="http://cdn.bootcss.com/jquery/3.0.0-beta1/jquery.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="js/homepage.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				//alert("Bug测试");
				var x = xmlhttp.responseText;
				var JSONObject = JSON.parse(x);
				
				$(document).ready(function() {
					var action = new Array();//状态
					var comment = new Array();//评论
					var newtrd = new Array();//公告
					var t = 0, m = 0, n = 0;
					for ( var i = 0; i < JSONObject.length; i++) {
						if (JSONObject[i].action_type == 0) {
							action[t++] = JSONObject[i];
						} else if (JSONObject[i].action_type == 1) {
							comment[m++] = JSONObject[i];
						} else if (JSONObject[i].action_type == 2) {
							newtrd[n++] = JSONObject[i];
						}
					}
					for(var i = 0; i < action.length; i++){
        $(".friend-trends:first").before($('.friend-trends:first').clone(true));
        $(".friend-trends:first .comment-content").css("display", "none");
        var src1 = action[i].image;
        $(".trends img:first").attr('src', src1);
        $("#trends-name").text(action[i].username);
        $("#now-time").text(action[i].action_date);
        $("#act_mes:first").text(action[i].action_message);
        $("#count").text(action[i].action_describe);
        for(var j = 0; j < comment.length; j++){
            if(comment[j].action_describe == action[i].action_id){
                $(".trends:first").after($('.comment-content:first').clone(true));
                var src2 = comment[j].image;
                $(".comment-content img:first").attr('src', src2);
                $(".comment-content:first").css("display","block");
                $("#comment-name").text(comment[j].username);
                $("#timed").text(comment[j].action_date);
                $("#content:first").text(comment[j].action_message);
            }
        }
    }
    $(".friend-trends:last").css("display", "none");

    for(var i = 0; i < newtrd.length; i++){
        $(".newlist:first").before($(".newlist:first").clone(true));
        $("#newlist-content").text(newtrd[i].action_message);
    }
    $(".newlist:last").css("display", "none");
				});
			}
		}
		var url = "<%=basePath%>action/selectAllMoods";
		xmlhttp.open("POST", url, true);
		xmlhttp.send();
	});
</script> 
</head>

<body onLoad="javascript:Ajax_Trends();">

	<!-- 整个页面放在container容器中 -->
	<div class="container">
		<!-- 主页标题，小屏幕的col-sm-12响应式布局 -->
		<div class="row">
			<div class="col-sm-12 col-md-12 col-xs-12">
				<div id="top-nav">
					<img src="images/icon.png" alt="icon" class="icon" id="logoPicture">
					<h1>TCCP&nbsp;</h1>
					<!-- 标题右边用户名 -->
					<ul>
						<img src="images/bg.png" alt="user icon" class="user-icon">
						<li>${User.username}<span class="glyphicon glyphicon-triangle-bottom"
							aria-hidden="true"></span>
							<ul>
								<li><a href="<%=basePath%>user/getUserInformation">个人中心</a></li>
								<li><a href="<%=basePath%>user/userLoginOut">退出</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--end  -->

		<!--主体部分  -->
		<div class="row main-content">
			<div class="col-sm-8 col-md-8 col-xs-12">
				<div class="left-menu">
					<ul id="nav-dot">
						<li><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页
						</li>
						<li><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>群博
						</li>
						<li><span class="glyphicon glyphicon-duplicate"
							aria-hidden="true"></span>简历</li>
						<li><span class="glyphicon glyphicon-heart"
							aria-hidden="true"></span>分享</li>
						<li><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>资金
						</li>
						<li>
							<a href="<%=basePath%>other/toShowBooks"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>书籍</a>
						</li>
						<li><span class="glyphicon glyphicon-folder-open"
							aria-hidden="true"></span>项目</li>
						<br>
						<li id="admin">
							<a href="<%=basePath%>user/toAdminHomepage"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>管理员</a>
						</li>
						<script type="text/javascript">
							if("${User.priority}" == 0){
							 	var ad = document.getElementById("admin");
							 	ad.style.display = "none";
							}
				</script>
					</ul>
				</div>
				<!-- left-menu -->

				<div class="middle-list">
					<!-- 发表动态 -->
					<form method="post" onsubmit="return checkAddMood();" action="<%=basePath%>action/addMood">
						<fieldset class="row comment">
							<textarea class="col-xs-12 col-sm-8" placeholder="说点什么儿吧"
								style="height:82px" id="textarea" name="action_message"></textarea>
							<!-- 照片发表 -->
							<button type="button"
								class="btn btn-default camera col-xs-6 col-sm-2"
								aria-label="Center Align">
								<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
							</button>
							<!-- 发表 -->
							<input class="col-xs-6 col-sm-2" type="submit" name="submit" value="发表" id="makecomment"/>

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
									<input type="file" name="_f" id="_f"
										onchange="showPreview(this)" />
								</div>
							</div>
						</div>
					</form>

					<!-- 全部动态 -->
					<div class="row all-dyn">
						<div class="col-md-12 col-sm-12 update">
							全部动态 <a id="feed_friend_refresh" title="刷新动态" href="javascript:;"
								class="item-left"> <span class="glyphicon glyphicon-repeat"
								aria-hidden="true"></span> </a>
						</div>
						<!-- update -->
						<div class="col-md-12 col-sm-12 col-xs-12 friend-trends">
							<div class="trends">
								<img src="#" alt="user icon" class="user-icon"><br>
								<p id="trends-name" style="margin-top:5px">
									<a href="#"></a>
								</p>
								<div id="now-time" style="margin-top:-5px"></div>
								<hr>
								<p style="margin-left:10%" id="act_mes"></p>
								<div class="pull-right">
									<i class="fa fa-comments btn-lg" style="padding-bottom:10px;"
										data-action="comment" data-toggle="modal"
										data-target="#myModal"></i> <i class="fa fa-thumbs-up btn-lg"
										style="padding-bottom:10px;" data-action="thumbs-up"
										id="count" onclick="count()"></i>
								</div>
								<br>
								<hr>
							</div>
							<!-- pull-right -->
							<!-- 评论部分 -->
							<div class="col-md-12 col-sm-12 col-xs-12 comment-content">
								<img src="#" alt="user icon" id="user-icon"> <a
									class=" q_namecard" link="nameCard_470147204" target="_blank"
									href="#" id="comment-name"></a> &nbsp;回复
								<div id="timed" style="margin-left:40px; margin-top:-10px">
									</div>
								<p id="content" style="margin-top:10px;margin-bottom:10px">
								</p>
							</div>
							<!-- comment-content -->
						</div>
						<!-- friend-trends -->

						<!--点击评论栏,先隐藏  -->
						<!-- Modal -->
						<form method="post" onsubmit="return checkAddComment();" action="<%=basePath%>action/addMood">
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">想说点什么儿呢</h4>
									</div>
									<!-- modal-header -->
									<div class="modal-body">
										<textarea id="textarea_two" name="action_message"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<input type="submit" id="makecomment2" value="发表">
										<!-- class="btn btn-primary" data-dismiss="modal"  -->
										
									</div>
								</div>
								<!-- modal-content -->
							</div>
							<!-- modal-dialog -->
						</div>
						</form>
						<!-- modal-fade -->
					</div>
					<!-- row -->
				</div>
				<!-- middle-list -->
			</div>
			<!-- <col-sm-8 col-md-8 col-xs-12 -->

			<div class="col-sm-4 col-md-4 col-xs-8 right-list">
				<div class="new-trend">
					<h3>最新反馈</h3>
					<ul>
						<li class="newlist"><i class="fa fa-hand-o-right"></i><a
							href="#" id="newlist-content"></a></li>
					</ul>
				</div>
			</div>
			<!-- 公告栏 -->
		</div>
		<!-- row main-content -->
	</div>
	<!-- container -->
</body>
</html>

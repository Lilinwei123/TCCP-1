<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/showbook.css" />
		<link href="http://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5-dist/css/bootstrap.css">
		<script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>
		<script type="text/javascript" src="js/modernizr.js"></script>
		<script src="http://cdn.bootcss.com/jquery/3.0.0-beta1/jquery.min.js"></script>
		<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<title>书籍推荐</title>
</head>
<body>
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
							<li>李林威
								<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>		
								<ul>
									<li><a href="#">个人中心</a></li>
									<li><a href="#">退出</a></li>
								</ul>
							</li>
						</ul>
					</div> 
				</div>
			</div><!--end  -->

				<!--主体部分  -->
	 		<div class="row main-content">
				<div class="col-sm-8 col-md-8 col-xs-12"> 
					<div class="left-menu">
	    			<ul id="nav-dot">
	    				<li>
	          		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页
	          	</li>
	    				<li>
	          		<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>群博
	          	</li>
			        <li>
			          <span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span>简历
			       	</li>
			        <li>
			         <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>分享
			        </li>
			        <li>
			        	<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>资金
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-book" aria-hidden="true"></span>书籍
			        </li>
			        <li>
			          <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>项目
			        </li><br>
			        <li>
			          <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>管理员
			        </li>   
						</ul>
					</div>  <!-- left-menu -->
					<section class="bookcontent">
						<div id="sub-navigation">
							<div id="search">
								<form action="home_submit" method="get" accept-charset="utf-8">
									<label for="search-field">SEARCH</label>					
									<input type="text" name="search field" placeholder="Enter the name of the book" id="search-field" title="Enter search here" class="blink search-field"  />
									<input type="submit" value="GO!" class="search-button" />
								</form>
							</div>
						</div>
						
						<div class="tagBall">
							<a class="tag" target="_blank" href="webbook.html">Web</a>
							<a class="tag" target="_blank" href="#">Android</a>
							<a class="tag" target="_blank" href="#">嵌入式</a>
							<a class="tag" target="_blank" href="#">大数据</a>
							<a class="tag" target="_blank" href="#">其他</a>
							<a class="tag" target="_blank" href="webbook.html">Web</a>
							<a class="tag" target="_blank" href="#">Android</a>
							<a class="tag" target="_blank" href="#">嵌入式</a>
							<a class="tag" target="_blank" href="#">大数据</a>
							<a class="tag" target="_blank" href="#">其他</a>
							<a class="tag" target="_blank" href="webbook.html">Web</a>
							<a class="tag" target="_blank" href="#">Android</a>
							<a class="tag" target="_blank" href="#">嵌入式</a>
							<a class="tag" target="_blank" href="#">大数据</a>
							<a class="tag" target="_blank" href="#">其他</a>
</div>
<script type="text/javascript" src="js/showbook.js"></script>
					</section>

				</div><!-- <col-sm-8 col-md-8 col-xs-12 -->

				<div class="col-sm-4 col-md-4 col-xs-12">
					<div class="right-list">
						<h1>公告</h1>
						<p>最新反馈</p>
					</div>
				</div><!-- 公告栏 -->
			</div> <!-- row main-content -->
		</div><!-- container -->
</body>
</html>
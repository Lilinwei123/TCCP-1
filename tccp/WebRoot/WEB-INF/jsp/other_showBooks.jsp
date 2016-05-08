<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    	<link rel="stylesheet" type="text/css" href="css/allbook.css" />
		<link href="http://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5-dist/css/bootstrap.css">
		<script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>
		<script type="text/javascript" src="js/modernizr.js"></script>
		<script src="http://cdn.bootcss.com/jquery/3.0.0-beta1/jquery.min.js"></script>
		<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/allbook.js"></script>
		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="js/jquery-func.js"></script>
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
						<div class="box-all">
				<div  class="movie">
					<div class="movie-image">
						<span class="play" ><span class="name">Web前端工程师修炼之道</span></span><img src="images/web1.png" alt="web-book1">
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>


				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">JavaScript高级程序设计(第3版)</span></span><img src="images/web2.jpg" alt="web-book2" />
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>
				<!-- end Movie -->
                                                   <!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">Bootstrap实战</span></span><img src="images/web3.png" alt="web-book3" />
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>
				<!-- end Movie -->
				 <!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">jQuery攻略</span></span><img src="images/web4.png" alt="web-book4" />
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>


				<!-- end Movie -->
				<div  class="movie">
					<div class="movie-image">
						<span class="play" ><span class="name">jQuery基础教程(第4版)</span></span><img src="images/web5.png" alt="web-book5">
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">响应式Web设计</span></span><img src="images/web6.jpg" alt="web-book6" />
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>
				<!-- end Movie -->
                                                   <!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">HTML5数据推送</span></span><img src="images/web7.jpg" alt="web-book7" />
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>
				<!-- end Movie -->
				 <!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">JavaScript DOM 编程艺术</span></span><img src="images/web8.jpg" alt="web-book8" />
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">AngularJs</span></span><img src="images/web9.jpg" alt="web-book9" />
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">JavaScript网页动画设计</span></span><img src="images/web10.jpg" alt="web-book10" />
					</div>
					<div class="rating">
						<p style="color:#00f;">RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<!-- <span class="comments">12</span> -->
					</div>
				</div>
				<div class="movie">
					<div class="movie-image">
						<a href="javascript:BOX_show('layer_box');"><span class="play"><span class="name"></span></span><span class="allbook"><span class="glyphicon glyphicon-plus"></span></span></a>
					</div>
					
				</div>
			</div>

					</section>

				</div><!-- <col-sm-8 col-md-8 col-xs-12 -->

				<div class="col-sm-4 col-md-4 col-xs-12">
					<div class="right-list">
						<h1>公告</h1>
						<p>最新反馈</p>
					</div>
				</div><!-- 公告栏 -->
			</div> <!-- row main-content -->
			<div id="layer_box"> 
   <div class="box_title"><span>Upload books</span><a onclick="BOX_remove('layer_box')" href="javascript:void(0)">X</a></div> 
   <div class="box_content"> 
   
    <form onsubmit="return true;" action="" method="post" enctype="multipart/form-data"> 
		<span id="files"> <input type="file" id="upload" name="upload"/></span> 
		    </form> <br>
                                      <ul>
				<li>书籍分组：
			<select style="visibility:visible">
				<option>Web组</option><option>嵌入式组</option>
				<option>大数据组</option><option>Android组</option>
				<option>其他</option>
			</select>
		</li><br>
		
		<li>书名：
			<input name="bookname" id="bookname"  type="text" >
		</li>
		             </ul>
		             <br>
		<button id="uploadbook">确认上传</button>

   </div> 
</div> 
		</div><!-- container -->
	</body>
	<script type="text/javascript" src="./js/allbook.js"></script>
</html>
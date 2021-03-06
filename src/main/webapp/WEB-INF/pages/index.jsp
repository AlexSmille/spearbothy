<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="baidu-site-verification" content="qD58jpUDcB" />
<meta name="keywords" content="博客，Android,Java,资源，论坛，开发者，程序员">
<meta name="description" content="个人博客，记录日常技术文章，心情文章。">
<title>矛屋</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/alert.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/base.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<script type="text/javascript">
	$("document").ready(function() {
		// 文档加载完毕之后，开始请求数据

		requestList("android");
		
		requestList("java");
		
		requestList("server");
		
		requestBreast();	
	
		$(".head_content ul li a:eq(0)").addClass("active");
	})

	function toBlogDetail(id){
		location.href = "${pageContext.request.contextPath}/ui_redArticle?id="+id;
	}
	

	function requestBreast() {
		// 请求Android 的标题，评论次数，查看次数
		
		var params = {
			"type" : "breast",
			"page" : 1,
			"rows" : 3
		};

		$.post("${pageContext.request.contextPath}/findBlogs", params, function(data) {
			var result = JSON.parse(data);
			if (result.code == code_success) {
				var blogs = result.data;
				var $list = $("#index_content_bottom");
				var content = "";
				for (var i = 0; i < blogs.length; i++) {
					var blog = blogs[i];
					
					if(blog.digestContent.length>150){
						blog.digestContent = blog.digestContent.substring(0,150)+"...";
					}
					content = content+"<div style=' cursor:pointer'><span style='display:none' >"+blog.id+"</span><p class='title'>心语心情</p><h3  class='title2'>"+blog.title+"</h3>"
						+"<p class='c'>"+blog.digestContent+"</p></div>";
				}

				$list.html(content);
				
				 $("#index_content_bottom div").click(function(){
					var id = $(this).children("span").first();
					toBlogDetail(id.text());
				}); 
			} else if (result.code == code_toast) {
				$.alert(result.msg);
			}
		});
		
	}
	
	
	function requestList(type) {
		// 请求Android 的标题，评论次数，查看次数
		
		
		var params = {
			"type" : type,
			"page" : 1,
			"rows" : 4
		};
		if(type=="server"){
			params.rows = 3;
		}
		
		$.post("${pageContext.request.contextPath}/findBlogs", params, function(data) {
			var result = JSON.parse(data);
			if (result.code == code_success) {
				var blogs = result.data;
				var $list = $("."+type+" .right");
				var content = "";
				for (var i = 0; i < blogs.length; i++) {
					var blog = blogs[i];
					content = content
							+ "<div class='content'><span style='display:none'>"+blog.id+"</span><p class='title'>"
							+ blog.title + "</p><div class='desc'>评论（"
							+ blog.commentCount + "）  查看（" + blog.browseCount
							+ "）</div></div>"
				}

				$list.html(content);
				
				$("."+type+" div .content").click(function(){
					var id = $(this).children("span").first();
					toBlogDetail(id.text());
				});
			} else if (result.code == code_toast) {
				$.alert(result.msg);
			}
		});

	}
</script>
</head>
<body>
	<%@include file="header.jsp"%>


	<div id="index_center">

                <div id="large-header" class="banner" >
                    <canvas id="demo-canvas"></canvas>
                    <p class="mark animated swing">
    
  <span style="    font-size: 20px;
    display: block;
    position: absolute;
    left: 300px;">我无畏青春 努力不懈而生存</span>
<span style="position: absolute;
    top: 40px;
    left: 400px;">跌倒以后起身 淬炼刚强灵魂</span>
<span style="position: absolute;
    top: 80px;
    left: 500px;">我无畏人生 或高或低的可能</span>
<span style="position: absolute;
    top: 120px;
    left: 600px;">不带遗憾转身 直到梦想完成</span></p>   
                </div>
				<script src="${pageContext.request.contextPath}/js/canvas_banner.js"></script>         
	</div>

	<div id="index_content">

		<div class="java">
			<div class="left">
				<span>JAVA</span>
			</div>
			<div class="right">

			</div>
		</div>

		<div class="android">
			<div class="left">
				<span>Android</span>

			</div>
			<div class="right"></div>
		</div>



		<div class="server">
			<div class="left">
				<span>Server</span>

			</div>
			<div class="right">
				<div class="content">
					<p class="title">利用ViewPager实现淘宝上拉加载详情</p>
					<div class="desc">评论（0） 查看（0）</div>
				</div>
				<div class="content">
					<p class="title">利用ViewPager实现淘宝上拉加载详情</p>
					<div class="desc">评论（0） 查看（0）</div>
				</div>
				<div class="content">
					<p class="title">利用ViewPager实现淘宝上拉加载详情</p>
					<div class="desc">评论（0） 查看（0）</div>
				</div>


			</div>
		</div>
	</div>


	<div id="index_content_bottom">
	</div>
	
<%@include file="bottom.jsp"%>

</body>
</html>
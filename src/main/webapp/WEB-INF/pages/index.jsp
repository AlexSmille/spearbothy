<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>矛屋</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/alert.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>

<script type="text/javascript">
	$("document").ready(function() {
		// 文档加载完毕之后，开始请求数据

		requestAndroid();
	})

	function requestAndroid() {
		// 请求Android 的标题，评论次数，查看次数
		var params = {
			"type" : "android",
			"page" : 1,
			"rows" : 4
		};
		$.post("/findBlogs", params, function(data) {
			var result = JSON.parse(data);
			if (result.code == code_success) {
				var blogs = result.data;
				var $list = $(".android .right");
				var content = "";
				for (var i = 0; i < blogs.length; i++) {
					var blog = blogs[i];
					content = content
							+ "<div class='content'><p class='title'>"
							+ blog.title + "</p><div class='desc'>评论（"
							+ blog.commentCount + "）  查看（" + blog.browseCount
							+ "）</div></div>"
				}

				$list.html(content);
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

		<div class="banner">

			<p>这是一句很长的名言警句，但是还没想好填什么</p>
			<p>----矛屋</p>

		</div>
	</div>

	<div id="index_content">



		<div class="java">
			<div class="left">
				<span>JAVA</span>

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
				<div class="content">
					<p class="title">利用ViewPager实现淘宝上拉加载详情</p>
					<div class="desc">评论（0） 查看（0）</div>
				</div>

			</div>
		</div>

		<div class="android">
			<div class="left">
				<span>Android</span>

			</div>
			<div class="right"></div>
		</div>



		<div class="ios">
			<div class="left">
				<span>IOS</span>

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
		<div>
			<p class="title">心语心情</p>
		</div>

		<div>
			<p class="title">心语心情</p>
		</div>

		<div>
			<p class="title">心语心情</p>
		</div>

	</div>

</body>
</html>
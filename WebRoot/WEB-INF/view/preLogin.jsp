<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录导航栏</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css 

">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js 

"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js 

"></script>
</head>
<body style="background: url(images/b4.jpg)">

<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">登录</a>
	</div>
	<div class="collapse navbar-collapse" id="example-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">切换用户类型</a></li>
			<li><a href="Login">商户登录</a></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					客户登录 <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">学生登录</a></li>
					<li><a href="#">教师登录</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</div>
</nav>

</body>
</html>

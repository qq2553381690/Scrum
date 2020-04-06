<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理员业务页面</title>
	</head>
	<body style="background: url(images/b4.jpg)">
	<h1>登陆成功,欢迎您,<%=request.getSession().getAttribute("user_id") %>,商户<h1>
	<center>
	 
	    
	    
	   
	    	<div
		style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
		<h1>管理员业务：</h1>
	</div>
	
	<br>
	<a href="${pageContext.request.contextPath }/PreBusUpEdit">编辑</a>
	
	
	</center>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>教师业务页面</title>
	</head>
	<body style="background: url(images/b4.jpg)">
	<br>
	登陆成功,欢迎您,<%=request.getSession().getAttribute("user_id") %>,老师
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	
	 
	   <div
		style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
		<h1>教师用户</h1>
	 <center>
	  <br>
	   <br>
	    <fieldset style="width: 800px " >
         <legend>业务类型</legend>
	    
	  <br>
	
	
	<a href="${pageContext.request.contextPath }/PreNonChecked">审核学生一卡通</a>
	
	<br>
	
	 
	 <a href="${pageContext.request.contextPath }/ShowShop">购买物品</a>
	 
	  <br> <br>
	 
	</fieldset>
	    <br>
	<a href="${pageContext.request.contextPath }/Login">返回</a><br>

	   </from>
	</center>
	
	</body>
</html>
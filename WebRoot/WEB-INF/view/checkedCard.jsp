<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		 
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<title>一卡通申请成功页面</title>
	</head>
	<body style="background: url(images/b4.jpg)">
	<br>
	登陆成功,欢迎您,<%=request.getSession().getAttribute("user_id") %>,学生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 
	    <br>
	    <br>
	  
	      <div
		style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
		<h1>学生用户</h1>
	  <br>
	  <center>
	   <fieldset style="width: 800px " >
            <legend>学生业务</legend>
		<form action="${pageContext.request.contextPath }/ShowShop">
	
	    <br>
	    <table>
	       <tr>
	         <td>
		         <input type="hidden" name="userNm" value=${userNm }>
		          <p class="text-muted">一卡通申请结果：</p>
		      </td>
		      <td>
		          <p class="text-success">审核已通过</p>
		      </td>
		   </tr>
		  
		  </table>
		   <br>
		  您可以点击以下按钮，浏览商城
		  <br>
		 
		   &nbsp;&nbsp;<button type="submit">浏览商城</button><br>
		<br>
	        &nbsp;&nbsp;<a href="${pageContext.request.contextPath }/Login">返回</a>
	   <br>
	  
	</form>
	</fieldset>
	</center>
	</body>
</html>
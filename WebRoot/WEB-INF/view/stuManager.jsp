<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<title>学生申请一卡通页面</title>
	</head>
	<body style="background: url(images/b4.jpg)">
	登陆成功,欢迎您,${user_id },学生
	<center>
	 
	    
	    
	   
	    	<div
		style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
		<h1>申请一卡通</h1>
	</div>
	
	<br>
     <br>
      <fieldset style="width: 800px " >
         <legend>填写学生信息</legend>
	
	
	<br>
	<form action="${pageContext.request.contextPath }/ApplyCard">
	
	<table>
	   <tr>
		<td>姓名:<input name="name"><br></td>
	   </tr>
	   <tr>
		<td>班级:<input name="class1"><br><td>
	   </tr>
	   <tr>
		<td>地址:<input name="address"><br></td>
	   </tr>
	   
	    <tr>
	    <td>
		<input type="hidden" name="userNm" value=${userNm }>
		<br>
		<button type="submit">申请</button>
		</td>
		</tr>
		</table>
	</form>
	<br>
	<a href="${pageContext.request.contextPath }/Login">返回</a><br>
	</fieldset>
	</center>
	</body>
</html>
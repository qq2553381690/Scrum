<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     
  
  
  
    <title>登录页面</title>
    
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body style="background: url(images/b4.jpg)">
 
  <center>
    	<div
		style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
		<h1>智慧校园系统</h1>
	</div>
    <br>
     <br>
      <fieldset style="width: 800px " >
         <legend>用户登录</legend>
    
  
     <form action="${pageContext.request.contextPath }/CheckLogin" method="post">
     <br>
     <br>
          <table >
              
               <tr>
                   <td>用户名:</td>
                   <!-- name属性是共后台取值用的 -->
                   <td><input type="text" name="username"/></td>
               </tr>
               
               <tr>
                   <td>密码:</td>
                   <td><input type="password" name="password"/></td>
               </tr>
               
               <tr><td><br></td></tr>
               <tr>
                   <td colspan="2" align="center" >
                   <input type="submit" value="登录"  /> </td>
                   <span style="color:red;">${loginMsg}</span>
               </tr>
          </table>
     </form>
       </fieldset>
     </center>
  </body>
</html>

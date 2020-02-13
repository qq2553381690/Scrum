<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<style type="text/css">
	
	table{margin:0 auto;}
	
	
	</style>	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
		<meta charset="utf-8"> 
		<title>设置商品状态</title> 
		<meta name="description" content="Bootstrap Basic Tab Based Navigation Example">
		<link href="/try/bootstrap/twitter-bootstrap-v2/docs/assets/css/bootstrap.css" rel="stylesheet"> 
		
		<script type="text/javascript">
			function ok() {
				return confirm("确认删除");
			}
		</script>
		
	<style type="text/css">
 .button5 {
    		  background-color: #D4D4D4;
   		      color: black;
    		  border: 2px solid #D4D4D4;
		  }

		  .button5:hover {
    		  background-color: #D1EEEE;
   		      color: black;
		   }
	  </style>	
	  
	</head>
	
	<body style="background: url(images/b4.jpg)">
		<div class="container">
			<div class="row">
				<div class="span6">
					<ul class="nav nav-tabs">
						<li><a>商家信息</a></li><br>
						<p class="text-right"><%=request.getSession().getAttribute("user_id")%>,您的账户余额:<%=request.getSession().getAttribute("balance") %></p> 
					</ul>
				</div>
			</div>
			<br>
			<table class="table table-striped table-bordered table-hover col-md-8">
			<thead>
				<tr>
			  		<th>商家名</th>
			  		<th>商家地址</th>
				</tr>
			</thead>
			<%
				String flag = (String)request.getSession().getAttribute("flag");
				System.out.print(flag);
				if(flag.equals("true")){
			%>
					<tbody>
					    <c:forEach var="i" begin="0" end="${counter }">
					    	<tr>
						    	<c:forEach var="j" begin="1" end="2">
						    		<td width=150px>
						    		${result[i][j] }
						    		</td>
						    	</c:forEach>
						    	<td width=150px>
					    			<form action="${pageContext.request.contextPath }/PrePerchaseUp" method="post">
					    				<input type="hidden" name="shop_uuid" value="${result[i][0] }">
					    				
							    		<button type="submit" class="button button5">进入店铺</button>
							    	</form>
					    		</td>
					    	</tr>
					    </c:forEach>
				    </tbody>
		    <%}; %>
	    </table>
	    <a href="${pageContext.request.contextPath }/Login">返回</a><br>
		</div>
		<br>
		<br>
	</body>
</html>
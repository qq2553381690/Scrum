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
		
		
	</head>
	
	<body style="background: url(images/b4.jpg)">
		<div class="container">
			<div class="row">
				<div class="span6">
					<ul class="nav nav-tabs">
						<li> <a href="${pageContext.request.contextPath }/PreBusAdd">添加商品</a> </li> 
						<li><a href="${pageContext.request.contextPath }/PreBusUpEdit">上架商品</a></li>
						<li><a href="${pageContext.request.contextPath }/PreBusDownEdit">下架商品 </a></li> 
						<li><a href="${pageContext.request.contextPath }/PreBusAbsenceEdit">缺货商品 </a></li> 
						<li class="active"><a href="${pageContext.request.contextPath }/ShowBusOrder">订单查询 </a></li><br>
						<p class="text-right"><%=request.getSession().getAttribute("shop_name") %></p>  
					</ul>
				</div>
			</div>
			<table class="table table-striped table-bordered table-hover col-md-8">
				<thead>
					<tr>
				  		<th>购买账号</th>
				  		<th>商品名</th>
				  		<th>商品来源</th>
				  		<th>条形码</th>
				  		<th>商家名</th>
				  		<th>购买数量</th>
				  		<th>购买单价</th>
				  		<th>交易金额</th>
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
						    	<c:forEach var="j" begin="0" end="7">
						    		<td width=150px>
						    		${result[i][j] }
						    		</td>
						    	</c:forEach>
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
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
				return confirm("确认通过");
			}
		</script>
		
	</head>
	
	<body style="background: url(images/b4.jpg)">
		<div class="container">
			<div class="row">
				<div class="span6">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${pageContext.request.contextPath }/PreNonChecked">未审核</a></li>
						<li><a href="${pageContext.request.contextPath }/PreChecked">已审核 </a></li> 
					</ul>
				</div>
			</div>
			<table class="table table-striped table-bordered table-hover col-md-8">
			<thead>
				<tr>
			  		<th>学号</th>
			  		<th>姓名</th>
			  		<th>班级</th>
			  		<th>地址</th>
			  		<th>状态</th>
			  		<th>初始余额</th>
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
						    	<c:forEach var="j" begin="0" end="4">
						    		<td width=150px>
						    			${result[i][j] }
						    		</td>
						    	</c:forEach>
						    	<form action="${pageContext.request.contextPath }/PassCheck" method="post" onsubmit="return ok()">
						    		<td width=75px>
						    			<input type="text" name="balance">
						    		</td>
						    		<td width=75px>
							    		<input name="stu_id" value="${result[i][0] }" type="hidden">
							    		<button type="submit">通过</button>
					    			</td>
					    		</form>
					    	</tr>
					    </c:forEach>
				    </tbody>
		    <%}; %>
	    </table>
	    <a href="${pageContext.request.contextPath }/TeaManager">返回</a><br>
		</div>
		<br>
		<br>
	</body>
</html>
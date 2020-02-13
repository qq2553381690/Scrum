<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	<style type="text/css">
	
	table{margin:0 auto;}
	
	
	</style>	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
		<meta charset="utf-8"> 
		<title>商户业务页面</title> 
		<meta name="description" content="Bootstrap Basic Tab Based Navigation Example">
		<link href="/try/bootstrap/twitter-bootstrap-v2/docs/assets/css/bootstrap.css" rel="stylesheet"> 
		
		<script type="text/javascript">
			function ok() {
				return confirm("确认删除");
			}
		</script>
		
	</head>
	
	<body style="background: url(images/b4.jpg)">
		<div class="container">
			<div class="row">
				<div class="span6">
					<ul class="nav nav-tabs">
						<li><a href="${pageContext.request.contextPath }/PreBusAdd">添加商品</a> </li> 
						<li class="active"><a href="${pageContext.request.contextPath }/PreBusUpEdit">上架商品</a></li>
						<li><a href="${pageContext.request.contextPath }/PreBusDownEdit">下架商品 </a></li> 
						<li><a href="${pageContext.request.contextPath }/PreBusAbsenceEdit">缺货商品 </a></li> 
						<li><a href="${pageContext.request.contextPath }/ShowBusOrder">订单查询 </a></li> <br>
						<p class="text-right"><%=request.getSession().getAttribute("shop_name") %></p> 
					</ul>
				</div>
			</div>
			<br>
			<table class="table table-striped table-bordered table-hover col-md-8">
				<thead>
					<tr>
				  		<th>商品名</th>
				  		<th>商品来源</th>
				  		<th>条形码</th>
				  		<th>商品图片</th>
				  		<th width=150px>商品缩略图</th>
				  		<th>商品描述</th>
				  		<th>商品详情</th>
				  		<th>商品状态</th>
				  		<th>商品数量</th>
				  		<th>商品单价</th>
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
						    	<c:forEach var="j" begin="1" end="4">
						    		<td width=130px>
						    		${result[i][j] }
						    		</td>
						    	</c:forEach>
						    	<td>
						    		<img id="img_id" width="60" height="60" src="${result[i][5] }"/>
						    	</td>
						    	<c:forEach var="j" begin="6" end="10">
						    		<td width=130px>
						    		${result[i][j] }
						    		</td>
						    	</c:forEach>
						    	<td width=75px>
							    	<form action="${pageContext.request.contextPath }/PreBusModify" method="post">
							    		<input name="id" value="${result[i][0] }" type="hidden">
							    		<input name="state" value="1" type="hidden">
							    		<button type="submit">修改</button>
							    	</form>
						    	</td>
						    	<td width=75px>
					    			<form action="${pageContext.request.contextPath }/DeleteBusInfo" method="post" onsubmit="ok()">
							    		<input name="id" value="${result[i][0] }" type="hidden">
							    		<input name="state" value="1" type="hidden">
							    		<button type="submit">删除</button>
							    	</form>
					    		</td>
					    		<td width=75px>
					    			<form action="${pageContext.request.contextPath }/DownBusInfo" method="post">
							    		<input name="id" value="${result[i][0] }" type="hidden">
							    		<input name="state" value="1" type="hidden">
							    		<button type="submit">下架</button>
							    	</form>
					    		</td>
					    		<td width=75px>
					    			<form action="${pageContext.request.contextPath }/AbsenceBusInfo" method="post">
							    		<input name="id" value="${result[i][0] }" type="hidden">
							    		<input name="state" value="1" type="hidden">
							    		<button type="submit">缺货</button>
							    	</form>
					    		</td>
					    	</tr>
					    </c:forEach>
				    </tbody>
			    <%}; %>
		    </table>
		    ${alert_str }<br>
		    <a href="${pageContext.request.contextPath }/Login">返回</a><br>
		</div>
		<br>
		<br>
	</body>
</html>
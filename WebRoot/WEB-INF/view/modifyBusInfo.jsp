<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<style type="text/css"	>
	table{margin:0 auto;}
	
	
	</style>	

	<script type="text/javascript">
	
	
		
		
		function xx()
        {
        	alert("上传成功");
        	$("#formId").submit();<%-- 
       		console.log("<%=request.getSession().getAttribute("realPath")%>");
			$("#img_id").attr("src","<%=request.getSession().getAttribute("realPath")%>"); --%>
				
			var path = "<%=request.getSession().getAttribute("path")%>";
       		console.log(path);
			//$("#img_id").attr("src",path);
			//document.getElementById("g_simg").value = path;
        }
		function ok() {
			return confirm("确认修改");
		}
		
		function checkNull(){
				if(!document.getElementById("g_name").value){
					alert("商品名不能为空");
					return false;
				}
				if(!document.getElementById("g_ly").value){
					alert("商品来源不能为空");
					return false;
				}
				if(!document.getElementById("g_vid").value){
					alert("条形码不能为空");
					return false;
				}
				if(!document.getElementById("g_num").value){
					alert("商品数量不能为空");
					return false;
				}
				return true;
			}
			
			function c1() {
				var reg = /^[0-9]+.?[0-9]*$/;
  				if (reg.test(document.getElementById("g_num").value)) {
    				return true;
  				}
  				alert("商品数量应为数字");
  				return false;
			}
			
				function c2() {
				var reg = /^[0-9]+.?[0-9]*$/;
  				if (reg.test(document.getElementById("g_unit_price").value)) {
    				return true;
  				}
  				alert("商品单价应为数字");
  				return false;
			}
			
	</script>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改页面</title>
	</head>
   <body style="background-color: #FAF0E6">
		<div
			style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
			<h1>修改商品</h1>
		</div>
		
		<center>
		<fieldset style="width: 800px " >
         <legend>请修改商品信息</legend>
         <br>
         <form id="formId" action="${pageContext.request.contextPath }/file/upload2" method="post" enctype="multipart/form-data">
        	<table>
	        	<tr>
	        		<td>
		        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        		选择商品图片路径
		        	</td>
		        	<td>
		        		<input type="file" name="file2" style="width: 200px">
		        	</td>
		        </tr>
		        <tr> <td><br></td> </tr>
		        <tr>
		        	<td>
		        		<input style="width:400px;" type="text" value="<%=request.getSession().getAttribute("path")%>" disabled>
		        	</td>
		        	<td>
		        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        		<button type="submit" id="buttonId" onclick="xx()">上传</button>
		        	</td>
	        	</tr>
        	</table>
        </form>
         <br>
         
		<form action="${pageContext.request.contextPath }/ModifyBusInfo" method="post" onsubmit="return checkNull()&&ok()&&c1()&&c2()">
			<table >
				
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>
						商品名：
					</td>
					<td>
						<input type="text" name="g_name" id="g_name" 
						value="${resultVector[1] }">
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;商品来源：
					</td>
					<td>
						<input type="text" name="g_ly" id="g_ly" value="${resultVector[2] }">
					</td>
				</tr>
				
				<tr><td><br></td></tr>
				
				<tr>
					<td>
						条形码：
					</td>
					<td>
						<input type="text" name="g_vid"  id="g_vid" value="${resultVector[3] }">
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;商品图片：
					</td>
					<td>
						<input type="text" name="g_img" id="g_img" value="${resultVector[4] }">
					</td>
				</tr>
				
				<tr><td><br></td></tr>
				
				<tr>
					<td>
						商品缩略图：
					</td>
					<td>
						<input type="text"  name="g_simg" id="g_simg" value="<%=request.getSession().getAttribute("path")%>" readonly>
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;商品数量：
					</td>
					<td>
						<input type="text"  name="g_num" id="g_num" value="${resultVector[9] }" onblur="return c1()">
					</td>
				</tr>
				
				<tr><td><br></td></tr>
				
				<tr>
					<td>
						商品详情：
					</td>
					<td>
						<input type="text" style="height:100px;" name="g_details" value="${resultVector[7] }">
					</td>										
					<td>
						&nbsp;&nbsp;&nbsp;商品描述：
					</td>
					<td>
						<input type="text" style="height:100px;" name="g_label" id="g_label"
						value="${resultVector[6] }">
					</td>
				</tr>
				
				<tr><td><br></td></tr>
				
				<tr>
					<td>
						商品单价：
					</td>
					<td>
						<input type="text" name="g_unit_price" id="g_unit_price" value="${resultVector[10] }"onblur="return c2()">
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;商品状态：
					</td>
					<td>
						<input type="text"  name="g_state" value="${resultVector[8] }" disabled>
					</td>
				</tr>
			
			<tr><td><br></td></tr>
			
			<tr>
			  <td><input type="submit" value="修改"></td>
			  
			</tr>
			  </table>
			  <%-- <table >
				
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>
						商品名：
					</td>
					<td>
						<input type="text" name="g_name" id="g_name" value="${resultVector[1] }">
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品来源：
					</td>
					<td>
						<input type="text" name="g_ly" id="g_ly" value="${resultVector[2] }">
					</td>
				</tr>
				
				<tr> <td><br></td>  <td><br></td>  </tr>
				<tr>
					<td>
						条形码：
					</td>
					<td>
						<input type="text" name="g_vid"  id="g_vid" value="${resultVector[3] }">
					</td>
					<td>	
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品图片：
					</td>
					<td>
						<input type="text" name="g_img" id="g_img" value="${resultVector[4] }">
					</td>
				</tr>
				
				<tr> <td><br></td>  <td><br></td>  </tr>
				
				<tr>
					<td>
						商品缩略图：
					</td>
					<td>
						<input type="text" name="g_simg" id="g_simg" value="${resultVector[5] }" readonly>
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品描述：
					</td>
					<td>
						<input type="text" name="g_label" id="g_label" value="${resultVector[6] }">
					</td>
				</tr>
				
				<tr> <td><br></td>  <td><br></td>  </tr>
				
				
				<tr>
					<td>
						商品详情：
					</td>
					<td>
						<input type="text" name="g_details" value="${resultVector[7] }">
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品数量：
					</td>
					<td>
						<input type="text" name="g_num" id="g_num" value="${resultVector[8] }" onblur="return c1()">
					</td>
				</tr>
				
				
				<tr> <td><br></td>  <td><br></td>  </tr>
				
				<tr>
					<td>
						商品单价：
					</td>
					<td>
						<input type="text" name="g_unit_price" id="g_unit_price" value="${resultVector[10] }" onblur="return c2()">
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品状态：
					</td>
					<td>
						<select name="g_state" value="${resultVector[8] }">
						    <option value="1">上架</option>
						    <option value="0">下架</option>
						    <option value="2">缺货</option>
						</select>
					</td>
				</tr>
		
			
			
			
			<tr> <td><br></td>    </tr>
			
			 <tr>
			    <td>
			  <input type="submit" value="添加">
			    </td>
			 </tr>
			  <br>
			  <br>
	</table> --%>
			
		    </form>
		 <br>
			  <br>
		<a href="${pageContext.request.contextPath }/PreBusUpEdit">返回</a><br>
		</center>
		</fieldset>
	</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>多文件上传</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- js静态资源 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
</head>

<script type="text/javascript">

	function Get_FileUploadLocalPath(obj) {
		return GetFileUploadLocalPath(obj);
	}

	function GetFileUploadLocalPath(obj) {
		if (obj) {
			if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
				obj.select();
				var o = obj.createTextRange();

				return o.text;
			} else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
				if (obj.files) {
					return obj.files.item(0).getAsDataURL();
				}
				return obj.value;
			}
			return obj.value;
		}
	}


	// $(function() {});
	$(function() {
		var i = 1;

		// 当用户点击  "更多" 要copy一份id="d"的div
		$("#more").click(function() {
			// 选中id="d"的div  
			var d = $("#d").clone(true);

			// 保证在同一个页面中id的值不能重复
			// 给id="d"的div加一个id=di
			d.attr("id", "d" + i);

			// 在 id="more" 上传更多按钮前插入  d 对象
			$("#more").before(d);

			// $("#d input")
			// 清空 id=di下面input标签中的内容
			$("#d" + i + " input").val("");

			// 每点击一次"更多", i的值就+1
			i++;

		});

		// 点击  "删除"
		$("div a[name='deleteFile']").click(function() {
			if (confirm("您确认删除吗?")) {
				// $(this).parent().attr("id") 找到div中的id属性值
				if ($(this).parent().attr("id") == "d") {
					alert("原始文件不能删除");
				} else {
					// 这里的this指用户点击的"删除" a链接
					$(this).parent().remove();
				}

			}
		});


		// 手动提交表单
		$("#buttonId").click(function() {
			$("#formId").submit();
		});

		$("#open-file").change(function() {
			console.log(Get_FileUploadLocalPath(this));
			$("#img_id").attr("src",Get_FileUploadLocalPath(this));;
		});


	});
</script>
<body>
	<!-- 
           1.必须是表单提交, 提交方式必须是 method="post" 
           2.enctype="multipart/form-data" 将要上传图片以二进制流的形式上传
           3.<input type="file" name="file">
        -->
	<h1>单文件上传</h1>
	<form id="formId"
		action="${pageContext.request.contextPath }/file/upload" method="post"
		enctype="multipart/form-data">
		文件 <input type="file" id="open-file"
			><br /> <br />
		<!--  <input type="file" name="file"><br/><br/>-->
		<!-- 
                           注意: 
               type="submit" 自动提交表单 
               type="button" 我们要手动提交表单
           -->
		<input type="button" value="上传" id="buttonId" /> <br> 
		<img
			id="img_id" width="128" height="128"/>
	</form>


	<h1>多文件上传</h1>

	<form action="${pageContext.request.contextPath }/file/uploadMore"
		method="post" enctype="multipart/form-data">
		<div id="d">
			文件<input type="file" name="file"> <a
				href="javascript:void(0);" name="deleteFile">删除</a>
		</div>

		<input type="button" id="more" value="更多" /> <input type="submit"
			value="上传" />
	</form>

</body>
</html>
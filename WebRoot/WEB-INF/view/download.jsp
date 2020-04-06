<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>文件下载</title>
	</head>
	<body>
	    <h1>文件下载1</h1>
	    <a href="${pageContext.request.contextPath }/images/6.jpg">下载地址一</a>
	    
	    <hr/>
	    <h1>文件下载2</h1>
	    <a href="${pageContext.request.contextPath }/file/download2">下载地址二</a>
	    
	    
	    <hr/>
	    <h1>文件下载3</h1>
	    <a href="${pageContext.request.contextPath }/file/download3">下载地址三</a>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page language="java" import="mysqldb.CDB"%>
<%@ page language="java" import="javax.swing.JOptionPane"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<%
		CDB c1 = new CDB();
		c1.InitCon();
		String sql = "select * from car_info";
		c1.executeQuery(sql);
		int counter = 0;
		String[][] result = new String[100][9];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 9; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pageContext.setAttribute("list", result);
	 %>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	
	</head>
	<body>
	</body>
</html>
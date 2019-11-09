<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
	<body>
		<%
//    		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//			Connection conn = DriverManager.getConnection("jdbc:odbc:DSSchool");
//			Statement stat = conn.createStatement();
			String url = "jdbc:mysql://localhost:3306/school?"
					+ "user=root&password=root&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url);
			Statement stat = (Statement) conn.createStatement();
			String sql = "UPDATE T_STUDENT SET STUSEX='女' WHERE STUNO='0007'";
			int i = stat.executeUpdate(sql);
			out.println("成功修改" + i + "行");
			stat.close();
			conn.close();
    %>
	</body>
</html>

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
			String sql = "SELECT STUNO,STUNAME FROM T_STUDENT WHERE STUSEX='Ů'";
			ResultSet rs = stat.executeQuery(sql);
			while(rs.next()){
				String stuno = rs.getString("STUNO");
				String stuname = rs.getString("STUNAME");
				out.println(stuno + "  " + stuname + "<BR>");
			}
			stat.close();
			conn.close();
    %>
	</body>
</html>

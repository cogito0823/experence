<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <body> 
   <%
   		String teacherno = request.getParameter("teacherno");
//   		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//		Connection conn = DriverManager.getConnection("jdbc:odbc:DSSchool");
	   String url = "jdbc:mysql://localhost:3306/school?"
			   + "user=root&password=root";

	   Class.forName("com.mysql.jdbc.Driver");
	   Connection conn = DriverManager.getConnection(url);
		String sql = 
"UPDATE T_VOTE SET VOTE=VOTE+1 WHERE TEACHERNO=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,teacherno);
		ps.executeUpdate();
		ps.close();
		conn.close();
	%>
	<jsp:forward page="display.jsp"></jsp:forward>
  </body>
</html>

<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%!
	public Connection getConnection() throws Exception{
       String url = "jdbc:mysql://localhost:3306/school?"
               + "user=root&password=root";
               //&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection(url);
	    return conn;
	}
%>

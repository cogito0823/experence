package edu.util;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	
	public static Connection getConnection() {
		//String database = "place";
		//String user = "root";
		//String psw = "123456";
		String url="jdbc:mysql://localhost:3306/place?user=root&password=root&useUnicode=true&characterEncoding=GB2312";
		//String url = "jdbc:mysql://localhost/" + database+"?useUnicode=true&characterEncoding=utf-8";	//String url = "jdbc:sqlserver://172.26.53.255:1433;DatabaseName=" + database;
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url);
			return conn;
		} catch (Exception e) {
			System.out.println("数据库连接错！");
			e.printStackTrace(); 
		}
		return null;
	}
}


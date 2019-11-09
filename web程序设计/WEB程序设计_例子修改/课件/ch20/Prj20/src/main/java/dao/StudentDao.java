package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
	private Connection conn = null;
	public void initConnection() throws Exception {
//		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//		conn = DriverManager.getConnection("jdbc:odbc:DSSchool", "", "");
		String url = "jdbc:mysql://localhost:3306/school?"
				+ "user=root&password=root&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url);
	}
	public void closeConnection() throws Exception {
		conn.close();
	}
	public List getStunamesByStuSex(String stusex)throws Exception{
		String sql = 
"SELECT STUNAME FROM T_STUDENT WHERE STUSEX=?";
		List stunames = new ArrayList();
		this.initConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, stusex);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			stunames.add(rs.getString("STUNAME"));
		}		
		this.closeConnection();
		return stunames;
	}	
}

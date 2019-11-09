package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import vo.Customer;

public class CustomerDao {
	private Connection conn = null;
	public void initConnection() throws Exception {
//		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//		conn = DriverManager.getConnection("jdbc:odbc:DSSchool", "", "");
		String url = "jdbc:mysql://localhost:3306/school?"
				+ "user=root&password=root&useUnicode=true&characterEncoding=UTF8&serverTimezone=UTC";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url);
	}
	//根据账号查询Customer对象
	public Customer getCustomerByAccount(String account) throws Exception {
		Customer cus = null;
		initConnection();
		String sql = 
"SELECT ACCOUNT,PASSWORD,CNAME FROM T_CUSTOMER WHERE ACCOUNT=?";
//		System.out.println(sql);
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, account);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			cus = new Customer();
			cus.setAccount(rs.getString("ACCOUNT"));
			cus.setPassword(rs.getString("PASSWORD"));
			cus.setCname(rs.getString("CNAME"));
		}
		closeConnection();
		return cus;		
	}	
	public void closeConnection() throws Exception {
		conn.close();
	}
}
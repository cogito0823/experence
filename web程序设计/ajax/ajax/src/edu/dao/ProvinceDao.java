package edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.beans.Province;
import edu.util.DBConnector;



public class ProvinceDao {
	
	Connection con = null;
	
	public List<Province> findAll(){
		List<Province> provinceList = new ArrayList<Province>();
		Province province = null;
		con = DBConnector.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from TProvince";
		System.out.println(sql);
		try{
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				int provinceId = rs.getInt(1);
				String provinceCode = rs.getString(2);
				String provinceName = rs.getString(3);
				String provinceNum = rs.getString(4);
				province = new Province(provinceId, provinceCode, provinceName, provinceNum);
				//province.setProvinceId(rs.getInt(1));
				
				provinceList.add(province);
			}
			return provinceList;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
				rs.close();
				ps.close();
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}

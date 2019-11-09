package edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.beans.City;
import edu.util.DBConnector;



public class CityDao {
	
	Connection con = null;
	
	public List<City> findByProvinceId(int provinceId){
		List<City> cityList = new ArrayList<City>();
		City city = null;
		con = DBConnector.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from TCity where provinceId = ?";
		try{
			ps = con.prepareStatement(sql);
			ps.setInt(1, provinceId);
			rs = ps.executeQuery();
			while(rs.next()){
				int cityId = rs.getInt(1);
				String cityCode = rs.getString(3);
				String cityName = rs.getString(4);
				city = new City(cityId, provinceId, cityCode, cityName);
				cityList.add(city);
			}
			return cityList;
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
	
	/*
	 * 根据城市ID找省市名
	 */
	public String findCityNameById(int cityId) throws SQLException{
		con = DBConnector.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select p.provinceName,c.cityName from TCity as c " +
				"left join TProvince as p on c.provinceId = p.provinceId " +
				" where cityId = ?";
		String cityName = "";
		try{
			ps = con.prepareStatement(sql);
			ps.setInt(1, cityId);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				cityName = rs.getString(1)+rs.getString(2);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
				rs.close();
				ps.close();
				con.close();
		}
		return cityName;
	}
	
	/*
	 * 根据cityId找所在省provinceId
	 */
	public int findProIdById(int cityId) throws SQLException{
		con = DBConnector.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select provinceId from TCity where cityId = ?";
		int pid = -1 ;
		try{
			ps = con.prepareStatement(sql);
			ps.setInt(1, cityId);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				pid = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
				rs.close();
				ps.close();
				con.close();
		}
		return pid;
	}

}

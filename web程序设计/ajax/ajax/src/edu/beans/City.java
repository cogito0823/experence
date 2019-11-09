package edu.beans;

public class City {
	private int cityId;
	private int provinceId;
	private String cityCode;
	private String cityName;
	
	public City() {
		super();
	}
	
	public City(int cityId, int provinceId, String cityCode, String cityName) {
		super();
		this.cityId = cityId;
		this.provinceId = provinceId;
		this.cityCode = cityCode;
		this.cityName = cityName;
	}

	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public int getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

}

package edu.beans;

public class Province {
	private int provinceId;
	private String provinceCode;
	private String provinceName;
	private String provinceNum;
	
	
	public Province() {
		super();
	}
	
	public Province(int provinceId, String provinceCode, String provinceName,
			String provinceNum) {
		super();
		this.provinceId = provinceId;
		this.provinceCode = provinceCode;
		this.provinceName = provinceName;
		this.provinceNum = provinceNum;
	}

	public int getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}
	public String getProvinceCode() {
		return provinceCode;
	}
	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getProvinceNum() {
		return provinceNum;
	}
	public void setProvinceNum(String provinceNum) {
		this.provinceNum = provinceNum;
	}

}

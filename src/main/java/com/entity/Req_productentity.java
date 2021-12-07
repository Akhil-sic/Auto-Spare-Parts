package com.entity;

public class Req_productentity extends User{
	private int reqid;
	private int uid;
	private String Pname;
	private String brand;
	private String model;
	private String year;
	private String Pdesc;
	private int qantity;
	
	public int getReqid() {
		return reqid;
	}

	public void setReqid(int reqid) {
		this.reqid = reqid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getPname() {
		return Pname;
	}

	public void setPname(String pname) {
		Pname = pname;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getPdesc() {
		return Pdesc;
	}

	public void setPdesc(String pdesc) {
		Pdesc = pdesc;
	}

	public int getQantity() {
		return qantity;
	}

	public void setQantity(int qantity) {
		this.qantity = qantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private String status;
	
	public Req_productentity() {
		super();
	}

}

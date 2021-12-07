package com.entity;

public class Brand {
	 private int Bid;
	 private String bname;
	 private String btype;
	 
	 
	


	public Brand() {
		super();
	}


	public Brand(String bname, String btype) {
		super();
		this.bname = bname;
		this.btype = btype;
	}




	public int getBid() {
		return Bid;
	}


	public void setBid(int bid) {
		Bid = bid;
	}


	public String getBname() {
		return bname;
	}


	public void setBname(String bname) {
		this.bname = bname;
	}


	public String getBtype() {
		return btype;
	}


	public void setBtype(String btype) {
		this.btype = btype;
	}


	@Override
	public String toString() {
		return "Brand [id=" + Bid + ", bname=" + bname + ", btype=" + btype + "]";
	}
	
	
}

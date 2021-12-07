package com.entity;

public class Products extends Vmodel {
	private int pid;
	private int br_id;
	private int vm_id;
	private String Pname;
	private double cprice;
	private double sprice;
	private String Pescription;
	private String Pdetail;
	private int qantity;
	private String Pimg1;
	private String Pimg2;
	private String Pimg3;
	private String manuf_no;
	private String status;
	
	public Products() {
		super();
	}
	
	

	public Products(int br_id, int vm_id, String pname, double cprice, double sprice, String pescription,
			String pdetail, int qantity, String pimg1, String pimg2, String pimg3) {
		super();
		this.br_id = br_id;
		this.vm_id = vm_id;
		Pname = pname;
		this.cprice = cprice;
		this.sprice = sprice;
		Pescription = pescription;
		Pdetail = pdetail;
		this.qantity = qantity;
		Pimg1 = pimg1;
		Pimg2 = pimg2;
		Pimg3 = pimg3;
	}



	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getBr_id() {
		return br_id;
	}

	public void setBr_id(int br_id) {
		this.br_id = br_id;
	}

	public int getVm_id() {
		return vm_id;
	}

	public void setVm_id(int vm_id) {
		this.vm_id = vm_id;
	}

	public String getPname() {
		return Pname;
	}

	public void setPname(String pname) {
		Pname = pname;
	}

	

	public double getCprice() {
		return cprice;
	}

	public void setCprice(double cprice) {
		this.cprice = cprice;
	}

	public double getSprice() {
		return sprice;
	}

	public void setSprice(double sprice) {
		this.sprice = sprice;
	}

	public String getPescription() {
		return Pescription;
	}

	public void setPescription(String pescription) {
		Pescription = pescription;
	}

	public String getPdetail() {
		return Pdetail;
	}

	public void setPdetail(String pdetail) {
		Pdetail = pdetail;
	}

	public int getQantity() {
		return qantity;
	}

	public void setQantity(int qantity) {
		this.qantity = qantity;
	}

	public String getPimg1() {
		return Pimg1;
	}

	public void setPimg1(String pimg1) {
		Pimg1 = pimg1;
	}

	public String getPimg2() {
		return Pimg2;
	}

	public void setPimg2(String pimg2) {
		Pimg2 = pimg2;
	}

	public String getPimg3() {
		return Pimg3;
	}

	public void setPimg3(String pimg3) {
		Pimg3 = pimg3;
	}



	public String getManuf_no() {
		return manuf_no;
	}



	public void setManuf_no(String manuf_no) {
		this.manuf_no = manuf_no;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	

}

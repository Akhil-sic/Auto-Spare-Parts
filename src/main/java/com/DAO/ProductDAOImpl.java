package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Brand;
import com.entity.Products;
import com.entity.Vmodel;

public class ProductDAOImpl implements ProductDAO {
	private Connection conn;
	
	
	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean addBrand(Brand b) {
		boolean  f=false;
		try {
			String sql="insert into brand (bname,btype) values(?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBname());
			ps.setString(2, b.getBtype());
			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	


	@Override
	public boolean addVmodel(Vmodel vm) {
		boolean  f=false;
		try {
			String sql="insert into vmodel (b_id,vmname,year) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, vm.getB_id());
			ps.setString(2, vm.getVmname());
			ps.setString(3, vm.getVmyear());
			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public List<Brand> getBrand() {
		 List<Brand> list  = new ArrayList<>();
		try{
            String query = "select * from brand where Btype=?";
            PreparedStatement pst=conn.prepareStatement(query);
            String Btype=new String("OEM");
            pst.setString(1, Btype);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Brand b = new Brand();
                b.setBid(rs.getInt("Bid"));
                b.setBname(rs.getString("Bname"));
                list.add(b);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}
	


	public List<Brand> getBrandall() {
		 List<Brand> list  = new ArrayList<>();
			try{
	            String query = "select * from brand";
	            PreparedStatement pst=conn.prepareStatement(query);
	            ResultSet rs = pst.executeQuery();
	            while(rs.next()){
	                Brand b = new Brand();
	                b.setBid(rs.getInt("Bid"));
	                b.setBname(rs.getString("Bname"));
	                b.setBtype(rs.getString("Btype"));
	                list.add(b);
	            }
	        }catch(SQLException e){
	            e.printStackTrace();
	        }
	        return list;
	}
	
	


	public List<Vmodel> getVmodel(int BrandId) {
		List<Vmodel> list  = new ArrayList<>();
		try{
            String query = "select * from vmodel where b_id=?";
            PreparedStatement pst=conn.prepareStatement(query);
            pst.setInt(1, BrandId);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Vmodel vm = new Vmodel();
                vm.setVmid(rs.getInt("vmid"));
                vm.setB_id(rs.getInt("b_id")); 
                vm.setVmname(rs.getString("vmname"));
                list.add(vm);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}
	
	
	public List<Vmodel> getVmodelall() {
		List<Vmodel> list  = new ArrayList<>();
		try{
            String query = "select m.vmid, b.Bname, m.vmname, m.year from (vmodel as m inner join brand as b on m.b_id=b.Bid)";
            PreparedStatement pst=conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
            	Vmodel vm = new Vmodel();
                vm.setVmid(rs.getInt("vmid"));
                vm.setBname(rs.getString("Bname"));
                vm.setVmname(rs.getString("vmname"));
                vm.setVmyear(rs.getString("year"));
                list.add(vm);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}


	@Override
	public boolean addProducts(Products pro) {
		boolean  f=false;
		try {
			String sql="insert into products (Pname,manuf_no,b_id,vmid,cprice,sprice,Pdescription,Pdetail,quantity,Pimg1,Pimg2,Pimg3,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pro.getPname());
			ps.setString(2, pro.getManuf_no());
			ps.setInt(3, pro.getBr_id());
			ps.setInt(4, pro.getVm_id());
			ps.setDouble(5, pro.getCprice());
			ps.setDouble(6, pro.getSprice());
			ps.setString(7, pro.getPescription());
			ps.setString(8, pro.getPdetail());
			ps.setInt(9, pro.getQantity());
			ps.setString(10, pro.getPimg1());
			ps.setString(11, pro.getPimg2());
			ps.setString(12, pro.getPimg3());
			ps.setString(13, pro.getStatus());
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public List<Products> getProducts() {
		List<Products> list  = new ArrayList<>();
		try{
			String query = "select p.pid,p.Pname,p.manuf_no, b.Bname, m.vmname, m.year, p.cprice, p.sprice, p.quantity, p.Pimg1,p.status from (products as p inner join brand as b on p.b_id=b.Bid) inner join vmodel as m on p.vmid=m.vmid";
            PreparedStatement pst=conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
            	Products pro = new Products();
                pro.setPid(rs.getInt("pid"));
                pro.setPname(rs.getString("Pname"));
                pro.setManuf_no(rs.getString("manuf_no"));
                pro.setBname(rs.getString("Bname"));
                pro.setVmname(rs.getString("vmname"));
                pro.setVmyear(rs.getString("year"));
                pro.setCprice(rs.getDouble("cprice"));
                pro.setSprice(rs.getDouble("sprice"));
                pro.setQantity(rs.getInt("quantity"));
                pro.setPimg1(rs.getString("Pimg1"));
                pro.setStatus(rs.getString("status"));
                list.add(pro);
                
                System.out.println(list);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}



	public Products getProductsByid(int id) {
		Products pro  = null;
		try{
			String query = "select * from (products as p inner join brand as b on p.b_id=b.Bid) inner join vmodel as m on p.vmid=m.vmid where p.pid=?";
            PreparedStatement pst=conn.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
            	pro = new Products();
            	pro.setPid(rs.getInt("pid"));
            	pro.setBr_id(rs.getInt("b_id"));
            	pro.setVm_id(rs.getInt("vmid"));
                pro.setPname(rs.getString("Pname"));
                pro.setManuf_no(rs.getString("manuf_no"));
                pro.setBname(rs.getString("Bname"));
                pro.setVmname(rs.getString("vmname"));
                pro.setVmyear(rs.getString("year"));
                pro.setCprice(rs.getDouble("cprice"));
                pro.setSprice(rs.getDouble("sprice"));
                pro.setQantity(rs.getInt("quantity"));
                pro.setPescription(rs.getString("Pdescription"));
                pro.setPdetail(rs.getString("Pdetail"));
                pro.setStatus(rs.getString("status"));
                pro.setPimg1(rs.getString("Pimg1"));
                pro.setPimg2(rs.getString("Pimg2"));
                pro.setPimg3(rs.getString("Pimg3"));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return pro;
	}



	public boolean updateProducts(Products pro) {
		boolean f=false;
		try {
			String sql="update products set Pname=?, b_id=?, vmid=?, cprice=?, sprice=?, Pdescription=?, Pdetail=?, quantity=?,manuf_no=?,status=? where pid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pro.getPname());
			ps.setInt(2, pro.getBr_id());
			ps.setInt(3, pro.getVm_id());
			ps.setDouble(4, pro.getCprice());
			ps.setDouble(5, pro.getSprice());
			ps.setString(6, pro.getPescription());
			ps.setString(7, pro.getPdetail());
			ps.setInt(8, pro.getQantity());
			ps.setString(9, pro.getManuf_no());
			ps.setString(10, pro.getStatus());
			ps.setInt(11, pro.getPid());

			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public List<Products> UsergetProducts() {
		List<Products> list  = new ArrayList<>();
		try{
			String query = "select p.pid, p.Pname, b.Bname, p.Pimg1, p.status,p.cprice, p.sprice from (products as p inner join brand as b on p.b_id=b.Bid) where p.status=?";
            PreparedStatement pst=conn.prepareStatement(query);
            pst.setString(1, "Available");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
            	Products pro = new Products();
                pro.setPid(rs.getInt("pid"));
                pro.setPname(rs.getString("Pname"));
                pro.setBname(rs.getString("Bname"));
                pro.setPimg1(rs.getString("Pimg1"));
                pro.setStatus(rs.getString("status"));
                pro.setCprice(rs.getDouble("cprice"));
                pro.setSprice(rs.getDouble("sprice"));
                list.add(pro);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}
	
	
	
	
	
}

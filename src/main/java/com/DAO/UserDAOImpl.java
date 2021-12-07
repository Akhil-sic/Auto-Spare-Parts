package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Products;
import com.entity.Req_productentity;
import com.entity.User;


public class UserDAOImpl implements UserDAO{
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f = false;
		try {
			
			String sql="insert into user (name, email,phno,gender,password,usertype) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getGender());
			ps.setString(5, us.getPassword());
			ps.setString(6, us.getUsertype());
			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User login(String email, String password) {
		User us=null;
		
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setGender(rs.getString(5));
				us.setPassword(rs.getString(6));
				us.setUsertype(rs.getString(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return us;
		
	}


	public boolean add_reqProducts(Req_productentity pro) {
		boolean  f=false;
		try {
			String sql="insert into req_products (uid, p_name, brand, model, year, pro_desc, status, qty) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pro.getUid());
			ps.setString(2, pro.getPname());
			ps.setString(3,pro.getBrand());
			ps.setString(4, pro.getModel());
			ps.setString(5, pro.getYear());
			ps.setString(6, pro.getPdesc());
			ps.setString(7, pro.getStatus());
			ps.setInt(8, pro.getQantity());
			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Req_productentity> get_reqProducts() {
		List<Req_productentity> list  = new ArrayList<>();
		try{
			String query = "select p.req_id, p.uid, p.p_name, p.brand, p.model, p.year, p.status, p.qty, u.name from (req_products as p inner join user as u on p.uid=u.id) order BY p.req_id ASC";
            PreparedStatement pst=conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
            	Req_productentity pro = new Req_productentity();
                pro.setReqid(rs.getInt("req_id"));
                pro.setName(rs.getString("name"));
                pro.setPname(rs.getString("p_name"));
                pro.setBrand(rs.getString("brand"));
                pro.setModel(rs.getString("model"));
                pro.setYear(rs.getString("year"));
                pro.setStatus(rs.getString("status"));
                pro.setQantity(rs.getInt("qty"));
                list.add(pro);
                
                System.out.println(list);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}


	public List<User> get_users() {
		List<User> list  = new ArrayList<>();
		try{
			String query = "select * from user";
            PreparedStatement pst=conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
            	User u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPhno(rs.getString(4));
                u.setGender(rs.getString(5));
                u.setPassword(rs.getString(6));
                u.setUsertype(rs.getString(7));
                
                list.add(u);
                
                System.out.println(list);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}
	


}

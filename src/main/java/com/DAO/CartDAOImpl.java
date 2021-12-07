package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.Vmodel;

public class CartDAOImpl implements CartDAO {
	private Connection conn;
	public Double u_tprice=0.0;
	

	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public Double uprice() {
		return u_tprice;
	}
	
	public boolean addtoCart(Cart c) {
		boolean f = false;
		try {
			String sql="insert into cart_tbl (pid, uid, p_name, p_brand, price, qty) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getP_name());
			ps.setString(4, c.getP_brand());
			ps.setDouble(5, c.getPrice());
			ps.setInt(6, c.getQty());
			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public boolean updateCart(Cart c) {
		boolean f=false;
		try {
			String sql="update cart_tbl set qty=? where pid=? and uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getQty());
			ps.setInt(2, c.getPid());
			ps.setInt(3, c.getUid());

			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public List<Cart> getCart(int uid) {
		List<Cart> list  = new ArrayList<>();
		try{
            String query = "select * from cart_tbl where uid=?";
            PreparedStatement pst=conn.prepareStatement(query);
            pst.setInt(1, uid);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
            	Cart c = new Cart();
                c.setCid(rs.getInt("cid"));
                c.setPid(rs.getInt("pid"));
                c.setP_name(rs.getString("p_name"));
                c.setP_brand(rs.getString("p_brand")); 
                c.setPrice(rs.getDouble("price"));
                c.setTot_price(rs.getDouble("tot_price"));
                c.setQty(rs.getInt("qty"));
                list.add(c);
            }
   
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}


	public boolean delCart(int pid, int uid) {
		boolean f = false;
		try {
			String sql="delete from cart_tbl where pid=? and uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public boolean delCart(int uid) {
		boolean f = false;
		try {
			String sql="delete from cart_tbl where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	

}

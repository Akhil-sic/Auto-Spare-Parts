package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Orders;
import com.entity.Products;

public class OrderDAOImpl implements OrderDAO {
	private Connection conn;
	
	public OrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean saveOrder(List<Orders> olist) {
		boolean  f=false;
		try {
			String sql = "insert into order_tbl (order_id,u_name,u_email,address,phno,p_name,b_name,price,pay_status,pay_type,qty) values(?,?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(Orders o :olist) {
				ps.setString(1, o.getOrder_id());
				ps.setString(2, o.getU_name());
				ps.setString(3, o.getU_email());
				ps.setString(4, o.getAddress());
				ps.setString(5, o.getPhno());
				ps.setString(6, o.getP_name());
				ps.setString(7, o.getB_name());
				ps.setDouble(8, o.getPrice());
				ps.setString(9, o.getPay_status());
				ps.setString(10, o.getPay_type());
				ps.setInt(11, o.getQty());
				ps.addBatch();
				
				
			}
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
//			conn.setAutoCommit(true);
			
			int i=ps.executeUpdate();
			if (i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public List<Orders> getOrders() {
		List<Orders> list  = new ArrayList<>();
		try{
			String query = "select * from order_tbl";
            PreparedStatement pst=conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
            	Orders o = new Orders();
            	o.setO_id(rs.getInt("o_id"));
            	o.setOrder_id(rs.getString("order_id"));
            	o.setU_name(rs.getString("u_name"));
            	o.setU_email(rs.getString("u_email"));
            	o.setP_name(rs.getString("p_name"));
            	o.setQty(rs.getInt("qty"));
            	o.setPay_type(rs.getString("pay_type"));
            	o.setPay_status(rs.getString("pay_status"));
            	o.setPrice(rs.getDouble("price"));
                list.add(o);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
	}
	

}

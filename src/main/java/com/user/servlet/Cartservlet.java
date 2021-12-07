package com.user.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Products;
import com.sun.jdi.connect.spi.Connection;

/**
 * Servlet implementation class Cartservlet
 */
public class Cartservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Cartservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean f=false;
		try {
			int pid=Integer.parseInt(request.getParameter("pid"));
			int uid=Integer.parseInt(request.getParameter("uid"));
			int qty=1;
			
			ProductDAOImpl pdao = new ProductDAOImpl(DBConnect.getConn());
			Products p=pdao.getProductsByid(pid);
			Cart c=new Cart();
			
			
			
			HttpSession session=request.getSession();
			CartDAOImpl cdao = new CartDAOImpl(DBConnect.getConn());
			java.sql.Connection conn=DBConnect.getConn();
			String sql="select * from cart_tbl where pid=? and uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			ResultSet rs = ps.executeQuery();
			System.out.println(rs);
			
			if(rs.next()) {
					c.setPid(rs.getInt("pid"));
					c.setUid(rs.getInt("uid"));
					c.setQty(rs.getInt("qty")+qty);
				f=cdao.updateCart(c);
			}
			else {	
				c.setPid(pid);
				c.setUid(uid);
				c.setP_name(p.getPname());
				c.setP_brand(p.getBname());
				c.setPrice(p.getSprice());
				c.setQty(qty);
			f=cdao.addtoCart(c);
			}
			
			if (f) {

				session.setAttribute("addcart","Product Added to cart");
				response.sendRedirect("home.jsp");
			}
			else {
				session.setAttribute("failed","Unable to Add to Cart");
				response.sendRedirect("home.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}

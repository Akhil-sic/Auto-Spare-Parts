package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Orders;

/**
 * Servlet implementation class Orderservlet
 */
public class Orderservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Orderservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int uid=Integer.parseInt(request.getParameter("usid"));
			String uname=request.getParameter("uname");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String adrs=request.getParameter("adrs");
			String paymode=request.getParameter("paymode");
			
			
			
			HttpSession session=request.getSession();
			CartDAOImpl cdao = new CartDAOImpl(DBConnect.getConn());
			
			List<Cart> list = cdao.getCart(uid);
			if (list.isEmpty()) {
				session.setAttribute("dcfailed","Add Item to Cart");
				response.sendRedirect("ot_cart.jsp");
				
			} else {
				OrderDAOImpl dao2 = new OrderDAOImpl(DBConnect.getConn());
				ArrayList<Orders> orderlist=new ArrayList<Orders>();
				Random r=new Random();
				for(Cart c:list) {
					Orders o=new Orders();
					o.setOrder_id("PART-ORD-"+r.nextInt(1000));
					o.setU_name(uname);
					o.setU_email(email);
					o.setPhno(phno);
					o.setAddress(adrs);
					o.setPay_type(paymode);
					o.setPay_status("Not-Paid");
					o.setP_name(c.getP_name());
					o.setB_name(c.getP_brand());
					o.setPrice(c.getPrice());
					o.setQty(c.getQty());
					
					orderlist.add(o);
					
				}
				
				if("noselect".equals(paymode)) {
					response.sendRedirect("ot_cart.jsp");
				
				}
				else {
					System.out.println(orderlist);
					boolean f=dao2.saveOrder(orderlist);
					if (f) {
						cdao.delCart(uid);
						session.setAttribute("delcart","Order is Placed!!");
						response.sendRedirect("ot_cart.jsp");
					} else {
						session.setAttribute("dcfailed","Unable to Place Order");
						response.sendRedirect("ot_cart.jsp");
					}
			}
			
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

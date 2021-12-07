package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

/**
 * Servlet implementation class Delcartservlet
 */
public class Delcartservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delcartservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int uid=Integer.parseInt(request.getParameter("uid"));
			int pid=Integer.parseInt(request.getParameter("pid"));
			
			HttpSession session=request.getSession();
			CartDAOImpl cdao = new CartDAOImpl(DBConnect.getConn());
			
			boolean f=cdao.delCart(pid, uid);
			if (f) {

				session.setAttribute("delcart","Removed from cart");
				response.sendRedirect("ot_cart.jsp");
			}
			else {
				session.setAttribute("dcfailed","Unable to Removed from Cart");
				response.sendRedirect("ot_cart.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}

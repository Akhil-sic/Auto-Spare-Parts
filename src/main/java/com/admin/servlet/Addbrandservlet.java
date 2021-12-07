package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Brand;

/**
 * Servlet implementation class Addbrandservlet
 */
@WebServlet("/Addbrand")
public class Addbrandservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addbrandservlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String Bname=request.getParameter("brandname");
			String Btype=request.getParameter("brandtype");
			
			Brand b=new Brand(Bname,Btype);
//			System.out.println(b);
			HttpSession session=request.getSession();
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			boolean f=dao.addBrand(b);
			if (f) {

				session.setAttribute("succMsg","Brand Added");
				response.sendRedirect("admin/add_brand.jsp");
			}
			else {

				session.setAttribute("failedMsg","Unable to add");
				response.sendRedirect("admin/add_brand.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

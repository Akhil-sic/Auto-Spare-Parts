package com.user.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProductDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Products;
import com.entity.Req_productentity;

/**
 * Servlet implementation class Req_product
 */
public class Req_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Req_product() {
        super();
        // TODO Auto-generated constructor stub
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
			
			String Pname=request.getParameter("Pname");
			int uid=Integer.parseInt(request.getParameter("uid"));
			String brand=request.getParameter("brand");
			String model=request.getParameter("model");
			String year=request.getParameter("year");
			String Pdec=request.getParameter("Pdec");
			int qty=Integer.parseInt(request.getParameter("qty"));
			
			Req_productentity pro=new Req_productentity();
			pro.setPname(Pname);
			pro.setUid(uid);
			pro.setBrand(brand);
			pro.setModel(model);
			pro.setYear(year);
			pro.setPdesc(Pdec);
			pro.setQantity(qty);
			
			pro.setStatus("NO ACTION");
			
			System.out.println(pro);
			
			HttpSession session=request.getSession();
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			
			boolean f=dao.add_reqProducts(pro);
			if (f) {
				
				session.setAttribute("succMsg","Request Added");
				response.sendRedirect("req_product.jsp");
			}
			else {

				session.setAttribute("failedMsg","Unable to add request");
				response.sendRedirect("req_product.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

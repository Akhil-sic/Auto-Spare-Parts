package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Brand;
import com.entity.Vmodel;

/**
 * Servlet implementation class Addvmodelservlet
 */
//@WebServlet("/Addvmodel")
public class Addvmodelservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addvmodelservlet() {
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
			String vmname=request.getParameter("Modelname");
			int b_id=Integer.parseInt(request.getParameter("Brandname"));
			String vmyear=request.getParameter("Modelyear");
			Vmodel vm=new Vmodel();
			vm.setB_id(b_id);
			vm.setVmname(vmname);
			vm.setVmyear(vmyear);
//			System.out.println(b);
			HttpSession session=request.getSession();
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			boolean f=dao.addVmodel(vm);
			System.out.println(vm);
			if (f) {

				session.setAttribute("succMsg","Model Added");
				response.sendRedirect("admin/add_vmodel.jsp");
			}
			else {

				session.setAttribute("failedMsg","Unable to add");
				response.sendRedirect("admin/add_vmodel.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

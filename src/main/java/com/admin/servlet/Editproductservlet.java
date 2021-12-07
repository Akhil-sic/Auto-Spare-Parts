package com.admin.servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Products;

/**
 * Servlet implementation class Editproductservlet
 */
public class Editproductservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Editproductservlet() {
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
			int id=Integer.parseInt(request.getParameter("Pid"));
			String Pname=request.getParameter("Pname");
			String manuf_no=request.getParameter("manuf_no");
			int br_id=Integer.parseInt(request.getParameter("Bname"));
			int vm_id=Integer.parseInt(request.getParameter("VMname"));
			double cprice =Double.parseDouble(request.getParameter("cprice"));
			double sprice=Double.parseDouble(request.getParameter("sprice"));
			String Pdec=request.getParameter("Pdec");
			String Pdetail=request.getParameter("Pdetail");
			int qty=Integer.parseInt(request.getParameter("qty"));
			String status=request.getParameter("status");
			
			System.out.println("ID:"+br_id+" quan "+ vm_id);
			
			Products pro=new Products();
			pro.setPid(id);
			pro.setPname(Pname);
			pro.setManuf_no(manuf_no);
			pro.setBr_id(br_id);
			pro.setVm_id(vm_id);
			pro.setCprice(cprice);
			pro.setSprice(sprice);
			pro.setPescription(Pdec);
			pro.setPdetail(Pdetail);
			pro.setQantity(qty);
			pro.setStatus(status);
			
			
			
			
			HttpSession session=request.getSession();
			ProductDAOImpl pdao = new ProductDAOImpl(DBConnect.getConn());
			
			boolean f=pdao.updateProducts(pro);
			if (f) {
				
				
				session.setAttribute("succMsg","Product Updated");
				response.sendRedirect("admin/dis_products.jsp");
			}
			else {

				session.setAttribute("failedMsg","Unable to Update");
				response.sendRedirect("admin/dis_products.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

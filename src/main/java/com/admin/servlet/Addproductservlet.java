package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Products;

/**
 * Servlet implementation class Addproductservlet
 */
@MultipartConfig
public class Addproductservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addproductservlet() {
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
			String manuf_no=request.getParameter("manuf_no");
			int br_id=Integer.parseInt(request.getParameter("Bname"));
			int vm_id=Integer.parseInt(request.getParameter("VMname"));
			double cprice =Double.parseDouble(request.getParameter("cprice"));
			double sprice=Double.parseDouble(request.getParameter("sprice"));
			String Pdec=request.getParameter("Pdec");
			String Pdetail=request.getParameter("Pdetail");
			int qty=Integer.parseInt(request.getParameter("qty"));
			Part part1=request.getPart("Pimg1");
			String Pimg1=part1.getSubmittedFileName();
			Part part2=request.getPart("Pimg2");
			String Pimg2=part2.getSubmittedFileName();
			Part part3=request.getPart("Pimg3");
			String Pimg3=part3.getSubmittedFileName();
			String status=request.getParameter("status");
			
			Products pro=new Products();
			pro.setPname(Pname);
			pro.setManuf_no(manuf_no);
			pro.setBr_id(br_id);
			pro.setVm_id(vm_id);
			pro.setCprice(cprice);
			pro.setSprice(sprice);
			pro.setPescription(Pdec);
			pro.setPdetail(Pdetail);
			pro.setQantity(qty);
			pro.setPimg1(Pimg1);
			pro.setPimg2(Pimg2);
			pro.setPimg3(Pimg3);
			pro.setStatus(status);
			
			System.out.println(pro);
			System.out.println(Pimg1);
			
			HttpSession session=request.getSession();
			ProductDAOImpl pdao = new ProductDAOImpl(DBConnect.getConn());
			
			boolean f=pdao.addProducts(pro);
			if (f) {
				if(Pimg1!=null || Pimg1!="") {
				String path=getServletContext().getRealPath("")+"images";
				System.out.println(path);
				File file=new File(path);
				
				part1.write(path + File.separator + Pimg1);
				part2.write(path + File.separator + Pimg2);
				part3.write(path + File.separator + Pimg3);
				}
				session.setAttribute("succMsg","Product Added");
				response.sendRedirect("admin/Add_products.jsp");
			}
			else {

				session.setAttribute("failedMsg","Unable to add");
				response.sendRedirect("admin/Add_products.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Brand;
import com.entity.Vmodel;
import com.google.gson.Gson;

/**
 * Servlet implementation class GetbrandnDetails
 */
@WebServlet("/getbrandnDetails")
public class GetbrandnDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetbrandnDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			ProductDAOImpl pdao = new ProductDAOImpl(DBConnect.getConn());
            
            String op = request.getParameter("operation");
            
            if (op.equals("brand")) {
                List<Brand> blist = pdao.getBrandall();
                Gson json = new Gson();
                String brandList = json.toJson(blist);
//                System.out.println("brand list"+brandList);
                response.setContentType("text/html");
                response.getWriter().write(brandList);
            }

            if (op.equals("vmodel")) {
                int id = Integer.parseInt(request.getParameter("id"));
                List<Vmodel> vlist = pdao.getVmodel(id);
                Gson json = new Gson();
                String vmodelList = json.toJson(vlist);
                response.setContentType("text/html");
                response.getWriter().write(vmodelList);
            }
//
//            if (op.equals("city")) {
//                int id = Integer.parseInt(request.getParameter("id"));
//                List<City> citylist = csd.getCityByStateId(id);
//                Gson json = new Gson();
//                String countryList = json.toJson(citylist);
//                response.setContentType("text/html");
//                response.getWriter().write(countryList);
//            }
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}

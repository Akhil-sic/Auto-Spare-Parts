package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			HttpSession session =request.getSession();
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			User us=dao.login(email, password);
			
			if (us!=null) {
				session .setAttribute("userobj", us);
				session.setAttribute("usertype", us.getUsertype());
				String usertype=(String) session.getAttribute("usertype");
				String ut =  new String("User");
//				System.out.println(usertype);
				if (usertype.equals(ut)) {
					response.sendRedirect("home.jsp");
					
					
				} else {
					response.sendRedirect("admin/home.jsp");

				}
	
				
			} else {
				session .setAttribute("failedMsg", "Invalid Email or Password");
				response.sendRedirect("Login.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

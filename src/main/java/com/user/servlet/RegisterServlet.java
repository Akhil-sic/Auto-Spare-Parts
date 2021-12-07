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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
//    public RegisterServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String name=request.getParameter("fname"); 
			String email=request.getParameter("email"); 
			String phone=request.getParameter("phone");  
			String gender=request.getParameter("gender");
			String password=request.getParameter("password");
			String conpass=request.getParameter("confirmpassword");
			
			

			HttpSession session=request.getSession();
			//System.out.println(name+" "+email+" "+gender);
			
			User us= new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phone);
			us.setGender(gender);
			us.setPassword(password);
			us.setUsertype("User");
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			if (password.equals(conpass)) {
				boolean f = dao.userRegister(us);
				if (f) {
//					System.out.println("success");
					session.setAttribute("succMsg","Regisration Successfull");
					response.sendRedirect("Register.jsp");
				}
				else {
//					System.out.println("noooooo");
					session.setAttribute("failedMsg","Regisration not successfull");
					response.sendRedirect("Register.jsp");
				}
				
			} else {
				session.setAttribute("failedMsg","Re-enter Password");
				response.sendRedirect("Register.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

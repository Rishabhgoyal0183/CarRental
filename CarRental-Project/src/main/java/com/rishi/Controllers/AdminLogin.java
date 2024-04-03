package com.rishi.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rishi.Modals.DAO;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			DAO db=new DAO();
			String name=db.adminLogin(id, password);
			db.closeConnection();
			HttpSession session= request.getSession();
			if(name!=null) {
				session.setAttribute("name", name);
				response.sendRedirect("AdminHome.jsp");
			}else {
				session.setAttribute("msg", "Invalid Details! Please Login Again.");
				response.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("ExceptionPage.jsp");
			e.printStackTrace();
		}
	}
}

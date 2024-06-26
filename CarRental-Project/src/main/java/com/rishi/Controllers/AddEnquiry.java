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
@WebServlet("/AddEnquiry")
public class AddEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			DAO db=new DAO();
			db.addEnquiry(name, phone);
			db.closeConnection();
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Thanks for Contacting us! We will contact you soon.");
			response.sendRedirect("index.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("ExceptionPage.jsp");
			e.printStackTrace();
		}
	}
}

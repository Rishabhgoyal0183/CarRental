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
@WebServlet("/ViewIDProof")
public class ViewIDProof extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String email=request.getParameter("email");
			DAO db=new DAO();
			byte IDProof[]=db.getIDProof(email);
			db.closeConnection();
			response.getOutputStream().write(IDProof);		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("ExceptionPage.jsp");
			e.printStackTrace();
		}
	}
}

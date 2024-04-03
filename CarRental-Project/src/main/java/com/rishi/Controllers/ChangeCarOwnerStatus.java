package com.rishi.Controllers;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.naming.factory.SendMailFactory;

import com.rishi.Modals.DAO;
import com.rishi.Modals.SendMail;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/ChangeCarOwnerStatus")
public class ChangeCarOwnerStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String email = request.getParameter("email");
			String status = request.getParameter("status");
			DAO db= new DAO();
			db.changeCarOwnerStatus(email , status);
			db.closeConnection();
		 HttpSession session = request.getSession();
		 session.setAttribute("msg", " Car owner is Accepted" );
		 
			 response.sendRedirect("AdminHome.jsp");
			 
	// send mail code
			
			if(status.equalsIgnoreCase("Accepted")) {
				SendMail.sendMail(email,"Congrats, You have been Accepted!", "Registration Accepted, You can login now!");
			}else {
				SendMail.sendMail(email,"Sorry Car owner, You have been Rejected!", "Registration Rejected, You can apply for registration again sir!");
			}
			
		
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("ExceptionPage.jsp");
			e.printStackTrace();
		}
	}
}

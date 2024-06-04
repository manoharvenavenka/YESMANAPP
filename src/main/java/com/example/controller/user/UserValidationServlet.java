package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.UserMod;
import com.example.model.WorkerMod;

import dbutil.Cryptography;

/**
 * Servlet implementation class UserValidationServlet
 */
public class UserValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserValidationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/hmtl");
		PrintWriter pw = response.getWriter();

		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");

		System.out.println("mobile=" + fullName);
		System.out.println("pwd=" + password);

		String fullNameEncode = Cryptography.encode(fullName);
		String passwordEncode = Cryptography.encode(password);

		System.out.println("mobile encode=" + fullNameEncode);
		System.out.println("pwd encode=" + passwordEncode);

		
		UserMod user = new UserMod();
		user.setFullName(fullNameEncode);
		user.setPassword(passwordEncode);
		
		boolean flag = user.UserLoginValidate();
		if (flag == true) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getUserId());
			// session.setAttribute("fullName", workers.getFullName());
			/// session.setAttribute("customerMailId", customer.getEmailId());
			response.sendRedirect("User/UserHomePage.jsp?res=" + flag);

		} else {
			response.sendRedirect("WorkerHome.jsp?res=0");
			// pw.println("<h4>Invalid usename/password</h4>");
		}
	}
}

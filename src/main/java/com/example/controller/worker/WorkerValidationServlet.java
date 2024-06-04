package com.example.controller.worker;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.WorkerMod;

import dbutil.Cryptography;

/**
 * Servlet implementation class WorkerValidationServlet
 */
public class WorkerValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkerValidationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/hmtl");
		PrintWriter pw= response.getWriter();
	 
		String mobile= request.getParameter("mobile");
		String password=request.getParameter("password");
		
		System.out.println("mobile="+mobile);
		System.out.println("pwd="+password);
		
		String mobileEncode=Cryptography.encode(mobile);
		String passwordEncode=Cryptography.encode(password);
		
		System.out.println("mobile encode="+mobileEncode);
		System.out.println("pwd encode="+passwordEncode);
		
		
		WorkerMod workers = new WorkerMod();
		
		workers.setMobile(mobileEncode);
		workers.setPassword(passwordEncode);
		
		
		boolean flag=workers.WorkerLoginValidate();
		if(flag==true)
		{
			HttpSession session=request.getSession();
        	session.setAttribute("workerId",workers.getWorkerId());
        	//session.setAttribute("fullName", workers.getFullName());
        	///session.setAttribute("customerMailId", customer.getEmailId());
			response.sendRedirect("Worker/WorkerHomePage.jsp?res="+flag);
			
		}
		else
		{
			response.sendRedirect("WorkerHome.jsp?res=0");
			//pw.println("<h4>Invalid usename/password</h4>");
		}
	}
}

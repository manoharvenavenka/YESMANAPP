package com.example.controller.worker;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.WorkerMod;

import dbutil.Cryptography;

/**
 * Servlet implementation class UpdateWorkerDet
 */
public class UpdateWorkerDet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerDet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		 int workerId = Integer.parseInt(request.getParameter("workerId"));
	        String fullName = request.getParameter("fullName");
	        String registrationDate = request.getParameter("registrationDate");
	        String serviceName = request.getParameter("serviceName");
	        String mobile = request.getParameter("mobile");
	        String currentAddress = request.getParameter("currentAddress");
	        String city = request.getParameter("cities");
	        String password = request.getParameter("password");
	        String fullNameEncode=Cryptography.encode(mobile);
			System.out.println("Mobile encode="+fullNameEncode);
			
			String passwordEncode=Cryptography.encode(password);
			System.out.println("Password encode="+passwordEncode);
	        // Update worker details
	        WorkerMod worker = new WorkerMod();
	        worker.setWorkerId(workerId);
	        worker.setFullName(fullName);
	        worker.setRegistrationDate(registrationDate);
	        worker.setServiceName(serviceName);
	        worker.setMobile(fullNameEncode);
	        worker.setCurrentAddress(currentAddress);
	        worker.setCities(city);
	        worker.setPassword(passwordEncode);
	        
	        int n= worker.updateWorker();
			
			
			response.sendRedirect("User/UserHomePage.jsp?res=" + n);
	}

}

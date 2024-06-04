package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


import com.example.model.ServicesMod;

/**
 * Servlet implementation class UpdateServicesServlet
 */
public class UpdateServicesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServicesServlet() {
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
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//reading parameters from html page
		String serviceName = request.getParameter("serviceName");
		String serviceId = request.getParameter("serviceId");

		System.out.println("serviceName="+serviceName);
		//taking module parameters
		ServicesMod service = new ServicesMod();
		//taking variables
		service.setServiceName(serviceName);
		service.setServiceId(Integer.parseInt(serviceId));
		
		//taking the method
	int n=	service.UpdateByserviceId();
	System.out.println("boom="+n);
	/*if(n==0) {//record added
		   response.sendRedirect("Category/ViewCat.jsp?res=0");//?res=1 for added record for displaying the msg 
		                                                            //that displaying on add category.jsp
	   }else {//record not added
		   response.sendRedirect("Category/ViewCat.jsp?res=1");
	   }*/
	   response.sendRedirect("Admin/ViewServices.jsp?res="+n);
	   pw.close();
	}

}

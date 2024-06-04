package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


import com.example.model.ServicesMod;

/**
 * Servlet implementation class DeleteServiceServlet
 */
public class DeleteServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String serviceId = request.getParameter("serviceId");
		System.out.println("fffff"+serviceId);
		ServicesMod service = new ServicesMod();
		System.out.println("bhvvv"+service);
		service.setServiceId(Integer.parseInt(serviceId));
		
		//method calling in productmodel !!!
		boolean flag=service.deleteProductByServiceId();
		System.out.println("flag="+flag);
		int n = 0 ;
		if(flag) {
		 n=1;
			response.sendRedirect("/YesManApp/Admin/ViewServices.jsp");
		}else { 
			n=0;
		
			
		}
		
	}

	
}

package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


import com.example.model.WorkerMod;

/**
 * Servlet implementation class UpdateWorkerStatusServlet
 */
public class UpdateWorkerStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
//reading parameters from html page
		
		String workerId = request.getParameter("workerId");
		String status = request.getParameter("status");
		System.out.println("orderId="+workerId);
		System.out.println("orderStatus="+status);
		 WorkerMod corders =new WorkerMod();
	        
		 int n = corders.workerStatusUpdate(Integer.parseInt(workerId), status);
			
			int m=Integer.parseInt(request.getParameter("n"));
			if(m==1) { //Admin
				response.sendRedirect("/YesManApp/Admin/ViewWorkers.jsp?res="+ n);
			}else if(m==2) {
				response.sendRedirect("res="+n);
			}

	}
}

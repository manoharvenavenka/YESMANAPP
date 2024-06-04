package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.BookingMod;
import com.example.model.WorkerMod;

/**
 * Servlet implementation class UpdateBookingStatusServlet
 */
public class UpdateBookingStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBookingStatusServlet() {
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
		
		String bookingId = request.getParameter("bookingId");
		String status = request.getParameter("status");
		System.out.println("orderId="+bookingId);
		System.out.println("orderStatus="+status);
		 BookingMod book =new BookingMod();
	        
		 int n = book.bookingStatusUpdate (Integer.parseInt(bookingId), status);
				 
				 
			
			int m=Integer.parseInt(request.getParameter("n"));
			if(m==1) { //user
				response.sendRedirect("User/ViewBookings.jsp?res="+ n);
			}else if(m==2) {//worker
				response.sendRedirect("/YesManApp/Worker/WorkerBookings.jsp?res="+n);
			}

	}
}


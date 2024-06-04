package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import com.example.model.BookingMod;

/**
 * Servlet implementation class AddBookingsServlet
 */
public class AddBookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBookingsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/hmtl");
		PrintWriter pw = response.getWriter();
		Calendar c = Calendar.getInstance();
		String today = c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/" + c.get(Calendar.DAY_OF_MONTH);

		String workerId = request.getParameter("workerId");

		String serviceName = request.getParameter("serviceName");

		String workerLatitude = request.getParameter("workerLatitude");
		String workerLongitude = request.getParameter("workerLongitude");
		String status = "Confirmed";
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		System.out.println("today=" + today);
		System.out.println("workerId:" + workerId);
		System.out.println("serviceName=" + serviceName);
		System.out.println("workerLatitude=" + workerLatitude);
		System.out.println("workerLongitude" + workerLongitude);
		System.out.println("status" + status);
		System.out.println("userId=" + userId);
		System.out.println();
		BookingMod Book = new BookingMod();
		Book.setBookingDate(today);
		Book.setUserId(userId);
		Book.setWorkerId(Integer.parseInt(workerId));
		Book.setServiceName(serviceName);
		Book.setWorkerLatitude(workerLatitude);
		Book.setWorkerLongitude(workerLongitude);
		Book.setStatus(status);
		int n = Book.addBookings();
		response.sendRedirect("User/UserHomePage.jsp?res=" + n);

	}

}
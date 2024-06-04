package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import com.example.model.BookingMod;
import com.example.model.ReviewsMod;

/**
 * Servlet implementation class AddReviewServlet
 */
public class AddReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReviewServlet() {
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
		response.setContentType("text/hmtl");
		PrintWriter pw = response.getWriter();
		Calendar c = Calendar.getInstance();
		String today = c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/" + c.get(Calendar.DAY_OF_MONTH);
HttpSession session =request.getSession();
int userId = (int) session.getAttribute("userId");
String workerId = request.getParameter("workerId");

String serviceName = request.getParameter("serviceName");
String rating =request.getParameter("rating");
String comments =request.getParameter("comments");

//System.out.println("today="+today);
//System.out.println("workerId:"+workerId);
//System.out.println("serviceName="+serviceName);
//System.out.println("userId="+userId);
//System.out.println("rating="+rating);
//System.out.println("comments="+comments);
ReviewsMod rev = new ReviewsMod();
rev.setReviewDate(today);
rev.setUserId(userId);
rev.setWorkerId(Integer.parseInt(workerId));
rev.setServiceName(serviceName);
rev.setComments(comments);
rev.setRating(Integer.parseInt(rating));
int n = rev.addReviews();
response.sendRedirect("User/ViewBookings.jsp?res=" + n);

}


	}



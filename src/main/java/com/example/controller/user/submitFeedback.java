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

import com.example.model.FeedbackMod;

/**
 * Servlet implementation class submitFeedback
 */
public class submitFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitFeedback() {
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
		response.setContentType("text/hmtl");
		PrintWriter pw = response.getWriter();
		Calendar c = Calendar.getInstance();
		String today = c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/" + c.get(Calendar.DAY_OF_MONTH);
		String websiteService = request.getParameter("websiteService");
		String feedbackMessage = request.getParameter("feedbackMessage");
		
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		System.out.println("userId="+userId);
		
		System.out.println("feedbackMessage="+feedbackMessage);
		System.out.println(websiteService);
		System.out.println(today);
		FeedbackMod feed= new FeedbackMod();
		feed.setFeedBackDate(today);
		feed.setUserId(userId);
		feed.setWebsiteService(websiteService);
		feed.setFeedbackMessage(feedbackMessage);
		int n = feed.addingFeedBack();
		response.sendRedirect("User/UserHomePage.jsp?res=" + n);
	}

}

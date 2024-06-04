package com.example.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.ReviewsMod;

/**
 * Servlet implementation class DeleteReviewServlet
 */
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String reviewId = request.getParameter("reviewId");
		System.out.println("fffff"+reviewId);
		ReviewsMod rev = new ReviewsMod();
		
		rev.setReviewId(Integer.parseInt(reviewId));
		
		//method calling in productmodel !!!
		boolean flag=rev.deleteReviewById();
		System.out.println("flag="+flag);
		int n = 0 ;
		if(flag) {
		 n=1;
			response.sendRedirect("/YesManApp/User/ViewReviews.jsp?res="+n);
		}else { 
			n=0;
		
			
		}
		
	}

}

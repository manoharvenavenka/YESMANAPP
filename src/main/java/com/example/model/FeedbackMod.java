package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class FeedbackMod implements Serializable {

	private int feedbackId;
	private int userId;
	private String feedBackDate;
	private String websiteService;
	private String feedbackMessage;

	public FeedbackMod() {
		super();
	}

	public FeedbackMod(int feedbackId, int userId, String feedBackDate, String websiteService, String feedbackMessage) {
		super();
		this.feedbackId = feedbackId;
		this.userId = userId;
		this.feedBackDate = feedBackDate;
		this.websiteService = websiteService;
		this.feedbackMessage = feedbackMessage;
	}

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFeedBackDate() {
		return feedBackDate;
	}

	public void setFeedBackDate(String feedBackDate) {
		this.feedBackDate = feedBackDate;
	}

	public String getWebsiteService() {
		return websiteService;
	}

	public void setWebsiteService(String websiteService) {
		this.websiteService = websiteService;
	}

	public String getFeedbackMessage() {
		return feedbackMessage;
	}

	public void setFeedbackMessage(String feedbackMessage) {
		this.feedbackMessage = feedbackMessage;
	}

	public int addingFeedBack() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into feedbacks(userId,feedBackDate,websiteService,feedbackMessage) values(?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.userId);
			pst.setString(2, this.feedBackDate);
			pst.setString(3, this.websiteService);
			pst.setString(4, this.feedbackMessage);

			n = pst.executeUpdate();
			System.out.println("pst" + pst.toString());
		} catch (Exception e) {
			n = 0;
		}
		return n;

	}
	public List<FeedbackMod> getAllFeeds(){
		List<FeedbackMod> complainlist=new ArrayList<FeedbackMod>();

		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select * from feedbacks";
		    PreparedStatement pst = conn.prepareStatement(qry);
			
			
			ResultSet rs = pst.executeQuery();
			System.out.println("qryy =" +pst.toString());
		    while(rs.next()) {
		    	FeedbackMod Book= new FeedbackMod();
		    	
		    	
		    	Book.setFeedbackId(rs.getInt("feedbackId"));
		    	Book.setUserId(rs.getInt("userId"));
		    	Book.setWebsiteService(rs.getString("websiteService"));
		    	Book.setFeedBackDate(rs.getString("feedBackDate"));
		    	
		    	
		    	Book.setFeedbackMessage(rs.getString("feedbackMessage"));
		    	
		    	complainlist.add(Book);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCustomerOrders..:" +e);
			
		}
		return complainlist;
		}
}

package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class ReviewsMod implements Serializable {
	private int reviewId;

	private int userId;
	private int workerId;
	private String reviewDate;
	private String serviceName;
	private int rating;
	private String comments;

	public ReviewsMod() {
		super();
	}

	public ReviewsMod(int reviewId, int userId, int workerId, String reviewDate, String serviceName, int rating,
			String comments) {
		super();
		this.reviewId = reviewId;
		this.userId = userId;
		this.workerId = workerId;
		this.reviewDate = reviewDate;
		this.serviceName = serviceName;
		this.rating = rating;
		this.comments = comments;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getWorkerId() {
		return workerId;
	}

	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int addReviews() {
		int n = 0;

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into reviews(userId,workerId,comments,rating,serviceName,reviewDate) values(?,?,?,?,?,?) ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.userId);
			pst.setInt(2, this.workerId);
			pst.setString(3, this.comments);
			pst.setInt(4, this.rating);
			pst.setString(5, this.serviceName);
			pst.setString(6, this.reviewDate);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;

	}
////checking if rating is present

	public boolean isRatingGiven(int userId, int workerId) {

		boolean found = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select reviewId  from  reviews where userId=? and workerId=? ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, userId);
			pst.setInt(2, workerId);
			ResultSet n = pst.executeQuery();
			System.out.println("qry=" + pst.toString());
			if (n.next()) {
				found = true;

			} else {
				found = false;

			}
		} catch (Exception e) {
		}
		return found;
	}

	public List<ReviewsMod> getAllReviewsByUserId(int userId) {
		List<ReviewsMod> reviewList = new ArrayList<ReviewsMod>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from reviews where userId=? ";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ReviewsMod rev = new ReviewsMod();

				rev.setComments(rs.getString("comments"));
				rev.setRating(rs.getInt("rating"));
				rev.setReviewDate(rs.getString("reviewDate"));
				rev.setReviewId(rs.getInt("reviewId"));
				rev.setServiceName(rs.getString("serviceName"));
				rev.setUserId(rs.getInt("userId"));
				rev.setWorkerId(rs.getInt("workerId"));

				reviewList.add(rev);
			}
		} catch (Exception e) {
			System.out.println("Error:getAllServices..:" + e);

		}
		return reviewList;
	}

///deleting product model
	public boolean deleteReviewById() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "delete from  reviews where reviewId=? ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.reviewId);
			int n = pst.executeUpdate();
			if (n == 0) {
				flag = false;
			} else {
				flag = true;

			}

		} catch (Exception e) {
		}
		return flag;
	}

//getting reviews in worker 
	public List<ReviewsMod> getReviewsByWorkerId(int workerId) {
		List<ReviewsMod> reviewList = new ArrayList<ReviewsMod>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from reviews where workerId=? ";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, workerId);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ReviewsMod rev = new ReviewsMod();

				rev.setComments(rs.getString("comments"));
				rev.setRating(rs.getInt("rating"));
				rev.setReviewDate(rs.getString("reviewDate"));
				rev.setReviewId(rs.getInt("reviewId"));
				rev.setServiceName(rs.getString("serviceName"));
				rev.setUserId(rs.getInt("userId"));
				rev.setWorkerId(rs.getInt("workerId"));

				reviewList.add(rev);
			}
		} catch (Exception e) {
			System.out.println("Error:getAllServices..:" + e);

		}
		return reviewList;
	}
	//getting reviews in Admin 
		public List<ReviewsMod> getReviewsInTheAdmin() {
			List<ReviewsMod> reviewList = new ArrayList<ReviewsMod>();

			try {
				DBConnection db = new DBConnection();
				Connection conn = db.getConnection();

				String qry = "select * from reviews order by  reviewDate";

				PreparedStatement pst = conn.prepareStatement(qry);
				ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					ReviewsMod rev = new ReviewsMod();

					rev.setComments(rs.getString("comments"));
					rev.setRating(rs.getInt("rating"));
					rev.setReviewDate(rs.getString("reviewDate"));
					rev.setReviewId(rs.getInt("reviewId"));
					rev.setServiceName(rs.getString("serviceName"));
					rev.setUserId(rs.getInt("userId"));
					rev.setWorkerId(rs.getInt("workerId"));

					reviewList.add(rev);
				}
			} catch (Exception e) {
				System.out.println("Error:getAllServices..:" + e);

			}
			return reviewList;
		}
	}


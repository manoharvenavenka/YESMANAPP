package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class ComplainsMod implements Serializable {
	private int complaintId;
	private String complaintDate;
	private int userId;
	private int workerId;
	private String complaintText;

	public ComplainsMod() {
		super();
	}

	public ComplainsMod(int complaintId, String complaintDate, int userId, int workerId, String complaintText) {
		super();
		this.complaintId = complaintId;
		this.complaintDate = complaintDate;
		this.userId = userId;
		this.workerId = workerId;
		this.complaintText = complaintText;
	}

	public int getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}

	public String getComplaintDate() {
		return complaintDate;
	}

	public void setComplaintDate(String complaintDate) {
		this.complaintDate = complaintDate;
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

	public String getComplaintText() {
		return complaintText;
	}

public void setComplaintText(String complaintText) {
	this.complaintText = complaintText;
}

public int addComplain() {
	int n = 0;
	try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		String qry = "insert into complaints(complaintDate,userId,workerId,complaintText) values(?,?,?,?)";
		PreparedStatement pst = conn.prepareStatement(qry);
		pst.setString(1, this.complaintDate);
		pst.setInt(2, this.userId);
		pst.setInt(3, this.workerId);
		pst.setString(4, this.complaintText);

		n = pst.executeUpdate();
		System.out.println("pst" + pst.toString());
	} catch (Exception e) {
		n = 0;
	}
	return n;
}

public List<ComplainsMod> getAllComplaints(){
	List<ComplainsMod> complainlist=new ArrayList<ComplainsMod>();

	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
	    String qry="select * from complaints";
	    PreparedStatement pst = conn.prepareStatement(qry);
		
		
		ResultSet rs = pst.executeQuery();
		System.out.println("qryy =" +pst.toString());
	    while(rs.next()) {
	    	ComplainsMod Book= new ComplainsMod();
	    	
	    	
	    	Book.setComplaintDate(rs.getString("complaintDate"));
	    	Book.setUserId(rs.getInt("userId"));
	    	Book.setWorkerId(rs.getInt("workerId"));
	    	Book.setComplaintId(rs.getInt("complaintId"));
	    	
	    	
	    	Book.setComplaintText(rs.getString("complaintText"));
	    	
	    	complainlist.add(Book);
	    }
	}catch(Exception e) {
		System.out.println("Error:getAllCustomerOrders..:" +e);
		
	}
	return complainlist;
	}
}
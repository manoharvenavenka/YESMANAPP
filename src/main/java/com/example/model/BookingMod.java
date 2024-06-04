package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class BookingMod implements Serializable{
	private int bookingId;
	private String bookingDate;
	private int userId;
	private int workerId;
	private String serviceName;
	private String workerLatitude;
	private String workerLongitude;
	private String status;
	public BookingMod() {
		super();
	}
	public BookingMod(int bookingId, String bookingDate, int userId, int workerId, String serviceName,
			String workerLatitude, String workerLongitude, String status) {
		super();
		this.bookingId = bookingId;
		this.bookingDate = bookingDate;
		this.userId = userId;
		this.workerId = workerId;
		this.serviceName = serviceName;
		this.workerLatitude = workerLatitude;
		this.workerLongitude = workerLongitude;
		this.status = status;
	}
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
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
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getWorkerLatitude() {
		return workerLatitude;
	}
	public void setWorkerLatitude(String workerLatitude) {
		this.workerLatitude = workerLatitude;
	}
	public String getWorkerLongitude() {
		return workerLongitude;
	}
	public void setWorkerLongitude(String workerLongitude) {
		this.workerLongitude = workerLongitude;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int addBookings() {
        int n = 0;
        try {
        DBConnection db = new DBConnection();
        Connection conn = db.getConnection();
       
       String qry = "INSERT INTO bookings( bookingDate, userId,workerId, serviceName, workerLatitude, workerLongitude, status) VALUES (?, ?, ?, ?, ?, ?, ? )";
       PreparedStatement pst = conn.prepareStatement(qry);
            		  
                   
                    pst.setString(1, this.bookingDate);
                    pst.setInt(2, this.userId);
                    pst.setInt(3, this.workerId);
                    pst.setString(4, this.serviceName);
                    pst.setString(5, this.workerLatitude);
                    pst.setString(6, this.workerLongitude);
                    pst.setString(7, this.status);
                    n = pst.executeUpdate();
               
            } catch (Exception e) {
            	n=0;
                System.out.println("Error: " + e);
            }
        
        return n;
    }

	public List<BookingMod> getAllBookings(int userId){
		List<BookingMod> bookinhList=new ArrayList<BookingMod>();

		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select * from bookings where userId=?";
		    PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,userId);
			
			ResultSet rs = pst.executeQuery();
		    
		    while(rs.next()) {
		    	BookingMod Book= new BookingMod();
		    	
		    	Book.setBookingId(rs.getInt("bookingId"));
		    	Book.setBookingDate(rs.getString("bookingDate"));
		    	Book.setServiceName(rs.getString("serviceName"));
		    	Book.setStatus(rs.getString("status"));
		    	Book.setUserId(rs.getInt("userId"));
		    	Book.setWorkerId(rs.getInt("workerId"));
		    	Book.setWorkerLatitude(rs.getString("workerLatitude"));
		    	Book.setWorkerLongitude(rs.getString("workerLongitude"));
		    	
		    	bookinhList.add(Book);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCustomerOrders..:" +e);
			
		}
		return bookinhList;
		}
	public int bookingStatusUpdate(int bookingId, String status) {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update bookings set status=? where bookingId=?";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setString(1, status);
			pst.setLong(2, bookingId);

			n = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return n;
	}
	
	
	public List<BookingMod> getWorkerBookings(int workerId){
		List<BookingMod> bookinhList=new ArrayList<BookingMod>();

		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select * from bookings where workerId=?";
		    PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,workerId);
			
			ResultSet rs = pst.executeQuery();
		    
		    while(rs.next()) {
		    	BookingMod Book= new BookingMod();
		    	Book.setBookingId(rs.getInt("bookingId"));
		    	Book.setBookingDate(rs.getString("bookingDate"));
		    	Book.setServiceName(rs.getString("serviceName"));
		    	Book.setStatus(rs.getString("status"));
		    	Book.setUserId(rs.getInt("userId"));
		    	Book.setWorkerId(rs.getInt("workerId"));
		    	Book.setWorkerLatitude(rs.getString("workerLatitude"));
		    	Book.setWorkerLongitude(rs.getString("workerLongitude"));
		    	
		    	bookinhList.add(Book);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCustomerOrders..:" +e);
			
		}
		return bookinhList;
		}
	
}

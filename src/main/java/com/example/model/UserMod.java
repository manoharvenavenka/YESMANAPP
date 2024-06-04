package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class UserMod implements Serializable {
	private int userId;
	private String fullName;
	private String registrationDate;
	private String mobile;
	private String password;
	private String profilePic;

	public UserMod() {
		super();
	}

	public UserMod(int userId, String fullName, String registrationDate, String mobile, String password,
			String profilePic) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.registrationDate = registrationDate;
		this.mobile = mobile;
		this.password = password;
		this.profilePic = profilePic;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public int addUsers() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "INSERT INTO users(fullName,registrationDate,mobile,password,profilePic) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(qry);

			pst.setString(1, this.fullName);
			pst.setString(2, this.registrationDate);

			pst.setString(3, this.mobile);
			pst.setString(4, this.password);
			pst.setString(5, this.profilePic);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
			System.out.println("Error: " + e);
		}

		return n;
	}

	public boolean UserLoginValidate() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
			if (conn == null) {
				flag = false;
			} else {
				String qry = "select * from users where fullName=? and password=?";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setString(1, this.fullName);
				pst.setString(2, this.password);
				ResultSet rs = pst.executeQuery();
				if (rs.next()) {
					flag = true;
					this.userId = rs.getInt("userId");

				} else {
					flag = false;
				}
			}

		} catch (Exception e) {
			flag = false;
		}
		return flag;

	}

	// geting details in admin view
	public List<UserMod> getUsersInAdmin() {
	 List<UserMod> userList = new ArrayList<UserMod>();

	 try {
	 DBConnection db = new DBConnection();
	 Connection conn = db.getConnection();

	 String qry = "select * from users order by fullName";

	 PreparedStatement pst = conn.prepareStatement(qry);
	 ResultSet rs = pst.executeQuery();
	 System.out.println("qryy =" +pst.toString());

	
	 while (rs.next()) {
		 UserMod user = new UserMod();
		 user.setUserId(rs.getInt("userId"));
		 user.setFullName(rs.getString("fullName"));
	 user.setMobile(rs.getString("mobile"));
	 user.setProfilePic(rs.getString("profilePic"));
	 user.setRegistrationDate(rs.getString("registrationDate"));
	 userList.add(user);
	 }

	 } catch (Exception e) {
	 System.out.println("Eroor at getmethod=" + e);

	 }
	 return userList;


	 }
/////////////////////////////////
///////////// viewing worker details in card in UserProfile
/////////////////////////////

public List<UserMod> getUserById(int userId) {
List<UserMod> userList = new ArrayList<UserMod>();

try {
DBConnection db = new DBConnection();
Connection conn = db.getConnection();

String qry = "select * from users where userId=?";

PreparedStatement pst = conn.prepareStatement(qry);
pst.setInt(1, userId);
ResultSet rs = pst.executeQuery();
System.out.println("qryy =" +pst.toString());


while (rs.next()) {
	UserMod users = new UserMod();
users.setFullName(rs.getString("fullName"));
users.setMobile(rs.getString("mobile"));
users.setPassword(rs.getString("password"));
users.setProfilePic(rs.getString("profilePic"));
users.setRegistrationDate(rs.getString("registrationDate"));
users.setUserId(rs.getInt("userId"));

userList.add(users);
}

} catch (Exception e) {
System.out.println("Eroor at getmethod=" + e);

}
return userList;

}
public UserMod getProfileByUserId(int userId) {
	UserMod users = new UserMod();
	try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();
		String qry = "select * from users where userId=?";

		PreparedStatement pst = conn.prepareStatement(qry);
		pst.setInt(1,userId);
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			users.setFullName(rs.getString("fullName"));
			users.setMobile(rs.getString("mobile"));
			users.setPassword(rs.getString("password"));
			users.setProfilePic(rs.getString("profilePic"));
			users.setRegistrationDate(rs.getString("registrationDate"));
			users.setUserId(rs.getInt("userId"));

		}

	} catch (Exception e) {
		System.out.println("error=" + e);
	}
	return users;
}
public int updateUserDetails() {
	int n = 0;
	try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		String qry = "update users set fullName=?,mobile=?,password=? where userId=?";
		PreparedStatement pst = conn.prepareStatement(qry);
		
		System.out.println("Query = "+pst.toString());
		
		pst.setString(1, this.fullName);
		pst.setString(2, this.mobile);
		pst.setString(3, this.password);
		pst.setInt(4, this.userId);
		System.out.println();
		n = pst.executeUpdate();

	} catch (Exception e) {
		n = 0;
	}
	return n;
}


}

package com.example.model;



	import java.io.Serializable;
	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;
	public class WorkerMod implements Serializable{

	
		 private int workerId;
		    private String fullName;
		    private String registrationDate;
		    private String serviceName;
		    private String mobile;
		    private String currentAddress;
		    private String cities;
		    private String workerPic;
		    private String aadhaarPic;
		    private String password;
		    private String status;
			

			
			public WorkerMod() {
				super();
			}
			

			public WorkerMod(int workerId, String fullName, String registrationDate, String serviceName, String mobile,
					String currentAddress, String cities, String workerPic, String aadhaarPic, String password,
					String status) {
				super();
				this.workerId = workerId;
				this.fullName = fullName;
				this.registrationDate = registrationDate;
				this.serviceName = serviceName;
				this.mobile = mobile;
				this.currentAddress = currentAddress;
				this.cities = cities;
				this.workerPic = workerPic;
				this.aadhaarPic = aadhaarPic;
				this.password = password;
				this.status = status;
			}


			//////////////////////////////////////////
			///////////////////////Add Workeres
			////////////////////////////////////
			
			public int getWorkerId() {
				return workerId;
			}


			public void setWorkerId(int workerId) {
				this.workerId = workerId;
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


			public String getServiceName() {
				return serviceName;
			}


			public void setServiceName(String serviceName) {
				this.serviceName = serviceName;
			}


			public String getMobile() {
				return mobile;
			}


			public void setMobile(String mobile) {
				this.mobile = mobile;
			}


			public String getCurrentAddress() {
				return currentAddress;
			}


			public void setCurrentAddress(String currentAddress) {
				this.currentAddress = currentAddress;
			}


			public String getCities() {
				return cities;
			}


			public void setCities(String cities) {
				this.cities = cities;
			}


			public String getWorkerPic() {
				return workerPic;
			}


			public void setWorkerPic(String workerPic) {
				this.workerPic = workerPic;
			}


			public String getAadhaarPic() {
				return aadhaarPic;
			}


			public void setAadhaarPic(String aadhaarPic) {
				this.aadhaarPic = aadhaarPic;
			}


			public String getPassword() {
				return password;
			}


			public void setPassword(String password) {
				this.password = password;
			}


			public String getStatus() {
				return status;
			}


			public void setStatus(String status) {
				this.status = status;
			}


			public int updateWorker() {
				int n = 0;
				try {
					DBConnection db = new DBConnection();
					Connection conn = db.getConnection();
			
            String qry = "UPDATE workers SET fullName=?, registrationDate=?, serviceName=?, mobile=?, currentAddress=?, cities=?, password=? WHERE workerId=?";
            PreparedStatement pst = conn.prepareStatement(qry);
            pst.setString(1, this.fullName);
            pst.setString(2, this.registrationDate);
            pst.setString(3, this.serviceName);
            pst.setString(4, this.mobile);
            pst.setString(5, this.currentAddress);
            pst.setString(6, this.cities);
            pst.setString(7, this.password);
            pst.setInt(8, this.workerId);
            n = pst.executeUpdate();

				} catch (Exception e) {
					n = 0;
				}
				return n;
			}


			
			public int addWorkers() {
		        int n = 0;
		        try {
		        DBConnection db = new DBConnection();
		        Connection conn = db.getConnection();
		        
		       String qry = "INSERT INTO workers(fullName, registrationDate, serviceName, mobile, currentAddress, cities, workerPic, aadhaarPic, password, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		       PreparedStatement pst = conn.prepareStatement(qry);
		            		  
		                    pst.setString(1, this.fullName);
		                    pst.setString(2, this.registrationDate);
		                    pst.setString(3, this.serviceName);
		                    pst.setString(4, this.mobile);
		                    pst.setString(5, this.currentAddress);
		                    pst.setString(6, this.cities);
		                    pst.setString(7, this.workerPic);
		                    pst.setString(8, this.aadhaarPic);
		                    pst.setString(9, this.password);
		                    pst.setString(10, this.status);
		                    n = pst.executeUpdate();
		               
		            } catch (Exception e) {
		            	n=0;
		                System.out.println("Error: " + e);
		            }
		        
		        return n;
		    }

			 public boolean WorkerLoginValidate() {
					boolean flag = false;
					try {
						DBConnection db = new DBConnection();
						Connection conn = db.getConnection();
						if (conn == null) {
							flag = false;
						} else {
							String qry = "select * from workers where mobile=? and password=?";
							PreparedStatement pst = conn.prepareStatement(qry);
							pst.setString(1, this.mobile);
							pst.setString(2, this.password);
							ResultSet rs = pst.executeQuery();
							if (rs.next()) {
								flag = true;
								this.workerId = rs.getInt("workerId");

							} else {
								flag = false;
							}
						}

					} catch (Exception e) {
						flag = false;
					}
					return flag;

				}
/////////////////////////////////
///////////// viewing worker details in card in customerProfile
/////////////////////////////

public List<WorkerMod> getWorkerById(int workerId) {
List<WorkerMod> workerList = new ArrayList<WorkerMod>();

try {
DBConnection db = new DBConnection();
Connection conn = db.getConnection();

String qry = "select workerId,fullName,serviceName,mobile,currentAddress,cities,workerPic,password from workers where workerId=?";

PreparedStatement pst = conn.prepareStatement(qry);
pst.setInt(1, workerId);
ResultSet rs = pst.executeQuery();
System.out.println("qryy =" +pst.toString());


while (rs.next()) {
WorkerMod workers = new WorkerMod();
workers.setWorkerId(rs.getInt("workerId"));
workers.setFullName(rs.getString("fullName"));
workers.setServiceName(rs.getString("serviceName"));
workers.setMobile(rs.getString("mobile"));
workers.setCurrentAddress(rs.getString("currentAddress"));
workers.setCities(rs.getString("cities"));
workers.setWorkerPic(rs.getString("workerPic"));
workers.setPassword(rs.getString("password"));
workerList.add(workers);
}

} catch (Exception e) {
System.out.println("Eroor at getmethod=" + e);

}
return workerList;

}

public List<WorkerMod> getWorkerByServiceName(String serviceName) {
List<WorkerMod> workerList = new ArrayList<WorkerMod>();

try {
DBConnection db = new DBConnection();
Connection conn = db.getConnection();

String qry = "select workerId,fullName,serviceName,mobile,registrationDate,currentAddress,status,cities,workerPic,password from workers where serviceName=?";

PreparedStatement pst = conn.prepareStatement(qry);
pst.setString(1, serviceName);
ResultSet rs = pst.executeQuery();
System.out.println("qryy =" +pst.toString());


while (rs.next()) {
WorkerMod workers = new WorkerMod();
workers.setWorkerId(rs.getInt("workerId"));
workers.setFullName(rs.getString("fullName"));
workers.setServiceName(rs.getString("serviceName"));
workers.setMobile(rs.getString("mobile"));
workers.setCurrentAddress(rs.getString("currentAddress"));
workers.setCities(rs.getString("cities"));
workers.setWorkerPic(rs.getString("workerPic"));
workers.setPassword(rs.getString("password"));
workers.setRegistrationDate(rs.getString("registrationDate"));
workers.setStatus(rs.getString("status"));
workerList.add(workers);
}

} catch (Exception e) {
System.out.println("Eroor at getmethod=" + e);

}
return workerList;

}
//geting details in admin view 
public List<WorkerMod> getWorkerDetailsInAdmin() {
List<WorkerMod> workerList = new ArrayList<WorkerMod>();

try {
DBConnection db = new DBConnection();
Connection conn = db.getConnection();

String qry = "select * from workers order by workerId";

PreparedStatement pst = conn.prepareStatement(qry);
ResultSet rs = pst.executeQuery();
System.out.println("qryy =" +pst.toString());


while (rs.next()) {
WorkerMod workers = new WorkerMod();
workers.setWorkerId(rs.getInt("workerId"));
workers.setFullName(rs.getString("fullName"));
workers.setServiceName(rs.getString("serviceName"));
workers.setMobile(rs.getString("mobile"));
workers.setCurrentAddress(rs.getString("currentAddress"));
workers.setCities(rs.getString("cities"));
workers.setWorkerPic(rs.getString("workerPic"));
workers.setPassword(rs.getString("password"));
workers.setRegistrationDate(rs.getString("registrationDate"));
workers.setStatus(rs.getString("status"));
workers.setAadhaarPic(rs.getString("aadhaarPic"));
workerList.add(workers);
}

} catch (Exception e) {
System.out.println("Eroor at getmethod=" + e);

}
return workerList;


}
public int workerStatusUpdate(int workerId, String status) {
	int n = 0;
	try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		String qry = "update workers set status=? where workerId=?";
		PreparedStatement pst = conn.prepareStatement(qry);

		pst.setString(1, status);
		pst.setLong(2, workerId);

		n = pst.executeUpdate();
	} catch (Exception e) {
		System.out.println("Error: " + e);
	}
	return n;
}
public WorkerMod getWorkerDetailsByworkerId(int workerId) {
	WorkerMod workers = new WorkerMod();
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
		String qry="select * from workers where workerId=?";
		
		PreparedStatement pst = conn.prepareStatement(qry);
		 pst.setInt(1, workerId);
	    
		ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {
        	//taking variables
        	workers.setWorkerId(rs.getInt("workerId"));
        	workers.setFullName(rs.getString("fullName"));
        	workers.setServiceName(rs.getString("serviceName"));
        	workers.setMobile(rs.getString("mobile"));
        	workers.setCurrentAddress(rs.getString("currentAddress"));
        	workers.setCities(rs.getString("cities"));
        	workers.setWorkerPic(rs.getString("workerPic"));
        	workers.setPassword(rs.getString("password"));
        	workers.setRegistrationDate(rs.getString("registrationDate"));
        	workers.setStatus(rs.getString("status"));
        	workers.setAadhaarPic(rs.getString("aadhaarPic"));
        	
        }else {
        	workers= null;
        }
        
              

}catch(Exception e) {
	System.out.println("error="+e);
}
	return workers;
}
}
		


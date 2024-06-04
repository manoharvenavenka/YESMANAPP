package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class ServicesMod implements Serializable{

	private String serviceName;
	private int serviceId;
	private String servicePic;
	
	
	public ServicesMod() {
		super();
	}
	
	


	public ServicesMod(String serviceName, int serviceId, String servicePic) {
		super();
		this.serviceName = serviceName;
		this.serviceId = serviceId;
		this.servicePic = servicePic;
	}




	public String getServiceName() {
		return serviceName;
	}




	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}




	public int getServiceId() {
		return serviceId;
	}




	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}




	public String getServicePic() {
		return servicePic;
	}




	public void setServicePic(String servicePic) {
		this.servicePic = servicePic;
	}




		//Add  Service
		public int addServices() {
		    int n = 0;
		    DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();

		    if (conn == null) {
		        n = 0;
		    } else {
		        try {
		            String qry = "insert into services (serviceName,servicePic) VALUES (?,?)";
		            PreparedStatement pst = conn.prepareStatement(qry);
		           
		            pst.setString(1, this.serviceName);
		            pst.setString(2, this.servicePic);

		            System.out.println("qry11="+pst.toString());
		            n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE
		            
		            
		        } catch (Exception e) {
		        	System.out.println("Error:"+e);
		            n=0;
		        } 
		    
		    
		}
			return n;

	}
		public List<ServicesMod> getAllServices(String search){
			
			List<ServicesMod> serviceList=new ArrayList<ServicesMod>();

			try {
				DBConnection db = new DBConnection();
			    Connection conn = db.getConnection();
			    
			  String qry="";
			   if(search==null) {
			  qry="select * from services order by serviceName";
			   }else { 
			  
			  search = search.toLowerCase();
			    	String words[] = search.split(" ");
			    	String columnNames[] = {"serviceName"};
			    	 	qry="select * from services  where";
			    	
			    	for(String word: words) {
			    		for (String colName: columnNames) {
			    		//qry+= "lower("+colName +") like '%" + word + "%' or ";
			    		//qry+=" "+colName +" like '%"+word+"%' or ";
			    		qry+=" lower("+colName +") like '%"+word+"%' or ";
			    			//qry+=String.format("%s like'\%%s' or ", columnNames,word);
			    		}
			    	}
			    	
			    	qry = qry.substring(0, qry.length()-3);
			    	
			    	qry +=" order by serviceName";
			    	System.out.println("qry=" + qry);	
			    	
			}
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			
			while(rs.next()) {
				ServicesMod serv = new ServicesMod();
				
				serv.setServiceId(rs.getInt("serviceId"));
				serv.setServiceName(rs.getString("serviceName"));
				serv.setServicePic(rs.getString("servicePic"));
				
				
				serviceList.add(serv);
			}
			
			
			}catch(Exception e){
			System.out.println("Eroor at getmethod=" +e);
			
		}
		return serviceList;
		}
		
		//view
		/*public List<ServicesMod> getAllServices(){
			List<ServicesMod> serviceList=new ArrayList<ServicesMod>();
		
			try {
				DBConnection db = new DBConnection();
			    Connection conn = db.getConnection();
			    
			    String qry="select serviceId, serviceName, servicePic from services order by serviceId";
			   
			    PreparedStatement pst = conn.prepareStatement(qry);
				//pst.setInt(1,this.serviceId);
				ResultSet rs = pst.executeQuery();
			    while(rs.next()) {
			    	ServicesMod service= new ServicesMod();
			    	service.setServiceId(rs.getInt("serviceId"));
			    	service.setServiceName(rs.getString("ServiceName"));
			    	service.setServicePic(rs.getString("ServicePic"));
			    	serviceList.add(service);
			    }
			}catch(Exception e) {
				System.out.println("Error:getAllServices..:" +e);
				
			}
			return serviceList;
		}*/
		
		
	
		public ServicesMod getServicesById(int serviceId) {
			ServicesMod services = new ServicesMod();
			System.out.println("proddddd"+services);
			try {
				DBConnection db = new DBConnection();
			    Connection conn = db.getConnection();
			    
				String qry="select * from services where serviceId=?";
				
				PreparedStatement pst = conn.prepareStatement(qry);
				 pst.setInt(1,serviceId);
			    
				ResultSet rs = pst.executeQuery();
		        	if(rs.next()) {
		            	//taking variables
		        		services.setServiceName(rs.getString("serviceName"));
		        		services.setServiceId(rs.getInt("serviceId"));
		        		services.setServicePic(rs.getString("servicePic"));
		            	
		            }else {
		            	services = null;
		            }
		            
		            

			}catch(Exception e) {
				System.out.println("error="+e);
			}
				return services;
			}
		
		//updating
		public int UpdateByserviceId() {
			int  n= 0;

			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			if (conn == null) {
				System.err.println("Connectin error");
			   
			} else {
			try {
				 String qry = "Update services set serviceName=? where serviceId=? ";
			     PreparedStatement pst = conn.prepareStatement(qry);
			     pst.setString(1, this.serviceName);
			     pst.setInt(2,this.serviceId);
			     
				n=pst.executeUpdate();
				System.out.println("qry="+pst.toString());
				conn.close();
			}catch(Exception e) {
				
			}


			}
			return n;
			}
		///deleting service model
		public boolean deleteProductByServiceId() {
			boolean flag= false;
			try {
				DBConnection db = new DBConnection();
			    Connection conn = db.getConnection();
			    
				String qry = "delete from  services where serviceId=? ";
		        PreparedStatement pst = conn.prepareStatement(qry);
		        pst.setInt(1, this.serviceId);
				 int n=pst.executeUpdate();
				 if (n==0) {
					 flag=false;
				 }else {
					 flag=true;
					 
				 }
					
			}catch(Exception e) {
			}
				return flag;
			}
	////forviewing servicenames in    AddWorker
		public List<String> getAllServiceBByNameandi(){

		List<String> serviceslist = new ArrayList<String>();
		try {
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();



		String qry="select  serviceName from services order by serviceName";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(qry);

		while(rs.next()) {

			serviceslist.add(rs.getString("serviceName"));
		}


		}catch(Exception e){
		System.out.println("Eroor at getmethod=" +e);

		}
		return serviceslist;
		}
		}


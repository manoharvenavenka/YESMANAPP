package com.example.controller.worker;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Calendar;

import com.example.model.WorkerMod;

import dbutil.Cryptography;

/**
 * Servlet implementation class AddWorkerServlet
 */
@MultipartConfig
public class AddWorkerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddWorkerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/hmtl");
		PrintWriter pw= response.getWriter();
		Calendar c= Calendar.getInstance();
		String today=c.get(Calendar.YEAR)+"/"+(c.get(Calendar.MONTH)+1)+"/"+c.get(Calendar.DAY_OF_MONTH);
		
		//String customerId=request.getParameter("customerId");
		
				String fullName = request.getParameter("fullName");
		        String serviceName = request.getParameter("serviceName");
		        String mobile = request.getParameter("mobile");
		        String currentAddress = request.getParameter("currentAddress");
		        String cities = request.getParameter("cities");
		        String password = request.getParameter("password");
		        
		        String status="Inactive";
		        Part aadhaarPic = request.getPart("aadhaarPic");
		        
		        Part  workerPic = request.getPart("workerPic");
		        System.out.println("serviceName="+serviceName);
		        System.out.println("cities="+cities);
		        System.out.println();
				//String profilePic=request.getParameter("profilePic");
		        
		        String mobileEncode=Cryptography.encode(mobile);
				System.out.println("Mobile encode="+mobileEncode);
				
				String passwordEncode=Cryptography.encode(password);
				System.out.println("Password encode="+passwordEncode);
				
				// Creation of the uploads directory in the webapp folder
		        ServletContext sc = getServletContext();
		        String path = sc.getRealPath("/");
		        System.out.println("path="+path);
		        
		       /* String str = path.substring(0, path.indexOf(".metadata") - 1);
		        String appName = path.substring(path.lastIndexOf("\\", path.length()-2));
		        System.out.println("appNAme="+appName);
		        
		        String uploadDirectory = str+appName+"\\src\\main\\webapp\\Workeruploads";
		        System.out.println("Upload Directory"+uploadDirectory);*/
				String uploadDirectory=path+"/uploads";


		        Path uploadPath = Path.of(uploadDirectory);
			
		        // Create the directory if it doesn't exist
		        if (!Files.exists(uploadPath)) {
		            Files.createDirectories(uploadPath);
		            System.out.println("Directory Created");
		        } else {
		            System.out.println("Directory not Created already exists");
		        }
		        
			     // Upload worker image
		        InputStream inputStream1 = workerPic.getInputStream();
		        String filename = System.currentTimeMillis() + "_" + workerPic.getSubmittedFileName();
		        Path filepath = uploadPath.resolve(filename);
		        Files.copy(inputStream1,filepath,StandardCopyOption.REPLACE_EXISTING);
		     
		        // Upload Aadhar image
		        InputStream inputStream2 = aadhaarPic.getInputStream();
		        String filename2 = System.currentTimeMillis() + "_" + aadhaarPic.getSubmittedFileName();
		        Path filepath2 = uploadPath.resolve(filename2);
		        Files.copy(inputStream2,filepath2,StandardCopyOption.REPLACE_EXISTING);
		        
		        WorkerMod workers= new WorkerMod();
		        workers.setFullName(fullName);
		        workers.setRegistrationDate(today);
		        workers.setServiceName(serviceName);
		        workers.setMobile(mobileEncode);
		        workers.setCurrentAddress(currentAddress);
		        workers.setCities(cities);
		        workers.setWorkerPic(filename);
		        workers.setAadhaarPic(filename2);
		        workers.setPassword(passwordEncode);
		        workers.setStatus(status);
		        
		        int n= workers.addWorkers();
	        	response.sendRedirect("Worker/Createworker.jsp?res="+n);
			
				
	}

}

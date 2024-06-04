package com.example.controller.user;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
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

import com.example.model.UserMod;
import com.example.model.WorkerMod;

import dbutil.Cryptography;

/**
 * Servlet implementation class AddUserServlet
 */
@MultipartConfig
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
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
		      
		        String mobile = request.getParameter("mobile");
		        
		        String password = request.getParameter("password");
		        
		        
		        Part profilePic = request.getPart("profilePic");
		        
		        System.out.println("serviceName="+fullName);
		        System.out.println("cities="+mobile);
		        System.out.println();
				//String profilePic=request.getParameter("profilePic");
		        
		        String fullNameEncode=Cryptography.encode(fullName);
				System.out.println("Mobile encode="+fullNameEncode);
				
				String passwordEncode=Cryptography.encode(password);
				System.out.println("Password encode="+passwordEncode);
				
				// Creation of the uploads directory in the webapp folder
		        ServletContext sc = getServletContext();
		        String path = sc.getRealPath("/");
		        System.out.println("path="+path);
		        
		      /*  String str = path.substring(0, path.indexOf(".metadata") - 1);
		        String appName = path.substring(path.lastIndexOf("\\", path.length()-2));
		        System.out.println("appNAme="+appName);
		        
		        String uploadDirectory = str+appName+"\\src\\main\\webapp\\Useruploads";
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
		        InputStream inputStream1 = profilePic.getInputStream();
		        String filename = System.currentTimeMillis() + "_" + profilePic.getSubmittedFileName();
		        Path filepath = uploadPath.resolve(filename);
		        Files.copy(inputStream1,filepath,StandardCopyOption.REPLACE_EXISTING);
		     
		       UserMod user = new UserMod();
		       user.setFullName(fullNameEncode);
		       user.setMobile(mobile);
		       user.setRegistrationDate(today);
		       user.setPassword(passwordEncode);
		       user.setProfilePic(filename);
		        
		       
		        
		        int n= user.addUsers();
	        	response.sendRedirect("User/UserLoginPage.jsp?res="+n);
			
				
	}

}

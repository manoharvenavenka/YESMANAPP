<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.ServicesMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../userheader.jsp"></jsp:include>
	<jsp:include page="../UNavBar.jsp"></jsp:include>
	
	<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Add Complaint
                </div>
                <div class="card-body">
                 <%
                        String workerId=request.getParameter("workerId");
                        
                        
                        %>
                    <form action="../AddComplaintServlet?workerId=<%=workerId %>" method="post">
                       
                        <div class="form-group">
                            <label for="workerId">Worker ID:</label>
                            <input type="text" class="form-control" name="workerId"  value="<%=workerId %>" >
                        </div>
                        <div class="form-group">
                            <label for="complaintText">Complaint Text:</label>
                            <textarea class="form-control" id="complaintText" name="complaintText" rows="4" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
	
	
	</body>
	</html>
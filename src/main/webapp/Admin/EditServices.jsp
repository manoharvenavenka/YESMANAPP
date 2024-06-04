<%@page import="com.example.model.ServicesMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Services</title>
    <jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../adminheader.jsp"></jsp:include>
<jsp:include page="../adminnav.jsp"></jsp:include>
<div class="container">
<div class="card" style="background-color:#D6C4C4;margin-bottom: 10rem">
    <form class="card-body" action="/YesManApp/UpdateServicesServlet" method="post">
        <h2 class="mb-4 text-center" style="color:white;"><i class="fa-brands fa-servicestack" style="color:white;"></i> Update Services</h2>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4 mt-4">
                <%
                    String serviceId = request.getParameter("serviceId");
                    System.out.println("serviceId="+serviceId);
                    //for viewing in the table code
                    ServicesMod service = new ServicesMod();
                    service = service.getServicesById(Integer.parseInt(serviceId));
                %>
                <label for="serviceName" class="text-muted">Service Name</label>
                <input type="text" name="serviceName" value="<%=service.getServiceName() %>" class="form-control" style="border-radius: 7px"/>
            </div>
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4"></div>
            
            <div class="col-sm-4 mt-4">
                <label for="serviceId" class="text-muted">Service ID</label>
                <input type="number" name="serviceId" readonly value="<%=service.getServiceId() %>" class="form-control" style="border-radius: 7px;margin-top: 1rem"/>
                <br><br>
                <%
                    String res = request.getParameter("res");
                    if (res != null) {
                        if (res.equals("0")) {
                            out.println("<h4 style='color:red'>Services not added</h4>");
                        } else {
                            out.println("<h4 style='color:green'>Services Added Successfully..</h4>");
                        }
                    }
                %>
            </div>
        </div>
        <br><br>
        <div class="row">
            <div class="col-sm-12 text-center">
                <button type="submit" class="btn btn-success">Update Services</button>
            </div>
        </div>
    </form>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

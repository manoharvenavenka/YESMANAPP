<%@page import="com.example.model.Advertisement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.ServicesMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="../userheader.jsp"></jsp:include>
    <jsp:include page="../UNavBar.jsp"></jsp:include>

    <div class="container-fluid mb-5">
        <%
        Advertisement adv = new Advertisement();
        List<Advertisement> ad = adv.getAllAdv();
        %>
        <div class="row">
            <%
            for (Advertisement adob : ad) {
            %>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <div class="card mb-4 bg-dark text-white">
                    <img src='../uploads/<%=adob.getAdvertisementBanner()%>'
                        class="card-img-top" alt="Advertisement Banner" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">Advertisement Details</h5>
                        <p class="card-text"><strong>Start Date:</strong> <%=adob.getAdvertisementStartDate() %></p>
                        <p class="card-text"><strong>End Date:</strong> <%=adob.getAdvertisementEndDate() %></p>
                        <p class="card-text"><strong>Amount:</strong> <%=adob.getAmount()%></p>
                    </div>
                </div>
            </div>
            <%
            }
            %>

           
            <!-- End of New Card -->

        </div>
    </div>

    <div class="container-fluid mt-5 mb-5">
        <div class="row">
            <label class='text text-center text-primary'>
                <h2 class="mt-3 mb-4">Our Services</h2>
            </label>
            <%
            ServicesMod service = new ServicesMod();
            List<ServicesMod> serviceList = new ArrayList<ServicesMod>(); //empty product list

            String search = request.getParameter("search");
            if (search == null) { //without search
                serviceList = service.getAllServices(null);
            } else { //with search
                serviceList = service.getAllServices(search);
            }
            %>
            <%
            for (ServicesMod serviceObj : serviceList) {
            %>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="card mb-4 bg-dark text-white">
                    <img src='../uploads/<%=serviceObj.getServicePic()%>'
                        class="card-img-top" alt="Service Image" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title"><%=serviceObj.getServiceName()%></h5>
                        <p class="card-text">ServiceId=<%=serviceObj.getServiceId()%></p>
                        <a href="/YesManApp/User/ViewServiceDetails.jsp?serviceName=<%=serviceObj.getServiceName()%>"
                            class="btn btn-danger"><i class="bi bi-house-add"></i></a>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

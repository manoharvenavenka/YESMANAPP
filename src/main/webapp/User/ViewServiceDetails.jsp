<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.WorkerMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../head.jsp"></jsp:include>

    <style type="text/css">
        body {
            font-family: 'open sans';
            overflow-x: hidden;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa; /* Optional: Set a background color */
        }

        img {
            max-width: 100%;
            height: auto;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .card {
            width: 300px;
            background: #343a40; /* Dark background color */
            color: #fff; /* White text color */
            margin: 20px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .card-details h3, .card-details h4, .card-details p {
            margin: 0;
        }

        .btn-book {
            margin-top: 15px;
        }
    </style>

    <script>
        var a = confirm('This Web Site Wants To Allow Location');
        if (a == true) {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

        function showPosition(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            document.getElementById("latitude").value = latitude;
            document.getElementById("longitude").value = longitude;
        }

        function bookService(workerId, serviceName) {
            window.location="/YesManApp/AddBookingsServlet?workerId="+workerId+"&serviceName="+serviceName+"&workerLatitude="+document.getElementById("latitude").value+"&workerLongitude="+document.getElementById("longitude").value;
        }
    </script>
</head>
<body>
    <div class="container-fluid">
        <jsp:include page="../userheader.jsp"></jsp:include>
        <jsp:include page="../UNavBar.jsp"></jsp:include>

        <input type="hidden" name="workerLatitude" id="latitude" readonly>
        <input type="hidden" name="workerLongitude" id="longitude" readonly>

        <div class="card-container">
            <%
            String serviceName = request.getParameter("serviceName");
            WorkerMod worker = new WorkerMod();
            List<WorkerMod> workerList = worker.getWorkerByServiceName(serviceName);

            for (WorkerMod workerObj : workerList) {
            %>

            <div class="card">
                <div class="preview-pic">
                    <img src='../uploads/<%=workerObj.getWorkerPic()%>' class="img-thumbnail" />
                </div>
                <div class="card-details">
                    <h3 class="product-title"><%=workerObj.getFullName()%></h3>
                    <div class="rating">
                        <p>Registerdate=<%=workerObj.getRegistrationDate()%></p>
                        <h4>Service=<span style=""><%=workerObj.getServiceName()%></span></h4>
                    </div>
                    <h4 class="price">Mobile No: <span><%=Cryptography.decode(workerObj.getMobile())%></span></h4>
                    <p class="vote"></p>
                    <h5 class="sizes">Address: <span><%=workerObj.getCurrentAddress()%></span></h5>
                    <h5 class="colors">Location: <span class="color orange not-available text-success"><%=workerObj.getCities()%></span></h5>
                    <h5 class="colors">Status: 
    <span class="color green text-info">
        <%=workerObj.getStatus()%>
    </span>
</h5>
<div class="action">
    <%
    // Check if status is "Inactive"
    if (workerObj.getStatus().equals("Inactive")) {
    %>
        <button class="btn btn-sm btn-success mt-3 mb-3 btn-book" disabled>Book Now</button>
    <%
    } else {
    %>
        <button class="btn btn-sm btn-success mt-3 mb-3 btn-book" onclick="bookService(<%=workerObj.getWorkerId()%>,'<%=workerObj.getServiceName()%>')">Book Now</button>
    <%
    }
    %>
</div>
                </div>
            </div>

            <%
            }
            %>
        </div>
    </div>
</body>
</html>

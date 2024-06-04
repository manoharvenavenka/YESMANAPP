<%@page import="dbutil.Cryptography"%>
<%@page import="com.example.model.WorkerMod"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../head.jsp" />
    <jsp:include page="../workerstyle.jsp" />
    <style>
        /* Add custom styles for responsiveness */
        body {
            background-color: #1A121E;
            color: white;
        }
        .container {
            margin-top: 20px;
            width: 90%;
            max-width: 600px;
        }
        .card {
            border: none;
            background-color: transparent;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
            margin-bottom: 20px;
        }
        .card-body {
            padding: 20px;
        }
        input[type="text"],
        input[type="password"],
        input[type="Date"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        h1 {
            color: #ffffff;
        }
    </style>
</head>
<body>
    <jsp:include page="../custheader.jsp" />
    <jsp:include page="../workernav.jsp" />
    <%
    String workerId = request.getParameter("workerId");
    WorkerMod worker = new WorkerMod();
    worker = worker.getWorkerDetailsByworkerId(Integer.parseInt(workerId));
    %>
    <center>
        <h1>Edit Worker</h1>
    </center>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <form method="post" action="../UpdateWorkerDet">
                    <center>
                        <label>Worker ID:</label>
                        <input type="number" size="20" name="workerId" value="<%=worker.getWorkerId()%>" readonly><br><br>
                        <label>Full Name:</label>
                        <input type="text" size="20" name="fullName" value="<%=worker.getFullName()%>" required><br><br>
                        <label>Registration Date:</label>
                        <input type="Date" size="20" name="registrationDate" value="<%=worker.getRegistrationDate()%>" required><br><br>
                        <label>Service Name:</label>
                        <input type="text" size="20" name="serviceName" value="<%=worker.getServiceName()%>" /><br><br>
                        <label>Mobile:</label>
                        <input type="text" size="40" name="mobile" value="<%=Cryptography.decode(worker.getMobile())%>" required><br><br>
                        <label>Current Address:</label>
                        <input type="text" size="20" name="currentAddress" value="<%=worker.getCurrentAddress()%>" /><br><br>
                        <label>City:</label>
                        <input type="text" size="20" name="cities" value="<%=worker.getCities()%>" /><br><br>
                        <label>Password:</label>
                        <input type="password" size="20" name="password" value="<%=Cryptography.decode(worker.getPassword())%>" required /><br><br>
                        <input type="submit" value="Update Worker">
                    </center>
                </form>
                <%
                String res = request.getParameter("res");
                if (res != null) {
                    if (res.equals("0")) {
                        out.println("<h4 Style='color:red'>Not updated</h4>");
                    } else {
                        out.println("<h4 Style='color:green'>Updated successfully</h4>");
                    }
                }
                %>
            </div>
        </div>
    </div>
</body>
</html>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.ServicesMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"></jsp:include>
 <style>
        /* Center the form */
        .center-form {
            display: flex;
            justify-content: center;
            align-items: center;
           
        }
    </style>
</head>
<body>
<jsp:include page="../userheader.jsp"></jsp:include>
<jsp:include page="../UNavBar.jsp"></jsp:include>
  
      
   
   

<body>
    <div class="container center-form mb-5">
        <div class="card col-sm-6">
            <h2 class="card-header">Feedback Form</h2>
            <div class="card-body">
               <form action="/YesManApp/submitFeedback" method="post">
                    
                    <div class="form-group">
                        <label for="websiteService">Website/Service:</label>
                        <input type="text" class="form-control" id="websiteService" name="websiteService" required>
                    </div>
                    <div class="form-group">
                        <label for="feedbackMessage">Feedback Message:</label>
                        <textarea class="form-control" id="feedbackMessage" name="feedbackMessage" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 mb-4">Submit Feedback</button>
                </form>
            </div>
        </div>
    </div>
     <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

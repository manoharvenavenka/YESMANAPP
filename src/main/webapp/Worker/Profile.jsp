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

</head>
<body>
        <jsp:include page="../custheader.jsp" />
        <jsp:include page="../workernav.jsp" />
<section>

     <div class="container emp-profile">
<%
	WorkerMod worker = new WorkerMod();
	List<WorkerMod> workerList = worker.getWorkerById((int)session.getAttribute("workerId"));
	%>
	<%
	for (WorkerMod workerObj : workerList) {
	%>
        <div class="row">
            <div class="col-md-4">
                <div class="profile-img">
                     <img src='../uploads/<%=workerObj.getWorkerPic()%>'
                        alt="" />
                    <div class="file btn btn-lg btn-primary">
                       <a
								href='/YesManApp/Worker/EditProfilePic.jsp?tableName=workers&setColName=workerPic&whereColName=workerId&conditionValue=
            <%=workerObj.getWorkerId()%>&colName=workerPic'
								style="text-decoration: none; color: white;"> Change Photo</a>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-head">
                    <h5>
                        <%=workerObj.getFullName()%>
                    </h5>
                    <h6>
                       	<%=workerObj.getServiceName()%>
                    </h6>

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                aria-controls="home" aria-selected="true">About</a>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <a href='EditWorkerProfile.jsp?workerId=<%=workerObj.getWorkerId()%>' style="text-decoration: none;color: rgb(172, 45, 45);"> <input type="button"
                        class="btn btn-sm btn-info text-white" value="Edit Details"></a>

            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="profile-work">

                </div>
            </div>
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Worker Id</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                      <%=workerObj.getWorkerId()%>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <%=workerObj.getFullName()%>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Service Name</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    	<%=workerObj.getServiceName()%>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                            
                            <%
                            
                           String text=workerObj.getMobile();
                            String decode = Cryptography.decode( text);
                			System.out.println("decode = " + decode);
                            %>
                                <label>Phone</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                   <%=decode%>
                                </p>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Current Address</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                   	<%=workerObj.getCurrentAddress()%>
                                </p>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>City</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                  							
							<%=workerObj.getCities()%>

                                </p>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                           
                                <label>Password</label>
                            </div>
                            <div class="col-md-6">
                                <p>
							<%=
									Cryptography.decode(workerObj.getPassword())
							
							%>
                                </p>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
                              
                      <% 
                      } 
                      %>
        
    </div>
   
</section>
<jsp:include page="../footer.jsp" />
      </body>
 
</html>
    <div class="offcanvas offcanvas-start w-25" tabindex="-1" id="offcanvas" data-bs-keyboard="false" data-bs-backdrop="false">
        <div class="offcanvas-header">
            <h6 class="offcanvas-title d-none d-sm-block" id="offcanvas">Menu</h6>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body px-0">
            <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-start" id="menu">
                <li class="nav-item">
                    <a href="AdminHome.jsp" class="nav-link text-truncate">
                        <i class="fs-5 bi-house"></i><span class="ms-1 d-none d-sm-inline">Home</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="#" class="nav-link dropdown-toggle  text-truncate" id="dropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-patch-question"></i><span class="ms-1 d-none d-sm-inline">Services</span>
                    </a>
                    <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdown">
                        <li><a class="dropdown-item" href="AddServices.jsp">Add</a></li>
                        <li><a class="dropdown-item" href="ViewServices.jsp">View</a></li>
                       
                    </ul>
                </li>
                <li>
                    <a href="ViewWorkers.jsp" class="nav-link text-truncate">
                        <i class="bi bi-person-raised-hand"></i><span class="ms-1 d-none d-sm-inline">Workers</span></a>
                </li>
                <li>
                    <a href="AdminReviews.jsp" class="nav-link text-truncate">
                        <i class="bi bi-star-fill"></i><span class="ms-1 d-none d-sm-inline">Reviews</span></a>
                </li>
                <li>
                    <a href="ViewUsers.jsp" class="nav-link text-truncate">
                        <i class="bi bi-person-heart"></i><span class="ms-1 d-none d-sm-inline">Users</span></a>
                </li>
                 <li>
                    <a href="ViewComplaints.jsp" class="nav-link text-truncate">
                        <i class="bi bi-person-heart"></i><span class="ms-1 d-none d-sm-inline">Complaints</span></a>
                </li>
                 <li>
                    <a href="ViewFeedBacks.jsp" class="nav-link text-truncate">
                        <i class="bi bi-person-heart"></i><span class="ms-1 d-none d-sm-inline">FeedBacks</span></a>
                </li>
                
                
                <li>
                  <hr>
                </li>
                <li>
                    <a href="AdminLogout.jsp" class="nav-link text-truncate">
                        <i class="bi bi-box-arrow-right"></i><span class="ms-1 d-none d-sm-inline">LogOut</span></a>
                </li>
               
            </ul>
        </div>
    </div>
   
       
                <!-- toggler -->
                <button class="btn float-middle" data-bs-toggle="offcanvas" data-bs-target="#offcanvas" role="button">
                    <i class="bi bi-list fs-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvas"></i> <h4>Menu</h4></button>
               
         
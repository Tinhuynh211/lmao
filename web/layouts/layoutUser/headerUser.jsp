<%-- 
    Document   : headerUser
    Created on : Oct 19, 2023, 2:50:15 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.UserRegister"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="home.jsp" class="logo d-flex align-items-center">
            <img src="assetsUser/img/logo.png" alt="" width="100">
            <span class="d-none d-lg-block">MangaUniverse</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->


    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item d-block d-lg-none">
                <a class="nav-link nav-icon search-bar-toggle " href="#">
                    <i class="bi bi-search"></i>
                </a>
            </li><!-- End Search Icon-->

            <li class="nav-item dropdown">

                <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                    <i class="bi bi-bell"></i>
                    <span class="badge bg-primary badge-number">0</span>
                </a><!-- End Notification Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                    <li class="dropdown-header">
                        You have 0 new notifications
                        <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                </ul><!-- End Notification Dropdown Items -->

            </li><!-- End Notification Nav -->



            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <c:if test="${userSession != null}">
                        <img  src="${userSession.getAvatarUrl() != '' ? userSession.getAvatarUrl() : 'assetsUser/img/user_image_default.png'}"
                              alt="Profile" class="img-fluid rounded-circle">
                    </c:if>
                    <c:if test="${userSession == null}">
                        <c:if test="${sessionScope.userGooglePicture != null}">
                            <img src="${sessionScope.userGooglePicture}"
                                 alt="Profile" class="img-fluid rounded-circle">
                        </c:if>
                        <c:if test="${sessionScope.userGooglePicture == null}">
                            <img src="${valueAvatarUrl != null ? valueAvatarUrl : 'assetsUser/img/user_image_default.png'}"
                                 alt="Profile" class="img-fluid rounded-circle">
                        </c:if>

                    </c:if>

                    <c:if test="${sessionScope.userSession != null}">
                        <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.userSession.getUsername()}</span>
                    </c:if>
                    <c:if test="${sessionScope.userSession == null}">
                        <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.userRegister.getUsername()}</span>
                    </c:if>

                </a><!-- End Profile Image Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <c:if test="${sessionScope.userSession != null}">
                            <% User user = (User) session.getAttribute("userSession");%>
                            <h6>${sessionScope.userSession.getUsername()}</h6>
                            <% if (user.getRole().equalsIgnoreCase("Free")) {%>
                            <span>${sessionScope.userSession.getRole()}</span>
                            <% } else if (user.getRole().equalsIgnoreCase("Premium")) {%>
                            <span>${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: gold;"></i></span>
                                <% } else if (user.getRole().equalsIgnoreCase("Author")) {%>   
                            <span>${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: greenyellow;"></i></span>
                                <% }%>
                            </c:if>
                            <c:if test="${sessionScope.userSession == null}">
                            <h6>${sessionScope.userRegister.getUsername()}</h6>
                            <span>Free</span>
                        </c:if>


                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                            <i class="bi bi-person"></i>
                            <span>My Profile</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <c:if test="${sessionScope.userSession != null}">
                        <%User u = (User) session.getAttribute("userSession");%>
                        <% if (u.getRole().equalsIgnoreCase("Free")) {%>
                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="upgradePremium.jsp">
                                <i class="bi bi-stars"></i>
                                <span>Upgrade Premium</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <% }%>
                    </c:if>
                    <c:if test="${sessionScope.userSession == null}">
                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="upgradePremium.jsp">
                                <i class="bi bi-stars"></i>
                                <span>Upgrade Premium</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                    </c:if>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                            <i class="bi bi-gear"></i>
                            <span>Account Settings</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="needHelp.jsp">
                            <i class="bi bi-question-circle"></i>
                            <span>Need Help?</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="LogoutServlet">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Sign Out</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->

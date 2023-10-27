<%-- 
    Document   : headerOthers
    Created on : Oct 23, 2023, 2:37:40 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.UserRegister"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center" style="background-color: #191a1c;">

    <div class="d-flex align-items-center justify-content-between">
        <a href="home.jsp" class="logo d-flex align-items-center">
            <img src="assetsMain/img/logo.png" alt="" width="100">
            <span class="d-none d-lg-block" style="color: white">MangaUniverse</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn" style="color: white"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item d-block d-lg-none">
                <a class="nav-link nav-icon search-bar-toggle " href="#">
                    <i class="bi bi-search" style="color: white"></i>
                </a>
            </li><!-- End Search Icon-->

            <li class="nav-item dropdown">

                <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                    <i class="bi bi-bell" style="color: white"></i>
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

            <c:if test="${userSession != null}">
                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <% User u2 = (User) session.getAttribute("userSession");%>
                    <% if (!u2.getAvatarUrl().isEmpty()) {%>
                    <img  src="<%= u2.getAvatarUrl()%>"
                          alt="Profile" class="img-fluid rounded-circle">
                    <% } else {%>
                    <i class="bi bi-person-circle" style="font-size: 30px; color: white"></i>
                    <% }%>

                    <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.userSession.getUsername()}</span>

                </a><!-- End Profile Iamge Icon -->
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">

                    <c:if test="${sessionScope.userSession != null}">
                        <% User u = (User) session.getAttribute("userSession");%>
                        <h6>${sessionScope.userSession.getUsername()}</h6>
                        <% if (u.getRole().equalsIgnoreCase("Free")) {%>
                        <span style="color: black;">${sessionScope.userSession.getRole()}</span>
                        <% } else if (u.getRole().equalsIgnoreCase("Premium")) {%>
                        <span style="color: black;">${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: gold;"></i></span>
                            <% } else if (u.getRole().equalsIgnoreCase("Author")) {%>   
                        <span style="color: black;">${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: greenyellow;"></i></span>
                            <% }%>
                    </c:if>
                    <c:if test="${sessionScope.userSession == null}">
                        <h6>${sessionScope.userRegister.getUsername()}</h6>
                        <span style="color: black;">Free</span>
                    </c:if>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                            <i class="bi bi-person"></i>
                            <span style="color: black;">My Profile</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <c:if test="${sessionScope.userSession != null}">
                        <%User u3 = (User) session.getAttribute("userSession");%>
                        <% if (u3.getRole().equalsIgnoreCase("Free")) {%>
                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                <i class="bi bi-stars"></i>
                                <span style="color: black;">Upgrade Premium</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <% }%>
                    </c:if>
                    <c:if test="${sessionScope.userSession == null}">
                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                <i class="bi bi-stars"></i>
                                <span style="color: black;">Upgrade Premium</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                    </c:if>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                            <i class="bi bi-gear"></i>
                            <span style="color: black;">Account Settings</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="needHelp.jsp">
                            <i class="bi bi-question-circle"></i>
                            <span style="color: black;">Need Help?</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="LogoutServlet">
                            <i class="bi bi-box-arrow-right"></i>
                            <span style="color: black;">Sign Out</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </c:if>
            <c:if test="${userSession == null}">
                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <i class="bi bi-person-circle" style="font-size: 30px; color: white"></i>
                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>Guest</h6>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="needHelp.jsp">
                            <i class="bi bi-question-circle"></i>
                            <span style="color: black;">Need Help?</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="login.jsp">
                            <i class="bi bi-box-arrow-left"></i>
                            <span style="color: black; font-weight: bold">Sign In</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>   

                </ul><!-- End Profile Dropdown Items -->
            </c:if>
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->

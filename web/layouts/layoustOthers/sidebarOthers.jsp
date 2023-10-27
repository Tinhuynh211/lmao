<%-- 
    Document   : sidebarOthers
    Created on : Oct 23, 2023, 2:37:51 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.UserRegister"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ======= Sidebar =======  4154f1 -->
<aside id="sidebar" class="sidebar" style="background-color: #2c2c2c;">
    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link collapsed" href="home.jsp">
                <i class="bi bi-grid"></i>
                <span>Homepage</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="#">
                <i class="bi bi-bookmark"></i><span>Follows</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul class="nav-content">
                <li>
                    <a href="follows/updates.jsp">
                        <i class="bi bi-circle"></i><span>Updates</span>
                    </a>
                </li>
                <li>
                    <a href="follows/readingHistory.jsp">
                        <i class="bi bi-circle"></i><span>Reading History</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Components Nav -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#">
                <i class="bi bi-book"></i><span>Title</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul class="nav-content">
                <li>
                    <a href="title/advancedSearch.jsp">
                        <i class="bi bi-circle"></i><span>Advanced Search</span>
                    </a>
                </li>
                <li>
                    <a href="title/recentlyAdded.jsp">
                        <i class="bi bi-circle"></i><span>Recently Added</span>
                    </a>
                </li>
                <li>
                    <a href="title/latestUpdates.jsp">
                        <i class="bi bi-circle"></i><span>Latest Updates</span>
                    </a>
                </li>
                <li>
                    <a href="title/random.jsp">
                        <i class="bi bi-circle"></i><span>Random</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Components Nav -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="forum/forum.jsp">
                <i class="bi bi-people"></i><span>Forums</span>
            </a>
        </li><!-- End Components Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="#">
                <i class="bi bi-pin-angle"></i><span>MangaUniverse</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul class="nav-content">
                <li>
                    <a href="about/aboutUs.jsp">
                        <i class="bi bi-circle"></i><span>About Us</span>
                    </a>
                </li>
                <li>
                    <a href="about/siteRules.jsp">
                        <i class="bi bi-circle"></i><span>Site Rules</span>
                    </a>
                </li>
                <li>
                    <a href="about/privacyPolicy.jsp">
                        <i class="bi bi-circle"></i><span>Privacy Policy</span>
                    </a>
                </li>
                <li>
                    <a href="about/announcement.jsp">
                        <i class="bi bi-circle"></i><span>Announcements</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Components Nav -->
        <hr>
        <li class="nav-item align-center d-flex justify-content-evenly ">

            <a class=" collapsed" href="#">
                <i class="bi bi-discord fs-4"></i>
            </a>
            <a class="collapsed" href="#">
                <i class="bi bi-twitch fs-4"></i>
            </a>
            <a class="collapsed" href="#">
                <i class="bi bi-reddit fs-4"></i>
            </a>
            <a class="collapsed" href="#">
                <i class="bi bi-facebook fs-4"></i>
            </a>

        </li><!-- End Components Nav -->
        <p style="color: white;">v2023.9.20<br />
            &COPY; MangaUniverse 2023</p>


</aside><!-- End Sidebar-->

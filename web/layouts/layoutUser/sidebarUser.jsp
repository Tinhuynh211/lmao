<%-- 
    Document   : sidebarUser
    Created on : Oct 19, 2023, 3:01:43 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.UserRegister"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <a class="nav-link collapsed" href="home.jsp">
                <i class="bi bi-grid"></i>
                <span>Homepage</span>
            </a> 

        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="userProfile.jsp">
                <i class="bi bi-layout-text-window-reverse"></i><span>My Profile </span><i class="bi"></i>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="addPost.jsp">
                <i class="bi bi-journal-bookmark"></i><span>My Blog </span><i class="bi"></i>
            </a>
        </li>

        <c:if test="${sessionScope.userSession != null}">
            <% User uCheckType = (User) session.getAttribute("userSession"); %>
            <% if (uCheckType.getRole().equalsIgnoreCase("Free") || uCheckType.getRole().equalsIgnoreCase("Premium")) {%>
            <li class="nav-item">
                <a class="nav-link collapsed" href="registerAuthor.jsp">
                    <i class="bi bi-person-workspace"></i>
                    <span>Become an author</span>
                </a>

            </li>
            <% } else if (uCheckType.getRole().equalsIgnoreCase("Author")) {%>   
            <li class="nav-item">
                <a class="nav-link collapsed" href="addManga.jsp">
                    <i class="bi bi-grid"></i>
                    <span>Add Manga</span>
                </a>

            </li>
            <li class="nav-item">

                <a class="nav-link collapsed"  href="#">
                    <i class="bi bi-menu-button-wide"></i><span>My Manga</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content">

                    <li>
                        <a href="viewMangaList.jsp">
                            <i class="bi bi-circle"></i><span>Manga List</span>
                        </a>
                    </li>

                </ul>

            </li>

            <% }%>
        </c:if>
        <c:if test="${sessionScope.userSession == null}">

            <li class="nav-item">
                <a class="nav-link collapsed" href="addManga.jsp">
                    <i class="bi bi-person-workspace"></i>
                    <span>Become an author</span>
                </a>

            </li>

        </c:if>



        <!-- End Components Nav -->

</aside><!-- End Sidebar-->

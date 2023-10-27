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
            <a class="nav-link collapsed" href="mangaVerify.jsp">
                <i class="fa fa-check"></i><span>Verify </span><i class="bi"></i>
            </a>
        </li>
        
        </li>

       <li class="nav-item">
            <a class="nav-link collapsed" href="listUser.jsp">
                <i class="bi bi-list"></i><span>User List </span><i class="bi"></i>
            </a>
        </li>
               <li class="nav-item">
            <a class="nav-link collapsed" href="Transaction.jsp">
                <i class="bi bi-list"></i><span>Transaction List </span><i class="bi"></i>
            </a>
        </li>



        <!-- End Components Nav -->

</aside><!-- End Sidebar-->

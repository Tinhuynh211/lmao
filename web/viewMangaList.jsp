<%@page import="java.util.ArrayList"%>
<%@page import="model.Manga"%>
<%@page import="dal.MangaDAO"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User userSession = (User) session.getAttribute("userSession");
    if (userSession == null) {
        response.sendRedirect("login.jsp");
    }
    
    MangaDAO mangaDAO = new MangaDAO();
    
    ArrayList<Manga> list = mangaDAO.getAllByUserID(userSession.getUserId());
    session.setAttribute("mangaList", list);

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>View Manga List</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assetsUser/img/logo.png" rel="icon">
        <link href="assetsUser/img/logo.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assetsUser/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assetsUser/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assetsUser/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assetsUser/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assetsUser/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assetsUser/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assetsUser/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assetsUser/css/style.css" rel="stylesheet">

    </head>

    <body>

        <%@include file="layouts/layoutUser/headerUser.jsp" %> 
        <%@include file="layouts/layoutUser/sidebarUser.jsp" %>

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>My Manga</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                        <li class="breadcrumb-item">User</li>
                        <li class="breadcrumb-item active">My Manga List</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body card-title">
                                <h5 class="card-title">My Manga</h5>
                                <hr>
                                <c:if test="${sessionScope.userSession == null}">   
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <i class="bi bi-exclamation-octagon me-1"></i>
                                        Please fill in your personal information to access features!
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if> 
                                <c:if test="${sessionScope.userSession != null}">
                                    <% User u2 = (User) session.getAttribute("userSession");%>
                                    <% if (u2.getRole().equalsIgnoreCase("Free") || u2.getRole().equalsIgnoreCase("Premium")) {%>
                                    <div class="alert alert-warning bg-warning border-0 alert-dismissible fade show" role="alert">
                                        You have no permission to View Manga List! If you want to be an Author, please click <a href="registerAuthor.jsp">here</a> to register
                                        an author!
                                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                                    </div>

                                    <% }%>
                                    <% if (u2.getRole().equalsIgnoreCase("Author")) {

                                    %>
                                    <div id="content" class="">
                                        <c:if test="${sessionScope.mangaList != null}">
                                            <c:forEach items="${sessionScope.mangaList}" var="manga" varStatus="loop">

                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-3 text-right">
                                                            <label class="control-label" for="Name">${loop.index + 1}</label>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <a href="MangaDetailServlet?id=${manga.getMangaID()}">${manga.getTitle()}</a>
                                                        </div>
                                                        <div class="col-sm-5 row">
                                                            <div class=" col-sm-4 text-center">
                                                                <a href="ViewChapterServlet?id=${manga.getMangaID()}" class="btn btn-dark">Chapter</a>
                                                            </div>
                                                            <div class="col-sm-4 text-center">
                                                                <a href="EditMangaServlet?id=${manga.getMangaID()}" class="btn btn-primary">Edit <i class="bi bi-pencil-square"></i></a>
                                                            </div>
                                                            <div class="col-sm-4 text-center">
                                                                <form action="DeleteMangaServlet" method="POST">
                                                                    <input type="hidden" name="id" value="${manga.getMangaID()}">
                                                                    <button type="submit" class="btn btn-danger">Delete <i class="bi bi-trash"></i></button>
                                                                </form>
                                                                
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>


                                            </c:forEach>
                                        </c:if>
                                    </div>


                                    <%}%>
                                </c:if>



                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main><!-- End #main -->


        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assetsUser/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assetsUser/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assetsUser/vendor/chart.js/chart.umd.js"></script>
        <script src="assetsUser/vendor/echarts/echarts.min.js"></script>
        <script src="assetsUser/vendor/quill/quill.min.js"></script>
        <script src="assetsUser/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assetsUser/vendor/tinymce/tinymce.min.js"></script>
        <script src="assetsUser/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assetsUser/js/main.js"></script>

    </body>

</html>
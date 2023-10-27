<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    if (session.getAttribute("userSession") == null) {
        response.sendRedirect("login.jsp");
    }


%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Add new Chapter</title>
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
                <h1>(Name of manga)</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">New Chapter</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center;">You have post chapter successfully!</h5>

                                <div class="d-flex justify-content-around">
                                    <button type="button" class="btn btn-primary">
                                        <a href="viewMangaList.jsp" style="color: white;">View chapter list</a>
                                    </button>
                                    <button type="button" class="btn btn-primary">
                                        <a href="addManga.jsp" style="color: white;">Edit Manga Information</a>
                                    </button>
                                    <button type="button" class="btn btn-primary">
                                        <a href="home.jsp" style="color: white;">Back to homepage</a>
                                    </button>
                                </div>
                                <!-- End Quill Editor Default -->

                            </div>
                        </div>




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
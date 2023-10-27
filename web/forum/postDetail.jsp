<%@page import="java.util.ArrayList"%>
<%@page import="model.Post"%>
<%@page import="dal.PostDAO"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="../assetsMain/img/logo.png" rel="icon">
        <link href="../assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="../assetsMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assetsMain/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="../assetsMain/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="../assetsMain/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="../assetsMain/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="../assetsMain/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="../assetsMain/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="../assetsMain/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>

    <body>

        <%@include file="../layouts/layoutsMain/headerMain.jsp" %> 
        <%@include file="../layouts/layoutsMain/sidebarMain.jsp" %> 

        <main id="main" class="main">
            <section class="section profile">
                <div class="row">
                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        Blog part start
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

                    <%
                        PostDAO postDAO = new PostDAO();
                        ArrayList<Post> postList = postDAO.getAll();
                        if (postList != null) {
                            for (Post p : postList) {
                                User userFromPostDetail = postDAO.getUserByPost(p.getUserId());
                                if (userFromPostDetail != null) {
                                    session.setAttribute("userFromPostDetail", userFromPostDetail);
                                    break;
                                }
                            }

                        }


                    %>
                    <h2 class="fw-bold">Blog Detail</h2>
                    <section class="blog-detail sec-mar">
                        <div class="container">
                            <div class="row">
                                <c:if test="${sessionScope.postDetail != null}">
                                    <div class="col-lg-9" style="margin: 0 auto">
                                        <img alt=""
                                             src="${sessionScope.postDetail.getImgUrl()}">
                                        <div class="text-details">
                                            <p class="text-end author pt-3"><b>Manga -</b> ${sessionScope.postDetail.getCreateAtFormat()}</p>
                                            <h4>${sessionScope.postDetail.getTitle()} </h4>
                                            <p class="mb-4">${sessionScope.postDetail.getDescription()} </p>
                                            <div class="text-box mb-4 text-center">
                                                &copy; Created by ${userFromPostDetail.getUsername()}
                                            </div>

                                        </div>
                                    </div>
                                </c:if>


                            </div>
                        </div>
                    </section>
                </div>
            </section>
        </main>


        <c:if test="${userSession == null || userSession.getRole().equals('Free')}">
            <%@include file="../layouts/layoutsMain/adsMain.jsp" %>
        </c:if>

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="../assetsMain/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="../assetsMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assetsMain/vendor/chart.js/chart.umd.js"></script>
        <script src="../assetsMain/vendor/echarts/echarts.min.js"></script>
        <script src="../assetsMain/vendor/quill/quill.min.js"></script>
        <script src="../assetsMain/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="../assetsMain/vendor/tinymce/tinymce.min.js"></script>
        <script src="../assetsMain/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="../assetsMain/js/main.js"></script>
    </body>

</html>
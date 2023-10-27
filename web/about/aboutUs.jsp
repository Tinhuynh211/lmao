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
                    <h2 class="fw-bold">About Us</h2>
                    <p>MangaUniverse is an online manga reader that caters to all languages. MangaDex is made by scanlators,
                        for
                        scanlators, and gives active scanlation groups complete control over their releases. All of the
                        content on our site is uploaded either by users, scanlation groups, and in some instances the
                        publishers themselves. </p>
                    <p>MangaUniverse was created in January 2023 by the former admin and sole developer, Hologfx. Since
                        then,
                        MangaDex has been steadily growing, approaching 14 million unique visitors per month. The site is
                        currently ran by 21+ unpaid volunteers.</p>
                </div>
                <div class="alert" role="alert">
                    <span>
                        <p>If someone contacts you on Discord claiming to be MangaUniverse staff, verify that their account
                            id
                            matches.</p>
                        <p class="font-semibold">Our staff members will NEVER ask for your password or for money. No
                            exceptions.</p>
                    </span>
                </div>
                <p>We fund our servers primarily through our affiliate programs. In the past user donations had generously
                    kept our servers going but now we use the leftover from it on our DDoS mitigation. Our affiliates are
                    generally services that have helped us out tremendously or that we use ourselves. We may run
                    non-intrusive ads as a last resort when our other funding options fail, but for the most part we'd like
                    to keep it this way out of our personal distaste for ads.</p>
            </section>
        </main>




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
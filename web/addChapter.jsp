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

        <style>
            .image-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
                gap: 10px;
                padding: 30px;
            }

            .image-grid-item {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                /* Để ảnh không bị méo */
            }
        </style>

    </head>

    <body>

        <%@include file="layouts/layoutUser/headerUser.jsp" %> 
        <%@include file="layouts/layoutUser/sidebarUser.jsp" %>

        <main id="main" class="main">

            <div class="pagetitle">

                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="userProfile.jsp">User</a></li>
                        <li class="breadcrumb-item"><a href="viewMangaList.jsp">My Manga List</a></li>
                        <li class="breadcrumb-item">${mangaToAddChapter.getTitle()}</li>
                        <li class="breadcrumb-item active">Add Chapter</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body card-title">
                                <h3 class="card-title">${mangaToAddChapter.getTitle()}</h3>
                                <hr>
                                <c:if test="${sessionScope.userSession == null}">   
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <i class="bi bi-exclamation-octagon me-1"></i>
                                        Please fill in your personal information to access features!
                                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                                    </div>
                                </c:if> 
                                <c:if test="${sessionScope.userSession != null}">
                                    <% User u2 = (User) session.getAttribute("userSession");%>
                                    <% if (u2.getRole().equalsIgnoreCase("Free") || u2.getRole().equalsIgnoreCase("Premium")) {%>
                                    <div class="alert alert-warning bg-warning border-0 alert-dismissible fade show" role="alert">
                                        You have no permission to Add Chapter! If you want to be an Author, please click <a href="registerAuthor.jsp">here</a> to register an author!
                                        <!-- <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button> -->
                                    </div>

                                    <% }%>

                                </c:if>

                            </div>
                        </div>

                        <c:if test="${sessionScope.userSession != null}">
                            <% User u3 = (User) session.getAttribute("userSession");%>
                            <% if (u3.getRole().equalsIgnoreCase("Author")) {%>
                            <div class="card">
                                <div class="card-body">
                                    <form action="AddChapterServlet" method="POST">
                                        <h5 class="card-title">Chapter Name</h5>

                                        <!-- Quill Editor Default -->
                                        <div>
                                            <input class="form-control" placeholder="Chapter Name" name="title" type="text" value="">
                                        </div>
                                        <h5 class="card-title">Description</h5>

                                        <!-- Quill Editor Default -->
                                        <div>
                                            <input class="form-control" placeholder="Description" name="description" type="text" value="">
                                        </div>
                                        <h5 class="card-title">Image</h5>
                                        <div class="row mb-3">
                                            <label for="postImage" class="col-md-4 col-lg-3 col-form-label">Post Image</label>
                                            <div class="col-md-8 col-lg-9" id="divSvgContainer">


                                                <!-- ----------------- -->
                                                <div id="feedback"></div>
                                                <label id="progress-label" for="progress">0%</label>
                                                <progress id="progress" value="0" max="100"></progress>
                                                <div id="image-grid" class="image-grid">
                                                    <img id="imagePreview" src="assetsUser/img/no_image.jpg" alt="Post Image">
                                                </div>
                                                <!-- ----------------- -->


                                                <div class="pt-2 d-flex align-center gap-2">
                                                    <input type="file" name="postImage" id="postImage" style="display: none;" accept="image/*" multiple>

                                                    <label id="uploadButton" for="postImage" class="btn btn-primary btn-sm"
                                                           title="Upload new post image"><i class="bi bi-upload text-white"></i></label>

                                                    <a href="#" class="btn btn-danger btn-sm" title="Remove my post image" id="removeImage"><i
                                                            class="bi bi-trash"></i></a>
                                                    <div id="spinnerUpload" class="spinner-border text-success" role="status" style="display: none;">
                                                        <span class="visually-hidden">Loading...</span>
                                                    </div>
                                                </div>


                                            </div>
                                            <div id="postUrls">
                                                <!--...-->
                                            </div>
                                        </div>
                                        <!--                                     Quill Editor Full 
                                                                            <div class="card-content">
                                                                                <textarea class="form-control" placeholder="Content" rows="10"></textarea>
                                                                                 End Quill Editor Full 
                                                                            </div>-->

                                        <div class="form-group-update">
                                            <div class="row">
                                                <div class="col-sm-3 text-right">
                                                </div>

                                                <div class="col-sm-9">
                                                    
                                                    <input type="hidden" name="mangaID" value="${mangaToAddChapter.getMangaID()}">
                                                    <button id="submitButton" type="submit" class="btn btn-primary">Add Chapter</button>
                                                    <c:if test="${messageAdd != null}">
                                                        <br/>
                                                        <small class="small" style="color: green;">${messageAdd}</small> 
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                            <%}%>
                        </c:if>


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
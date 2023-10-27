<%@page import="dal.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Post"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.UserRegister"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("userSession") == null) {
        response.sendRedirect("login.jsp");
    } else {
        PostDAO postDAO = new PostDAO();
        User userSession = (User) session.getAttribute("userSession");
        ArrayList<Post> postList = postDAO.getAllByUserId(userSession.getUserId());
        session.setAttribute("postListByUserId", postList);

    }

%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Users / Profile</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assetsUser/img/logo.png" rel="icon">
        <link href="assetsUser/img/apple-touch-icon.png" rel="apple-touch-icon">

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
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Template Main CSS File -->
        <link href="assetsUser/css/style.css" rel="stylesheet">

    </head>

    <body>

        <%@include file="layouts/layoutUser/headerUser.jsp" %> 
        <%@include file="layouts/layoutUser/sidebarUser.jsp" %>

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>My Post</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="userProfile.jsp">User</a></li>
                        <li class="breadcrumb-item active">Post</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">

                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Add Post</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Edit Post</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-change-password">View
                                            Post</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-forgot-password">Delete
                                            Post</button>
                                    </li>

                                </ul>
                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                                        <!-- Add Post Form -->
                                        <form action="AddPostServlet" method="POST" accept-charset="UTF-8">
                                            <div class="row mb-3">
                                                <label for="postImage" class="col-md-4 col-lg-3 col-form-label">Post Image</label>
                                                <div class="col-md-8 col-lg-9" id="divSvgContainer">

                                                    <img id="imagePreview" src="assetsUser/img/no_image.jpg" alt="Post Image">

                                                    <div class="pt-2 d-flex align-center gap-2">
                                                        <input type="file" name="postImage" id="postImage" style="display: none;" accept="image/*">

                                                        <label id="uploadButton" for="postImage" class="btn btn-primary btn-sm" title="Upload new post image"><i
                                                                class="bi bi-upload text-white"></i></label>

                                                        <a href="#" class="btn btn-danger btn-sm" title="Remove my post image" id="removeImage"><i
                                                                class="bi bi-trash"></i></a>
                                                        <div id="spinnerUpload" class="spinner-border text-success" role="status" style="display: none;">
                                                            <span class="visually-hidden">Loading...</span>
                                                        </div>
                                                    </div>
                                                    <c:if test="${errPostImage != null}">
                                                        <small class="small" style="color: red;">${errPostImage}</small> 
                                                    </c:if>

                                                </div>
                                                <input type="hidden" name="postUrl" id="postUrl" value="">
                                            </div>
                                            <div class="row mb-3">
                                                <label for="title" class="col-md-4 col-lg-3 col-form-label">Title</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="title" type="text" class="form-control" id="title" placeholder="Title" value="">
                                                    <c:if test="${errTitle != null}">
                                                        <small class="small" style="color: red;">${errTitle}</small> 
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="content" class="col-md-4 col-lg-3 col-form-label">Description</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <textarea name="description" class="form-control" id="content"
                                                              style="height: 150px" placeholder="Description"></textarea>
                                                    <c:if test="${errDescription != null}">
                                                        <small class="small" style="color: red;">${errDescription}</small> 
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="text-center">
                                                <button id="submitButton" type="submit" class="btn btn-primary">Upload</button>
                                                <c:if test="${messageUpload != null}">
                                                    <br/>
                                                    <small class="small" style="color: green;">${messageUpload}</small> 
                                                </c:if>
                                            </div>
                                        </form><!-- End Add Post Form -->

                                    </div>

                                    <div class="tab-pane profile-edit fade pt-3" id="profile-settings">

                                        <!-- Edit Post Form -->


                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-body card-title">
                                                            <h5 class="card-title">Choose Post To Edit</h5>
                                                            <c:if test="${messageSavePost != null}">
                                                                <p class="small" style="color: green;">${messageSavePost}</p> 
                                                                <%
                                                                    session.removeAttribute("messageSavePost");
                                                                %>
                                                            </c:if>

                                                            <hr>

                                                            <c:if test="${sessionScope.postListByUserId != null}">
                                                                <c:forEach items="${postListByUserId}" var="post" varStatus="loop">
                                                                    <form action="EditPostServlet" method="GET">
                                                                        <div class="form-group">
                                                                            <div class="row">
                                                                                <div class="col-sm-3 text-right">
                                                                                    <label class="control-label" for="Name">${loop.index + 1}</label>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <a href="PostDetailServlet?postID=${post.getPostId()}&userID=${sessionScope.userSession.getUserId()}">${post.getTitle()}</a>
                                                                                </div>
                                                                                <div class="col-sm-3">
                                                                                    <div class="text-center">
                                                                                        <input type="hidden" name="id" value="${post.getPostId()}">
                                                                                        <button type="submit" class="btn btn-primary">Edit <i class="bi bi-pencil-square"></i></button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </c:forEach>

                                                            </c:if><!-- End Edit Post Form -->

                                                        </div>

                                                    </div>

                                                    <!-- when click post must display block -->
                                                    <c:if test="${editPost == true}">
                                                        <form class="${editPost == true ? 'd-block' : 'd-none'}" action="EditPostServlet" method="POST" accept-charset="UTF-8">
                                                            <div class="row mb-3">
                                                                <label for="postImage" class="col-md-4 col-lg-3 col-form-label">Post Image</label>
                                                                <div class="col-md-8 col-lg-9" id="divSvgContainer">

                                                                    <img id="imagePreview" src="${sessionScope.post.getImgUrl()}" alt="Post Image">

                                                                    <div class="pt-2 d-flex align-center gap-2">
                                                                        <input type="file" name="postImage" id="postImage" style="display: none;" accept="image/*">

                                                                        <label id="uploadButton" for="postImage" class="btn btn-primary btn-sm" title="Upload new post image"><i
                                                                                class="bi bi-upload text-white"></i></label>

                                                                        <a href="#" class="btn btn-danger btn-sm" title="Remove my post image" id="removeImage"><i
                                                                                class="bi bi-trash"></i></a>
                                                                        <div id="spinnerUpload" class="spinner-border text-success" role="status" style="display: none;">
                                                                            <span class="visually-hidden">Loading...</span>
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${errPostImage != null}">
                                                                        <small class="small" style="color: red;">${errPostImage}</small> 
                                                                    </c:if>

                                                                </div>
                                                                <input type="hidden" name="postUrl" id="postUrl" value="${sessionScope.post.getImgUrl()}">
                                                            </div>
                                                            <div class="row mb-3">
                                                                <label for="title" class="col-md-4 col-lg-3 col-form-label">Title</label>
                                                                <div class="col-md-8 col-lg-9">
                                                                    <input name="title" type="text" class="form-control" id="title" placeholder="Title" 
                                                                           value="${sessionScope.post.getTitle()}">
                                                                    <c:if test="${errTitle != null}">
                                                                        <small class="small" style="color: red;">${errTitle}</small> 
                                                                    </c:if>
                                                                </div>
                                                            </div>

                                                            <div class="row mb-3">
                                                                <label for="content" class="col-md-4 col-lg-3 col-form-label">Description</label>
                                                                <div class="col-md-8 col-lg-9">
                                                                    <textarea name="description" class="form-control" id="content"
                                                                              style="height: 150px" placeholder="Description">${sessionScope.post.getDescription()}</textarea>
                                                                    <c:if test="${errDescription != null}">
                                                                        <small class="small" style="color: red;">${errDescription}</small> 
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                            <div class="text-center">
                                                                <button id="submitButton" type="submit" class="btn btn-primary">Save Changes</button>

                                                            </div>


                                                        </form>
                                                    </c:if>



                                                </div>
                                            </div>
                                        </section>


                                    </div>

                                    <div class="tab-pane fade show active pt-3" id="profile-change-password">

                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-body card-title">
                                                            <h5 class="card-title">Your Post List</h5>
                                                            <hr>

                                                            <c:if test="${sessionScope.postListByUserId != null}">
                                                                <form action="" method="">
                                                                    <c:forEach items="${postListByUserId}" var="post" varStatus="loop">
                                                                        <div class="form-group">
                                                                            <div class="row">
                                                                                <div class="col-sm-3 text-right">
                                                                                    <label class="control-label" for="Name">${loop.index + 1}</label>
                                                                                </div>
                                                                                <div class="col-sm-9">
                                                                                    <a href="PostDetailServlet?postID=${post.getPostId()}&userID=${sessionScope.userSession.getUserId()}">${post.getTitle()}</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </form>
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>
                                    <div class="tab-pane fade pt-3" id="profile-forgot-password">
                                        <!-- Delete Post Form -->
                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-body card-title">
                                                            <h5 class="card-title">Choose Post To Delete</h5>
                                                            <hr>
                                                            <div class="form-group">
                                                                <form action="DeletePostServet" method="GET" >
                                                                    <c:if test="${sessionScope.postListByUserId != null}">

                                                                        <c:forEach items="${postListByUserId}" var="post" varStatus="loop">
                                                                            <div class="form-group">
                                                                                <div class="row">
                                                                                    <div class="col-sm-3 text-right">
                                                                                        <label class="control-label" for="Name">${loop.index + 1}</label>
                                                                                    </div>
                                                                                    <div class="col-sm-6">
                                                                                        <a href="PostDetailServlet?postID=${post.getPostId()}&userID=${sessionScope.userSession.getUserId()}">${post.getTitle()}</a>
                                                                                    </div>
                                                                                    <div class="col-sm-3">
                                                                                        <input type="checkbox" name="selectedPosts" id="myCheckbox" value="${post.getPostId()}" style="transform: scale(2);">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>

                                                                    </c:if>

                                                                    <div class="text-center">
                                                                        <button type="submit" class="btn btn-danger">Delete Post</button>
                                                                    </div> 
                                                                </form>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                        </section>

                                    </div><!-- End Delete Post Form -->

                                </div><!-- End Bordered Tabs -->

                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->
        <script>

            document.addEventListener("DOMContentLoaded", function () {
                const fileInput = document.getElementById("postImage");
                const imagePreview = document.getElementById("imagePreview");
                const removeImage = document.getElementById("removeImage");
                const postUrl = document.getElementById("postUrl");
                const submitButton = document.getElementById("submitButton");
                const uploadButton = document.getElementById("uploadButton");
                const spinnerUpload = document.getElementById("spinnerUpload");


                let isImageSelected = false;

                uploadButton.addEventListener("click", function () {
                    fileInput.addEventListener("change", function (changeEvent) {
                        updateSubmitButtonState();
                        updateSpinnerUploadState();
                        const file = changeEvent.target.files[0];
                        if (file) {
                            const formData = new FormData();
                            formData.append("file", file);
                            formData.append("upload_preset", "demo_manga");

                            fetch("https://api.cloudinary.com/v1_1/djytvqlon/image/upload", {
                                method: "POST",
                                body: formData,
                            })
                                    .then((response) => response.json())
                                    .then((data) => {

                                        // updateSpinnerUploadState();
                                        imagePreview.src = data.url;
                                        postUrl.value = data.url;
                                        isImageSelected = true;
                                        updateSpinnerUploadState();
                                        updateSubmitButtonState();
                                    })
                                    .catch((error) => {
                                        console.error("Error:", error);
                                    });
                        }
                    });


                });

                removeImage.addEventListener("click", function () {
                    imagePreview.src = "assetsUser/img/no_image.jpg";
                    postUrl.value = "";
                    fileInput.value = "";
                    isImageSelected = true;
                    updateSubmitButtonState();

                });

                function updateSubmitButtonState() {
                    if (isImageSelected) {
                        submitButton.removeAttribute("disabled");
                    } else {
                        submitButton.setAttribute("disabled", "disabled");
                    }
                }
                function updateSpinnerUploadState() {
                    if (isImageSelected) {
                        spinnerUpload.style.display = "none";
                    } else {
                        spinnerUpload.style.display = "inline-block";
                    }
                }
            });


        </script>
        <script>
            // Lấy form theo ID
            var form = document.getElementById("postForm");

            // Gắn sự kiện "submit" cho form
            form.addEventListener("submit", function (event) {
                // Lấy tất cả các ô checkbox trong form
                var checkboxes = form.querySelectorAll('input[type="checkbox"]');

                // Lặp qua từng ô checkbox và kiểm tra xem nó đã được chọn chưa
                for (var i = 0; i < checkboxes.length; i++) {
                    var checkbox = checkboxes[i];

                    if (checkbox.checked) {
                        // Nếu ô checkbox đã được chọn, gán giá trị rỗng cho nó
                        checkbox.value = "";
                    }
                }
            });
        </script>


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
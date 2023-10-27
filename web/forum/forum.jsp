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

        <!-- Favicons -->
        <link href="${pageContext.request.contextPath}/assetsMain/img/logo.png" rel="icon">
        <link href="${pageContext.request.contextPath}/assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/assetsMain/css/style.css" rel="stylesheet">
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
                    <h2 class="fw-bold">Blogs</h2>

                    <section class="blog style-1 sec-mar">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-8">
                                    <%
                                        PostDAO postDAO = new PostDAO();

                                        ArrayList<Post> postList = (ArrayList<Post>) session.getAttribute("postList");

                                        if (postList == null) {
                                            int count = postDAO.getTotalPost();
                                            int endPage = count / 4; // each page has 4 posts

                                            if (count % 4 != 0) {
                                                endPage++;

                                                postList = postDAO.pagingPostList(1);
                                                session.setAttribute("postList", postList);
                                                session.setAttribute("endPage", endPage);
                                                session.setAttribute("tag", 1);
                                            }
                                        }

                                        ArrayList<User> userListByPost = new ArrayList<>();
                                        for (Post p : postList) {
                                            User user = postDAO.getUserByPost(p.getUserId());
                                            userListByPost.add(user);
                                        }
                                        session.setAttribute("userListByPost", userListByPost);
                                    %>
                                    <div id="content">

                                        <div class="row">

                                            <c:if test="${postList != null}">

                                                <c:forEach items="${postList}" var="post" varStatus="loop">

                                                    <div class="col-lg-6 col-md-6 col-12 mb-4">
                                                        <a href="/MangaUniverse/PostDetailServlet?postID=${post.getPostId()}&userID=${userListByPost[loop.index].getUserId()}" class="inner-box">
                                                            <div class="image-box">
                                                                <img src="${post.getImgUrl()}"
                                                                     alt="" class="attachment-full size-full w-100">
                                                            </div>
                                                            <div class="author-box text-start">
                                                                <div class="detail d-flex align-items-center justify-content-between">
                                                                    <p>${post.getCreateAtFormat()}</p>
                                                                    <p>Manga</p>
                                                                </div>
                                                                <h4>${post.getTitle()} </h4>

                                                                <div class="d-flex align-items-center">
                                                                    <img src="${userListByPost[loop.index].getAvatarUrl() != null ? userListByPost[loop.index].getAvatarUrl() : '../assetsUser/img/user_image_default.png'}"
                                                                         class="w-auto" alt="" style="width: 50px; height: 50px">
                                                                    <h5>${userListByPost[loop.index].getUsername()}</h5>

                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>

                                                </c:forEach>
                                            </c:if>


                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-4">
                                    <div class="card blog-sidebar">
                                        <div class="card-body bg-color-black">
                                            <div class="input-group form-group mb-4">
                                                <input oninput="searchByTitle(this)" value="${txtS}" class="form-control" name="txt" placeholder="Search">
                                                <button class="input-group-text anime-btn" type="submit"><i
                                                        class="bi bi-search" style="color: white;"></i></button>
                                            </div>

                                            <h5 class="mb-2 mt-4">Popular Blogs</h5>
                                            <ul class="popular-blogs">
                                                <div id="postSearchContent">
                                                    <%
                                                        ArrayList<Post> threePostlist = postDAO.getThreePost();
                                                        session.setAttribute("threePostlist", threePostlist);

                                                        ArrayList<User> userListByThreePost = new ArrayList<>();
                                                        for (Post p : postList) {
                                                            User user = postDAO.getUserByPost(p.getUserId());
                                                            userListByThreePost.add(user);
                                                        }
                                                        session.setAttribute("userListByThreePost", userListByThreePost);
                                                    %>
                                                    <c:if test="${sessionScope.threePostlist != null}">
                                                        <c:forEach items="${threePostlist}" var="post" varStatus="loop">
                                                            <li class="post-item">
                                                                <a href="/MangaUniverse/PostDetailServlet?postID=${post.getPostId()}&userID=${userListByThreePost[loop.index].getUserId()}">
                                                                    <div class="row align-items-center">
                                                                        <div class="col-5">
                                                                            <img alt=""
                                                                                 src="${post.getImgUrl()}">
                                                                        </div>
                                                                        <div class="col-7 ps-0">
                                                                            <p class="date">${post.getCreateAtFormat()}</p>
                                                                            <h6 class="mb-0">${post.getTitle()}</h6>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </li>
                                                        </c:forEach>

                                                    </c:if>

                                                </div>
                                                <div class="text-center mt-5">
                                                    <button id="submitButton" onclick="loadMore()" class="btn btn-primary">Load more</button>
                                                </div>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="pagination-wrape">

                                <ul class="pagination">
                                    <c:if test="${tag > 1}">
                                        <li class="page-item">
                                            <a href="/MangaUniverse/PostListPagingServlet?index=${tag-1}" class="page-link arrow" aria-label="Previous">
                                                <i class="bi bi-caret-left-fill"></i>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="1" end="${endPage}" var="i">
                                        <li class="page-item">
                                            <a href="/MangaUniverse/PostListPagingServlet?index=${i}" class="page-link current">${i}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${tag < endPage}">
                                        <li class="page-item">
                                            <a id="nextPageLink" href="/MangaUniverse/PostListPagingServlet?index=${tag+1}" 
                                               onclick="" class="page-link arrow" aria-label="next">
                                                <i class="bi bi-caret-right-fill"></i>
                                            </a>
                                        </li>
                                    </c:if>

                                </ul>
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

        <script>
            function searchByTitle(inputElement) {
                var searchText = inputElement.value;
                $.ajax({
                    type: "GET",
                    url: "/MangaUniverse/SearchPostByAjax",
                    data: {txt: searchText},
                    success: function (data) {
                        // Xử lý dữ liệu trả về từ máy chủ và cập nhật nội dung trang web
//                            $("#content").html(data);
                        $("#postSearchContent").html(data);
                    },
                    error: function (xhr, status, error) {
                        // Xử lý lỗi (nếu có)
                        console.log("Lỗi: " + error);
                    }
                });
            }

            function loadMore() {
                var amountPost = $("#postSearchContent li").length;
                $.ajax({
                    type: "GET",
                    url: "/MangaUniverse/LoadMorePostServlet",
                    data: {existPost: amountPost},
                    success: function (data) {
                        $("#postSearchContent").append(data);
                    },
                    error: function (xhr, status, error) {
                        console.log("Lỗi: " + error);
                    }
                });
            }


            $(document).ready(function () {
                $(document).on("click", ".page-link", function (event) {
                    event.preventDefault();
                    var url = $(this).attr("href");
                    $.ajax({
                        type: "GET",
                        url: url,
                        success: function (data) {
                            var content = JSON.parse(data.newContent); // Chuyển chuỗi JSON thành mảng JavaScript

                            // Xóa nội dung cũ
                            $("#content .row").empty();

                            // Lặp qua từng phần tử trong mảng content
                            $.each(content, function (index, post) {
                                // Tạo mã HTML cho phần tử và gắn các giá trị
                                console.log("Id: " + post.postId);
                                var html = '<div class="col-lg-6 col-md-6 col-12 mb-4">' +
                                        '<a href="/MangaUniverse/PostDetailServlet?postID=' + post.postId + '&userID=' + post.userId + '" class="inner-box">' +
                                        '<div class="image-box">' +
                                        '<img src="' + post.imgUrl + '" alt="" class="attachment-full size-full w-100">' +
                                        '</div>' +
                                        '<div class="author-box text-start">' +
                                        '<div class="detail d-flex align-items-center justify-content-between">' +
                                        '<p>' + post.createAtFormat + '</p>' +
                                        '<p>Manga</p>' +
                                        '</div>' +
                                        '<h4>' + post.title + '</h4>' +
                                        '<div class="d-flex align-items-center">' +
                                        '<img src="' + post.avatarUrl + '" class="w-auto" alt="" style="width: 50px; height: 50px">' +
                                        '<h5>' + post.username + '</h5>' +
                                        '</div>' +
                                        '</div>' +
                                        '</a>' +
                                        '</div>';
                                $("#content .row").append(html);
                            });

                            // Xóa nội dung cũ của phân trang (pagination)
                            $(".pagination").empty();

                            if (data.tag > 1) {
                                // Thêm nút Previous nếu có
                                var previousPage = '<li class="page-item">' +
                                        '<a href="/MangaUniverse/PostListPagingServlet?index=' + (data.tag - 1) + '" class="page-link arrow" aria-label="Previous">' +
                                        '<i class="bi bi-caret-left-fill"></i>' +
                                        '</a>' +
                                        '</li>';
                                $(".pagination").append(previousPage);
                            }

                            for (var i = 1; i <= data.endPage; i++) {
                                // Thêm các trang cố định
                                var pageLink = '<li class="page-item">' +
                                        '<a href="/MangaUniverse/PostListPagingServlet?index=' + i + '" class="page-link current">' + i + '</a>' +
                                        '</li>';
                                $(".pagination").append(pageLink);
                            }

                            if (data.tag < data.endPage) {
                                // Thêm nút Next nếu có
                                var nextPage = '<li class="page-item">' +
                                        '<a id="nextPageLink" href="/MangaUniverse/PostListPagingServlet?index=' + (data.tag + 1) + '" onclick="" class="page-link arrow" aria-label="next">' +
                                        '<i class="bi bi-caret-right-fill"></i>' +
                                        '</a>' +
                                        '</li>';
                                $(".pagination").append(nextPage);
                            }
                        },
                        error: function (xhr, status, error) {
                            console.log("Lỗi: " + error);
                        }
                    });
                });
            });

        </script>

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
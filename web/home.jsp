<%@page import="dal.UserDAO"%>
<%@page import="dal.CategoryDAO"%>
<%@page import="dal.MangaDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Manga"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // session.removeAttribute("tokenVerify");
    String tokenVerify = (String) session.getAttribute("tokenVerify");
    // out.println(tokenVerify); // 'null' or 'tokenVerify'

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Users / Profile</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assetsMain/img/logo.png" rel="icon">
        <link href="assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assetsMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assetsMain/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assetsMain/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assetsMain/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assetsMain/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assetsMain/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assetsMain/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assetsMain/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Ajax -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>

    <body>

        <%@include file="layouts/layoustOthers/headerOthers.jsp" %> 
        <%@include file="layouts/layoustOthers/sidebarOthers.jsp" %> 
        
        <%
            MangaDAO mangaDAO = new MangaDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            UserDAO userDAO = new UserDAO();

            // tam thoi dung getALL Manga
            session.setAttribute("mangaListUpdates", mangaDAO.getAll());
        %>

        <main id="main" class="main">
            <section class="section profile">
                <div class="row">

                    <!-- -------------------- -->
                    <main>

                        <div class="mb-5">
                            <h2 class="fw-bold fs-1">Popular New Feed</h2>
                            <c:if test="${sessionScope.user != null}">

                                <c:out value="${user.getExpiredTime()}"></c:out>
                            </c:if>
                            <div id="carousel">

                                <div class="hideLeft">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-1.PNG"></a>
                                </div>

                                <div class="prevLeftSecond">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-2.PNG"></a>
                                </div>

                                <div class="prev">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-3.PNG"></a>
                                </div>

                                <div class="selected">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-4.jpg"></a>
                                </div>

                                <div class="next">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-5.jpg"></a>
                                </div>

                                <div class="nextRightSecond">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-6.jpg"></a>
                                </div>

                                <div class="hideRight">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-7.png"></a>
                                </div>

                            </div>
                        </div>
                        <div class="mb-5">
                            <div class="title">
                                <h2 class="fw-bold">Latest Updates <a href="#"><i class="bi bi-arrow-right"
                                                                                  style="display: block; float: right;"></i></a></h2>
                                <div class="row mt-2">
                                    <c:forEach items="${mangaListUpdates}" var="manga">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="/MangaUniverse/MangaDetailServlet?id=${manga.getMangaID()}">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('${manga.getCoverImage()}');"
                                                     data-setbg="${manga.getCoverImage()}">
                                                    <!--so chapter => UPDATE!!-->
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <c:set var="manga" value="${manga}" />
                                                        <%
                                                            Manga manga = (Manga) pageContext.getAttribute("manga");
                                                            request.setAttribute("cate", categoryDAO.getCategoriesByMangaID(manga.getMangaID()));

                                                        %>
                                                        <c:forEach items="${cate}" var="category">
                                                            <li>${category.getType()}</li>
                                                        </c:forEach>
                                                        
                                                    </ul>
                                                    <h5>${manga.getTitle()}</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>


                                </div>
                            </div>
                        </div>
                        

                    </main>
                    <!-- subscribe section -->
                    <section class="subscribe py-5 theme-transparent-bg">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-0 mb-lg-5">
                                        <div class="row">
                                            <div class="col-12 col-lg-7 align-self-center">
                                                <div class="p-4 p-lg-5">
                                                    <p class="fw-bold mb-4 font-small">Subscribe to our newsletter and be
                                                        the first to
                                                        receive news</p>
                                                    <h4 class="fs-2 font-black mb-0">Don't miss out on Fantastic Anime &amp;
                                                        Manga</h4>
                                                    <div class="mt-5">
                                                        <form class="form">
                                                            <div class="row justify-content-center">
                                                                <div class="col-12">
                                                                    <div
                                                                        class="d-flex p-2 rounded-pill theme-border-white theme-transparent-bg">
                                                                        <input type="text" class="form-control"
                                                                               placeholder="Enter your email address">
                                                                        <button type="button"
                                                                                class="btn custom-btn-subscribe"><i
                                                                                class="bi bi-envelope-fill"></i></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-lg-5 pt-5 pt-lg-0">
                                                <img src="https://designmilitary.com/preview/html-websites/Anime-Manga-Hub/ver2.0/assets/images/section/subscribe-img.png"
                                                     class="img-fluid theme-border-radius" alt="subscribe pic">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section> <!-- End subscribe section -->

                    <div class="offer-section-div w-100 py-4"> <!-- Ads section -->
                        <div class="container-fluid px-lg-5">
                            <div class="row row-cols-1 row-cols-md-2 align-items-center">
                                <div class="col">
                                    <figure class="letf-pic1">
                                        <img class="ads-img"
                                             src="https://oxentictemplates.in/templatemonster/tendex/images/sub-img1.png"
                                             alt="sb">
                                    </figure>
                                </div>
                                <div class="col">
                                    <div class="content-details-div">
                                        <h2 class="text-white mt-0"> 1 Year Free Subscription
                                            <span class="d-block"> Cashback Upto 50%</span>
                                        </h2>
                                        <h4 class="text-white">*25<sup>th</sup>May 2023 </h4>
                                        <p class="text-white col-lg-9"> Lorem Ipsum is simply dummy text of the printing and
                                            typesetting industry. Lorem Ipsum has been the industry's standard dummy text
                                            ever since the 1500s, when an unknown printer</p>
                                        <a href="#" class="btn comon-btn mt-4"> Subcribe Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <c:if test="${userSession == null || userSession.getRole().equals('Free')}">
                        <%@include file="layouts/layoustOthers/adsOthers.jsp" %>
                    </c:if>
                    
                    <script src="main.js"></script>
                </div>
            </section>

        </main><!-- End #main -->



        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assetsMain/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assetsMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assetsMain/vendor/chart.js/chart.umd.js"></script>
        <script src="assetsMain/vendor/echarts/echarts.min.js"></script>
        <script src="assetsMain/vendor/quill/quill.min.js"></script>
        <script src="assetsMain/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assetsMain/vendor/tinymce/tinymce.min.js"></script>
        <script src="assetsMain/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assetsMain/js/main.js"></script>

        <!-- Slider -->
        <script>
            function moveToSelected(element) {

                if (element == "next") {
                    var selected = $(".selected").next();
                } else if (element == "prev") {
                    var selected = $(".selected").prev();
                } else {
                    var selected = element;
                }

                var next = $(selected).next();
                var prev = $(selected).prev();
                var prevSecond = $(prev).prev();
                var nextSecond = $(next).next();

                $(selected).removeClass().addClass("selected");

                $(prev).removeClass().addClass("prev");
                $(next).removeClass().addClass("next");

                $(nextSecond).removeClass().addClass("nextRightSecond");
                $(prevSecond).removeClass().addClass("prevLeftSecond");

                $(nextSecond).nextAll().removeClass().addClass('hideRight');
                $(prevSecond).prevAll().removeClass().addClass('hideLeft');

            }

            // Eventos teclado
            $(document).keydown(function (e) {
                switch (e.which) {
                    case 37: // left
                        moveToSelected('prev');
                        break;

                    case 39: // right
                        moveToSelected('next');
                        break;

                    default:
                        return;
                }
                e.preventDefault();
            });

            $('#carousel div').click(function () {
                moveToSelected($(this));
            });

            $('#prev').click(function () {
                moveToSelected('prev');
            });

            $('#next').click(function () {
                moveToSelected('next');
            });


        </script>

    </body>

</html>
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
                    <section class="policy content sec-mar">
                        <div class="container">
                            <h6>Privacy policy last updated on â 12 December 2023</h6>
                            <hr>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="show policy-content s-1" style="">
                                        <h3>How spoilers are treated?</h3>
                                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                            praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias
                                            excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui
                                            officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem
                                            rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis
                                            est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere
                                            possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus
                                            autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet
                                            ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum
                                            rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores
                                            alias consequatur aut perferendis doloribus asperiores repellat. </p>
                                    </div>
                                    <div class="policy-content s-2" style="display: none;">
                                        <h3>What is considered spoiler?</h3>
                                        <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo
                                            minus id quod maxime placeat facere possimus, omnis voluptas assumenda est,
                                            omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut
                                            rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et
                                            molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut
                                            aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus
                                            asperiores repellat.</p>
                                    </div>
                                    <div class="policy-content s-3">
                                        <h3>What is temporary ban?</h3>
                                        <p>Molestias excepturi sint occaecati cupiditate non provident, similique sunt in
                                            culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et
                                            harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum
                                            soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime
                                            placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.
                                            Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus
                                            saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.
                                            Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis
                                            voluptatibus maiores alias consequatur aut perferendis doloribus asperiores
                                            repell.</p>
                                    </div>
                                    <div class="policy-content s-4">
                                        <h3>What is permanent ban?</h3>
                                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                            praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias
                                            excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui
                                            officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem
                                            rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis
                                            est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere
                                            possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus
                                            autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet
                                            ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum
                                            rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores
                                            alias consequatur aut perferendis doloribus asperiores repellat. </p>
                                    </div>
                                    <div class="policy-content s-5">
                                        <h3>Whenever you leave a comment/reply?</h3>
                                        <p> Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus
                                            saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.
                                            Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis
                                            voluptatibus maiores alias consequatur aut perferendis doloribus asperiores
                                            repellat. </p>
                                    </div>
                                    <div class="policy-content s-6">
                                        <h3>When you get a temporary ban?</h3>
                                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                            praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias
                                            excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui
                                            officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem
                                            rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis
                                            est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere
                                            possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus
                                            autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet
                                            ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum
                                            rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores
                                            alias consequatur aut perferendis doloribus asperiores repellat. </p>
                                    </div>
                                    <div class="policy-content s-7">
                                        <h3>How safe is my information?</h3>
                                        <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo
                                            minus id quod maxime placeat facere possimus, omnis voluptas assumenda est,
                                            omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut
                                            rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et
                                            molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut
                                            aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus
                                            asperiores repellat.</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="policy-item s-1 show" data-count="1">
                                        <span class="d-inline-block policy-icon"><i class="bi bi-plus-lg"></i> <i
                                                class="bi bi-dash-lg" style="display: none;"></i></span>
                                        <h2>How spoilers are treated?</h2>
                                    </div>
                                    <div class="policy-item s-2" data-count="2">
                                        <span class="d-inline-block policy-icon"><i class="bi bi-plus-lg"></i> <i
                                                class="bi bi-dash-lg" style="display: none;"></i></span>
                                        <h2>What is considered spoiler?</h2>
                                    </div>
                                    <div class="policy-item s-3" data-count="3">
                                        <span class="d-inline-block policy-icon"><i class="bi bi-plus-lg"></i> <i
                                                class="bi bi-dash-lg" style="display: none;"></i></span>
                                        <h2>What is temporary ban?</h2>
                                    </div>
                                    <div class="policy-item s-4" data-count="4">
                                        <span class="d-inline-block policy-icon"><i class="bi bi-plus-lg"></i> <i
                                                class="bi bi-dash-lg" style="display: none;"></i></span>
                                        <h2>Whenever you leave a comment/reply</h2>
                                    </div>
                                    <div class="policy-item s-5" data-count="5">
                                        <span class="d-inline-block policy-icon"><i class="bi bi-plus-lg"></i> <i
                                                class="bi bi-dash-lg" style="display: none;"></i></span>
                                        <h2>Whenever you leave a comment/reply?</h2>
                                    </div>
                                    <div class="policy-item s-6" data-count="6">
                                        <span class="d-inline-block policy-icon"><i class="bi bi-plus-lg"></i> <i
                                                class="bi bi-dash-lg" style="display: none;"></i></span>
                                        <h2>When you get a temporary ban?</h2>
                                    </div>
                                    <div class="policy-item s-7 mb-0" data-count="7">
                                        <span class="d-inline-block policy-icon"><i class="bi bi-plus-lg"></i> <i
                                                class="bi bi-dash-lg" style="display: none;"></i></span>
                                        <h2>
                                            When you get a permanent ban?
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
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
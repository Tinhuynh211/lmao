<%-- 
    Document   : ads
    Created on : Oct 24, 2023, 12:45:38 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Start popup code -->
<div id="ad_position_box">
    <div class="card">
        <div class="top-row flex-row">
            <div class="colmun">
                <span>Ad</span>
            </div>
            <div class="colmun">
                <button class="report"><i class="bi bi-three-dots-vertical ads-icon"></i></button>
                <button class="skip"><i class="bi bi-x-lg ads-icon"></i></button>
            </div>
        </div>
        <div class="ad-content">
            <div>
                <img class="img-fluid" width="200" height="200" src="../assetsMain/img/ads-img.jpg"
                     alt="ads"> 
            </div>
        </div>
    </div>
</div>

<script>
    $("#ad_position_box").addClass("active");
    $("#carousel div").attr("style", "z-index: 0;");
//            $(".click-me a").click(function () {
//                $("#ad_position_box").addClass("active");
//                $("#carousel div").attr("style", "z-index: 0;");
//            });
    $(".skip").click(function () {
        $("#ad_position_box").removeClass("active");
        $("#carousel div").removeAttr("style");
    });
</script>

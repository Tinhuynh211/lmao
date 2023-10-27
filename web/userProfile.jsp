<%@page import="java.time.LocalDateTime"%>
<%@page import="model.UserRegister"%>
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
                <h1>Profile</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                        <li class="breadcrumb-item">User</li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">
                    <div class="col-xl-4">

                        <div class="card">
                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                <c:if test="${userSession != null}">
                                    <img src="${userSession.getAvatarUrl() != '' ? userSession.getAvatarUrl() : 'assetsUser/img/user_image_default.png'}"
                                         alt="Profile" class="img-fluid">
                                </c:if>
                                <c:if test="${userSession == null}">
                                    <c:if test="${sessionScope.userGooglePicture != null}">
                                        <img src="${sessionScope.userGooglePicture}"
                                             alt="Profile" class="img-fluid">
                                    </c:if>
                                    <c:if test="${sessionScope.userGooglePicture == null}">
                                        <img src="${valueAvatarUrl != null ? valueAvatarUrl : 'assetsUser/img/user_image_default.png'}"
                                             alt="Profile" class="img-fluid">
                                    </c:if>
                                </c:if>

                                <c:if test="${sessionScope.userSession != null}">
                                    <% User u2 = (User) session.getAttribute("userSession");%>
                                    <h2>${sessionScope.userSession.getUsername()}</h2>
                                    <% if (u2.getRole().equalsIgnoreCase("Free")) {%>
                                    <span>${sessionScope.userSession.getRole()}</span>
                                    <% } else if (u2.getRole().equalsIgnoreCase("Premium")) {%>
                                    <span>${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: gold;"></i></span>
                                        <% } else if (u2.getRole().equalsIgnoreCase("Author")) {%>   
                                    <span>${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: greenyellow;"></i></span>
                                        <% }%>
                                    </c:if>
                                    <c:if test="${sessionScope.userSession == null}">
                                    <h6 class="mt-2" style="font-weight: bold">${sessionScope.userRegister.getUsername()}</h6>
                                    <span>Free Account</span>
                                </c:if>

                            </div>
                        </div>

                    </div>

                    <div class="col-xl-8">

                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab"
                                                data-bs-target="#profile-overview">Overview</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Settings</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change
                                            Password</button>
                                    </li>

                                </ul>
                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade profile-overview" id="profile-overview">
                                        <h5 class="card-title">Profile Details</h5>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label ">Username</div>
                                            <div class="col-lg-9 col-md-8">
                                                <c:if test="${sessionScope.userSession != null}">
                                                    <div>${sessionScope.userSession.getUsername()}</div>
                                                </c:if>
                                                <c:if test="${sessionScope.userSession == null}">
                                                    <div>${sessionScope.userRegister.getUsername()}</div>
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label ">Full Name</div>
                                            <c:if test="${sessionScope.userSession != null}">
                                                <div class="col-lg-9 col-md-8">${sessionScope.userSession.getName()}</div>
                                            </c:if>
                                            <c:if test="${userSession == null}">
                                                <div class="col-lg-9 col-md-8"></div>
                                            </c:if>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Role</div>
                                            <c:if test="${sessionScope.userSession != null}">
                                                <div class="col-lg-9 col-md-8">${sessionScope.userSession.getRole()}</div>
                                            </c:if>
                                            <c:if test="${userSession == null}">
                                                <div class="col-lg-9 col-md-8">Free</div>
                                            </c:if>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Expired Time</div>
                                            <c:if test="${sessionScope.userSession != null}">
                                                <div class="col-lg-9 col-md-8">${userSession.getExpiredTimeFormat()}</div>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <div class="col-lg-9 col-md-8">yyyy-mm-dd hh:mm:sss</div>
                                            </c:if>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Coin Quantity</div>
                                            <c:if test="${sessionScope.userSession != null}">
                                                <div class="col-lg-9 col-md-8">${sessionScope.userSession.getCoinQuantity()}</div>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <div class="col-lg-9 col-md-8">0</div>
                                            </c:if>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Create time</div>
                                            <c:if test="${sessionScope.userSession != null}">
                                                <div class="col-lg-9 col-md-8">${sessionScope.userSession.getCreateAtFormat()}</div>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <div class="col-lg-9 col-md-8">yyyy-mm-dd hh:mm:sss</div>
                                            </c:if>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Phone</div>
                                            <c:if test="${sessionScope.userSession != null}">
                                                <div class="col-lg-9 col-md-8">${sessionScope.userSession.getPhone()}</div>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <div class="col-lg-9 col-md-8"></div>
                                            </c:if>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Gender</div>
                                            <c:if test="${sessionScope.userSession != null}">
                                                <div class="col-lg-9 col-md-8">${sessionScope.userSession.getGender()}</div>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <div class="col-lg-9 col-md-8"></div>
                                            </c:if>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Email</div>
                                            <c:if test="${sessionScope.userSession != null}">
                                                <div class="col-lg-9 col-md-8">${sessionScope.userSession.getCreateAtFormat()}</div>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <div class="col-lg-9 col-md-8"></div>
                                            </c:if>
                                        </div>

                                    </div>



                                    <div class="tab-pane fade show active profile-edit pt-3" id="profile-edit">
                                        <c:if test="${sessionScope.tokenVerify != null}">   
                                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                <i class="bi bi-exclamation-octagon me-1"></i>
                                                Please fill in your personal information to access features!
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </c:if> 
                                        <!-- Profile Edit Form -->
                                        <form action="UserProfileServlet" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                                            <div class="row mb-3">
                                                <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                                                <div class="col-md-8 col-lg-9" id="divSvgContainer">
                                                    <c:if test="${userSession != null}">
                                                        <img id="imagePreview" src="${userSession.getAvatarUrl() != '' ? userSession.getAvatarUrl() : 'assetsUser/img/user_image_default.png'}"
                                                             alt="Profile">

                                                    </c:if>
                                                    <!-- <br>
                                                    ${userSession} -->
                                                    <c:if test="${userSession == null}">

                                                        <c:if test="${sessionScope.userGooglePicture != null}">
                                                            <img id="imagePreview" src="${sessionScope.userGooglePicture}"
                                                                 alt="Profile">
                                                        </c:if>
                                                        <c:if test="${sessionScope.userGooglePicture == null}">
                                                            <c:if test="${valueAvatarUrl != null}">
                                                                <img id="imagePreview" src="${valueAvatarUrl}"
                                                                     alt="Profile">
                                                            </c:if>
                                                            <c:if test="${valueAvatarUrl == null}">
                                                                <img id="imagePreview" src="assetsUser/img/user_image_default.png"
                                                                     alt="Profile">

                                                            </c:if>
                                                        </c:if>

                                                    </c:if>

                                                    <div class="pt-2 d-flex align-center gap-2">
                                                        <input type="file" name="profileImage" id="profileImage" 
                                                               style="display: none;" accept="image/*">

                                                        <label id="uploadButton" for="profileImage" class="btn btn-primary btn-sm" title="Upload new profile image"><i
                                                                class="bi bi-upload text-white"></i></label>
                                                        <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image" id="removeImage"><i
                                                                class="bi bi-trash"></i></a>
                                                        <div id="spinnerUpload" class="spinner-border text-success" role="status" style="display: none;">
                                                            <span class="visually-hidden">Loading...</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <c:if test="${userSession != null}">
                                                <input type="hidden" name="avatarUrl" id="avatarUrl" 
                                                       value="${userSession.getAvatarUrl()}">
                                            </c:if>
                                            <br>

                                            <c:if test="${userSession == null}">
                                                <c:if test="${sessionScope.userGooglePicture != null}">
                                                    <input type="hidden" name="avatarUrl" id="avatarUrl" 
                                                           value="${sessionScope.userGooglePicture}">

                                                </c:if>
                                                <c:if test="${sessionScope.userGooglePicture == null}">
                                                    <c:if test="${valueAvatarUrl != null}">
                                                        <input type="hidden" name="avatarUrl" id="avatarUrl" 
                                                               value="${valueAvatarUrl}">

                                                    </c:if>
                                                    <c:if test="${valueAvatarUrl == null}">
                                                        <input type="hidden" name="avatarUrl" id="avatarUrl" 
                                                               value="assetsUser/img/user_image_default.png">

                                                    </c:if>
                                                </c:if>

                                            </c:if>
                                            <input type="hidden" name="avatarUrl" id="avatarUrl" 
                                                   value="${sessionScope.userGooglePicture != null ? sessionScope.userGooglePicture : ''}">
                                            <div class="row mb-3">
                                                <label for="username" class="col-md-4 col-lg-3 col-form-label">Username</label>
                                                <div class="col-md-8 col-lg-9"> 

                                                    <c:if test="${userSession != null}">
                                                        <input name="username" type="text" class="form-control" id="username" 
                                                               value="${userSession.getUsername() != null ? userSession.getUsername() : ''}">
                                                    </c:if>
                                                    <c:if test="${userSession == null}">
                                                        <input name="username" type="text" class="form-control" id="username" 
                                                               value="${valueUserName != null ? valueUserName : userRegister.getUsername()}">
                                                    </c:if>

                                                    <c:if test="${errUsername != null}">
                                                        <small class="small" style="color: red;">${errUsername}</small> 
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="name" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <c:if test="${userSession != null}">
                                                        <input name="name" type="text" class="form-control" id="name" value="${userSession.getName()}">
                                                    </c:if>
                                                    <c:if test="${userSession == null}">
                                                        <input name="name" type="text" class="form-control" id="name" value="${valueName != null ? valueName : ''}">
                                                    </c:if>
                                                    <c:if test="${errName != null}">
                                                        <small class="small" style="color: red;">${errName}</small> 
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="role" class="col-md-4 col-lg-3 col-form-label">Role</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="role" type="text" class="form-control" style="background-color: #e9ecef" id="role" value="${userSession.getRole() != null ? userSession.getRole() : 'Free'}" readonly="">
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="expiredTime" class="col-md-4 col-lg-3 col-form-label">Expired time</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <c:if test="${userSession != null}">
                                                        <input name="expiredTime" type="text" class="form-control" id="expiredTime" style="background-color: #e9ecef" 
                                                               value="${userSession.getExpiredTime() != null ? userSession.getExpiredTimeFormat() : 'yyyy-mm-dd hh:mm:sss'}" readonly="">
                                                    </c:if>
                                                    <c:if test="${userSession == null}">
                                                        <input name="expiredTime" type="text" class="form-control" id="expiredTime"  style="background-color: #e9ecef"
                                                               value="yyyy-mm-dd hh:mm:sss" readonly="">
                                                    </c:if>

                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="coin" class="col-md-4 col-lg-3 col-form-label">Coin Quantity</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="coin" type="text" class="form-control" id="coin" style="background-color: #e9ecef" value="${userSession.getCoinQuantity() != null ? userSession.getCoinQuantity() : '0'}" readonly="">
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="createAt" class="col-md-4 col-lg-3 col-form-label">Create time</label>
                                                <div class="col-md-8 col-lg-9"> 
                                                    <c:if test="${userSession != null}">
                                                        <input name="createAt" type="text" class="form-control" id="createAt" style="background-color: #e9ecef" 
                                                               value="${userSession.getCreateAt() != null ? userSession.getCreateAtFormat() : 'yyyy-mm-dd hh:mm:sss'}" readonly="">
                                                    </c:if>
                                                    <c:if test="${userSession == null}">
                                                        <input name="createAt" type="text" class="form-control" id="createAt"  style="background-color: #e9ecef"
                                                               value="yyyy-mm-dd hh:mm:sss" readonly="">
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="gender" class="col-md-4 col-lg-3 col-form-label">Gender</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <select name="gender" class="form-select" id="validationCustom04">
                                                        <option ${userSession == null ? 'selected' : ''} disabled value="">Choose...</option>
                                                        <option ${userSession.getGender().equals("Male") ? 'selected' : ''} value="true">Male</option>
                                                        <option ${userSession.getGender().equals("Female") ? 'selected' : ''} value="false">Female</option>
                                                    </select>
                                                    <c:if test="${errGender != null}">
                                                        <small class="small" style="color: red;">${errGender}</small> 
                                                    </c:if>

                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <c:if test="${userSession != null}">
                                                        <input name="phone" type="number" class="form-control" id="phone" 
                                                               value="${userSession.getPhone() != null ? userSession.getPhone() : ''}">
                                                    </c:if>
                                                    <c:if test="${userSession == null}">
                                                        <input name="phone" type="number" class="form-control" id="phone" 
                                                               value="${valuePhone != null ? valuePhone : userRegister.getPhone()}">
                                                    </c:if>
                                                    <c:if test="${errPhone != null}">
                                                        <small class="small" style="color: red;">${errPhone}</small> 
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <c:if test="${userSession != null}">
                                                        <input name="email" type="email" class="form-control" id="email" 
                                                               value="${userSession.getEmail() != null ? userSession.getEmail() : ''}" readonly="" style="background-color: #e9ecef">
                                                    </c:if>
                                                    <c:if test="${userSession == null}">
                                                        <input name="email" type="email" class="form-control" id="email" 
                                                               value="${valueEmail != null ? valueEmail : userRegister.getEmail()}" readonly="" style="background-color: #e9ecef">
                                                    </c:if>
                                                    <c:if test="${errEmail != null}">
                                                        <small class="small" style="color: red;">${errEmail}</small> 
                                                    </c:if>
                                                </div>
                                            </div>  


                                            <div class="text-center">
                                                <button id="submitButton" type="submit" class="btn btn-primary">Save Changes</button>
                                                <c:if test="${messageSave != null}">
                                                    <br/>
                                                    <small class="small" style="color: green;">${messageSave}</small> 
                                                </c:if>
                                            </div>
                                        </form><!-- End Profile Edit Form -->

                                    </div>

                                    <script>

                                        document.addEventListener("DOMContentLoaded", function () {
                                            const fileInput = document.getElementById("profileImage");
                                            const imagePreview = document.getElementById("imagePreview");
                                            const removeImage = document.getElementById("removeImage");
                                            const avatarUrl = document.getElementById("avatarUrl");
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

//                                                                    updateSpinnerUploadState();
                                                                    imagePreview.src = data.url;
                                                                    avatarUrl.value = data.url;
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
                                                imagePreview.src = "assetsUser/img/user_image_default.png";
                                                avatarUrl.value = "";
                                                fileInput.value = "";
                                                isImageSelected = true;
                                                updateSubmitButtonState();
//                                                    updateSpinnerUploadState();
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

                                    <div class="tab-pane fade pt-3" id="profile-settings">
                                        <!--tab-pane fade show active profile-edit pt-3-->
                                        <!--  Settings Form -->
                                        <form>
                                            <div class="row mb-3">
                                                <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Email Notifications</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="newProducts" checked>
                                                        <label class="form-check-label" for="newProducts">
                                                            Information on new manga and services
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="proOffers">
                                                        <label class="form-check-label" for="proOffers">
                                                            Marketing and promo offers
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="securityNotify" checked disabled>
                                                        <label class="form-check-label" for="securityNotify">
                                                            Security alerts
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </form><!--  End settings Form -->

                                    </div>

                                    <div class="tab-pane fade pt-3" id="profile-change-password">
                                        <!-- Change Password Form -->
                                        <form action="ChangePasswordServlet" method="POST">

                                            <div class="row mb-3">
                                                <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="password" type="password" class="form-control" id="currentPassword">
                                                    <c:if test="${errPassword != null}">
                                                        <small class="small" style="color: red;">${errPassword}</small> 
                                                    </c:if>
                                                    <%
                                                        session.removeAttribute("errPassword");
                                                    %>
                                                </div>

                                            </div>

                                            <div class="row mb-3">
                                                <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="newpassword" type="password" class="form-control" id="newPassword">
                                                    <c:if test="${errNewPassword != null}">
                                                        <small class="small" style="color: red;">${errNewPassword}</small> 
                                                    </c:if>
                                                    <%
                                                        session.removeAttribute("errNewPassword");
                                                    %>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                                                    <c:if test="${errReNewPassword != null}">
                                                        <small class="small" style="color: red;">${errReNewPassword}</small> 
                                                    </c:if>
                                                    <%
                                                        session.removeAttribute("errReNewPassword");
                                                    %>
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Change Password</button>
                                                <c:if test="${messageChangePassword != null}">
                                                    <br/>
                                                    <small class="small" style="color: green;">${messageChangePassword}</small> 
                                                </c:if>
                                            </div>

                                        </form><!-- End Change Password Form -->

                                    </div>

                                </div><!-- End Bordered Tabs -->

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
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserRegister"%>
<%
    String tokenVerifyEmail = request.getParameter("tokenVerifyEmail");
    String tokenVerify = (String) session.getAttribute("tokenVerify");

    if (tokenVerifyEmail != null && tokenVerifyEmail.equals(tokenVerify)) {
//        response.sendRedirect("userProfile.jsp");
        session.removeAttribute("tokenVerify");
        response.sendRedirect("/MangaUniverse/LoginServlet");

    }
    
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js" integrity="sha512-WW8/jxkELe2CAiE4LvQfwm1rajOS8PHasCCx+knHG0gBHt8EXxS6T6tJRTGuDQVnluuAvMxWF4j8SNFDKceLFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Font Icon -->
        <link rel="stylesheet"
              href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Vendor CSS Files -->
        <link href="assetsUser/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assetsUser/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assetsUser/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assetsUser/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assetsUser/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assetsUser/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assetsUser/vendor/simple-datatables/style.css" rel="stylesheet">

    </head>
    <body>
        <c:if test="${status != null}">
            <input type="hidden" id="status" value="${status}">
            <%
                session.removeAttribute("status");
            %>
        </c:if>
            


        <% boolean redirect = true;%>
        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>

                            <c:if test="${messageVerify != null}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <i class="bi bi-check-circle me-1"></i>
                                    Please check your email to verify!
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <c:if test="${verifyEmail == 'failed'}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <i class="bi bi-exclamation-octagon me-1"></i>
                                    Verify email is error!
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <form method="POST" action="RegistrationServlet" class="register-form"
                                  id="register-form">
                                <div class="form-group">
                                    <label for="name" class="${errName != null ? 'top' : ''}"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                        type="text" name="name" id="name" placeholder="Username" value="${valueName != null ? valueName : ''}"/>
                                    <c:if test="${errName != null}">
                                        <small class="small">${errName}</small> 
                                    </c:if>

                                </div>
                                <div class="form-group">
                                    <label for="email" class="${errEmail != null ? 'top' : ''}"><i class="zmdi zmdi-email"></i></label> <input
                                        type="email" name="email" id="email" placeholder="Your Email" value="${valueEmail != null ? valueEmail : ''}"/>
                                    <c:if test="${errEmail != null}">
                                        <small class="small">${errEmail}</small> 
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="${errPass != null ? 'top' : ''}"><i class="zmdi zmdi-lock"></i></label><input
                                        type="password" name="password" id="password" placeholder="Password" value="${valuePass != null ? valuePass : ''}"/>
                                    <label for="password" class="right ${errPass != null ? 'top' : ''}"><i class="zmdi zmdi-eye-off" id="togglePassword"></i></label> 
                                        <c:if test="${errPass != null}">
                                        <small class="small">${errPass}</small> 
                                    </c:if> 
                                </div>
                                <div class="form-group">
                                    <label for="re-re_password" class="${errRePass != null ? 'top' : ''}"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_password" id="re_password"
                                           placeholder="Repeat your password" value="${valueRePass != null ? valueRePass : ''}"/>
                                    <label for="re-re_password" class="right ${errRePass != null ? 'top' : ''}"><i class="zmdi zmdi-eye-off" id="toggleRePassword"></i></label> 
                                        <c:if test="${errRePass != null}">
                                        <small class="small">${errRePass}</small> 
                                    </c:if> 
                                </div>
                                <div class="form-group">
                                    <label for="contact" class="${errPhone != null ? 'top' : ''}"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="text" name="contact" id="contact"
                                           placeholder="Contact no" value="${valuePhone != null ? valuePhone : ''}"/>
                                    <c:if test="${errPhone != null}">
                                        <small class="small">${errPhone}</small> 
                                    </c:if>  
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term"
                                           class="agree-term" /> <label for="agree-term"
                                           class="label-agree-term"><span><span></span></span>I
                                        agree all statements in <a href="#" class="term-service">Terms
                                            of service</a></label>
                                            <c:if test="${errAgreeTerm != null}">
                                        <small class="small">${errAgreeTerm}</small> 
                                    </c:if> 
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup"
                                           class="form-submit" value="Register" />
                                </div>
                            </form>
                            <div class="col-12 mt-2">
                                <span class="social-label">Or sign up with</span>
                                <ul class="socials d-inline-block">
                                    <li>
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile email phone&redirect_uri=http://localhost:8080/MangaUniverse/RegisterGoogleServlet&response_type=code&client_id=727306614937-6mj4mhufjq06aqns6el83e2fnegocjbn.apps.googleusercontent.com&approval_prompt=force">
                                            <i class="display-flex-center zmdi zmdi-google"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="signup-image">
                            <figure>
                                <img src="images/signin-image-luffy.png" alt="sing up image">
                            </figure>
                            <a href="login.jsp" class="signup-image-link">I am already
                                member</a>
                        </div>
                    </div>

                </div>
            </section>

        </div>
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script>
            console.log("Hello");
            var status = document.getElementById("status").value;
            console.log(status);
            if (status == "success") {
                swal("Congrats", "Account Created Successfully", "success");
            }
            if (status == "failedRegisterGoogle") {
                swal("Sorry", "Your email is already register!", "error");
            }

            //------------------------------------------------------
            const togglePassword = document.querySelector("#togglePassword");
            const password = document.querySelector("#password");
            const toggleRePassword = document.querySelector("#toggleRePassword");
            const re_password = document.querySelector("#re_password");

            togglePassword.addEventListener("click", function () {
                // toggle the type attribute
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);

                // toggle the icon
                // i class="zmdi zmdi-eye"></i>
                this.classList.toggle("zmdi-eye");
            });
            toggleRePassword.addEventListener("click", function () {
                // toggle the type attribute
                const type = re_password.getAttribute("type") === "password" ? "text" : "password";
                re_password.setAttribute("type", type);

                // toggle the icon
                // i class="zmdi zmdi-eye"></i>
                this.classList.toggle("zmdi-eye");
            });

//            // prevent form submit
//            const form = document.querySelector("form");
//            form.addEventListener('submit', function (e) {
//                e.preventDefault();
//            });

            //------------------------------------------------------

        </script>

    </body>
</html>
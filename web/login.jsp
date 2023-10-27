<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign In</title>

        <!-- Font Icon -->
        <link rel="stylesheet"
              href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <c:if test="${status != null}">
            <input type="hidden" id="status" value="${status}">
            <%
                session.removeAttribute("status");
            %>
        </c:if>


        <div class="main">

            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure>
                                <img src="images/signin-image-luffy.png" alt="sing up image">
                            </figure>
                            <a href="registration.jsp" class="signup-image-link">Create an
                                account</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Sign in</h2>
                            
                            <form method="POST" action="LoginServlet" class="register-form"
                                  id="login-form">
                                <div class="form-group">
                                    <label for="username" class="${errUsername != null ? 'top' : ''}"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                        type="text" name="username" id="username"
                                        placeholder="Username" value="${valueUsername != null ? valueUsername : ''}"/>
                                    <c:if test="${errUsername != null}">
                                        <small class="small">${errUsername}</small> 
                                    </c:if>  
                                </div>
                                <div class="form-group">
                                    <label for="password" class="${errPassword != null ? 'top' : ''}"><i class="zmdi zmdi-lock"></i></label> <input
                                        type="password" name="password" id="password"
                                        placeholder="Password" value="${valuePassword != null ? valuePassword : ''}"/>
                                    <label for="password" class="right ${errPassword != null ? 'top' : ''}"><i class="zmdi zmdi-eye-off" id="togglePassword"></i></label> 
                                        <c:if test="${errPassword != null}">
                                        <small class="small">${errPassword}</small> 
                                    </c:if> 
                                </div>
                                <div class="form-group">
                                    <!--                                    <input type="checkbox" name="remember-me" id="remember-me"
                                                                               class="agree-term" /> <label for="remember-me"
                                                                               class="label-agree-term"><span><span></span></span>Remember
                                                                            me</label>-->
                                    <a href="forgotPassword.jsp">Forgot Password?</a>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin"
                                           class="form-submit" value="Log in" />
                                </div>
                            </form>
                            <div class="social-login">

                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <!--                                    <li><a href="#"><i
                                                                                    class="display-flex-center zmdi zmdi-facebook"></i></a></li>-->
                                    <!--                                    <li><a href="#"><i
                                                                                    class="display-flex-center zmdi zmdi-twitter"></i></a></li>-->
                                    <!--                                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=profile email https://www.googleapis.com/auth/user.phonenumbers.read&redirect_uri=http://localhost:8080/MangaUniverse/LoginGoogleServlet&response_type=code&client_id=727306614937-6mj4mhufjq06aqns6el83e2fnegocjbn.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a>
                                                                        </li>-->
                                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=profile email phone&redirect_uri=http://localhost:8080/MangaUniverse/LoginGoogleServlet&response_type=code
                                           &client_id=727306614937-6mj4mhufjq06aqns6el83e2fnegocjbn.apps.googleusercontent.com&approval_prompt=force"><i
                                                class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
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
                swal("Congrats", "Login Successfully", "success");
            }
            if (status == "failedUsername") {
                swal("Sorry", "Not Found Username", "error");
            }
            if (status == "failedPassword") {
                swal("Sorry", "Wrong Password", "error");
            }
            if (status == "failedLoginGoogle") {
                swal("Sorry", "Your email is not register!", "error");
            }
            if (status == "success") {
                swal("Congrats", "Login Successfully", "success");
            }
            //------------------------------------------------------

            const togglePassword = document.querySelector("#togglePassword");
            const password = document.querySelector("#password");

            togglePassword.addEventListener("click", function () {
                // toggle the type attribute
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);

                // toggle the icon
                // i class="zmdi zmdi-eye"></i>
                this.classList.toggle("zmdi-eye");
            });

        </script>
    </body>
</html>
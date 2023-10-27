<%-- 
    Document   : footer
    Created on : Sep 22, 2023, 10:49:41 PM
    Author     : PC
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Responsive Footer</title>
        <!-- Fonts Links For Icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <link rel="stylesheet" href="css/footer.css" />
    </head>

    <body>
        <section class="footer">
            <div class="footer-row">
                <div class="footer-col">
                    <h4>Info</h4>
                    <ul class="links">
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Users</a></li>
                        <li><a href="#">Collection</a></li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4>Explore</h4>
                    <ul class="links">
                        <li><a href="#">Free Manga</a></li>
                        <li><a href="#">Latest</a></li>
                        <li><a href="#">Popular Manga</a></li>
                        <li><a href="#">New Uploads</a></li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4>Legal</h4>
                    <ul class="links">
                        <li><a href="#">Customer Agreement</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Security</a></li>
                        <li><a href="#">Media Kit</a></li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4>Newsletter</h4>
                    <p>
                        Subscribe to our newsletter for a weekly dose
                        of news, updates, and
                        exclusive offers.
                    </p>
                    <form action="#">
                        <input type="text" placeholder="Your email" required>
                        <button type="submit">SUBSCRIBE</button>
                    </form>
                    <div class="icons">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-reddit"></i>
                        <i class="fa-brands fa-discord"></i>
                    </div>
                </div>
            </div>
        </section>
    </body>

</html>

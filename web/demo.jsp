<%-- 
    Document   : demo
    Created on : Sep 21, 2023, 2:06:49 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Index</h1>
        <%
            String id = request.getAttribute("id").toString();
            String email = request.getAttribute("email").toString();
            String verified_email = request.getAttribute("verified_email").toString();
            String name = request.getAttribute("name").toString();
            String given_name = request.getAttribute("given_name").toString();
            String family_name = request.getAttribute("family_name").toString();
//            String link = request.getAttribute("link").toString();
            String picture = request.getAttribute("picture").toString().trim();
            out.print("id: " + id);
            out.print("<br/>email: " + email);
            out.print("<br/>verified_email: " + verified_email);
            out.print("<br/>Name: " + name);
            out.print("<br/>given_name: " + given_name);
            out.print("<br/>family_name: " + family_name);
//            out.print("<br/>link " + link);
            out.print("<br/>picture: " + picture);
        %>
        <br/>
        <img src="<%= picture%>" alt="alt"/>
    </body>
</html>

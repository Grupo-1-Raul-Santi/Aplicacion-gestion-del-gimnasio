<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join us | Metropolitan Gym</title>
        <meta name="description" content="Become a member of our gym and discover our variety of activities.">
        
        <%@ include file="includes/head.jsp" %>
    </head>
    <body>
        <%@ include file="includes/menu-en.jsp" %>
        
        <div class="banner-hero inner-pages" style="background-image: url('images/hero-unete-socios.jpg'); background-size: cover; background-position: center center;">
            <h1>Join us</h1>
        </div>
        
        <section class="container">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <img src="images/unete-socios.jpg" class="wow fadeInLeft" style="visibility: visible;animation-name: fadeInLeft;" data-wow-delay="0.2s">
                </div>
                
                <div class="col-lg-6 col-xs-12">
                    
                    <div class="inner-text">
                        <h2>Join the Metropolitan Club</h2>
                        <p>Do you want to become a member of our club? Fill in the following form to join our METROPOLITAN CLUB.</p>
                    </div>
                    
                    <form method="post" action="anadir-socio">
                        <div class="form-field">
                            <p>First name:</p>
                            <input type="text" name="nombre" placeholder="Write here your first name..."/>
                        </div>
                        <div class="form-field">
                            <p>Last name:</p>
                             <input type="text" name="apellido" placeholder="Write here your last name..."/>
                        </div>
                        <div class="form-field">
                            <p>DNI:</p>
                             <input type="text" name="dni" placeholder="Write here your DNI..."/>
                        </div>
                        <div class="form-field">
                            <p>Address:</p>
                             <input type="text" name="direccion" placeholder="Write here your address..."/>
                        </div>                
                        <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Register"/>
                        
                        <%
                        String status = request.getParameter("status");
                        if (status == null)
                            status = "";

                        if (status.equals("ok")) {
                            out.println("<div class='message msg-ok'><p>The client has been added to the database</p></div>");
                        } else if (status.equals("error")) {
                            out.println("<div class='message msg-fail'><p>The client hasn't been added to the database</p></div>");
                        }
                        %>
                    </form>
                </div>
            </div>
        </section>
        
        <%@ include file="includes/footer-en.jsp" %>
    </body>
</html>

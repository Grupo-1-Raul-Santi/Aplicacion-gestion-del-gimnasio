<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metropolitan Gym | Fitness & Wellness</title>
        <meta name="description" content="Get to know our gym and access our members area, among other features.">
 
        <%@ include file="includes/head.jsp" %>
    </head>
    <body>
        
        <!--- MENÚ --->
        <%@ include file="includes/menu-en.jsp" %>
        
        <main>
            <div class="banner-hero" style="background-image: url('images/hero-image.jpg'); background-size: cover; background-position: center;">
                <h1 class="wow fadeInDown" style="visibility: visible;animation-name: fadeInDown;" data-wow-delay="0.2s">See you at the club</h1>
            </div>
            
            <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
                <div class="bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                  <div class="my-3 py-3">
                      <h2 class="display-5 light"><a href="haztesocio.jsp">Join us</a></h2>
                    <p class="lead">Become a member of our METROPOLITAN CLUB and take advantage of our exclusive offers.</p>
                  </div>
                    <div class="bg-light shadow-sm mx-auto unete-socios wow fadeInUp" style="visibility: visible;animation-name: fadeInUp; width: 80%; height: 300px; border-radius: 21px 21px 0 0;" data-wow-delay="0.2s"></div>
                </div>
                <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                  <div class="my-3 p-3">
                      <h2 class="display-5 dark"><a href="areasocio.jsp">Book your activity</a></h2>
                    <p class="lead">Visit our app and get to know our avalable schedule for each activity. Book your apointment now!</p>
                  </div>
                  <div class="bg-dark shadow-sm mx-auto reservar-actividad wow fadeInUp" style="visibility: visible;animation-name: fadeInUp; width: 80%; height: 300px; border-radius: 21px 21px 0 0;" data-wow-delay="0.2s"></div>
                </div>
            </div>
        </main>
       
        <!--- FOOTER --->
        <%@ include file="includes/footer-en.jsp" %>
    </body>
</html>
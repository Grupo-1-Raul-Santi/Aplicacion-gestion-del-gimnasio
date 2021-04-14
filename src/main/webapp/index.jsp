<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gimnasios Metropolitan | Fitness & Bienestar</title>
        <meta name="description" content="Conoce nuestro gimnasio y accede al área de socio, entre otras funcionalidades.">
 
        <%@ include file="includes/head.jsp" %>
    </head>
    <body>
        
        <!--- MENÚ --->
        <%@ include file="includes/menu.jsp" %>
        
        <main>
            <div class="banner-hero" style="background-image: url('images/hero-image.jpg'); background-size: cover; background-position: center;">
                <h1>Nos vemos en el club</h1>
            </div>
            
            <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
                <div class="bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                  <div class="my-3 py-3">
                      <h2 class="display-5 light"><a href="haztesocio.jsp">Únete a nosotros</a></h2>
                    <p class="lead">Hazte socio de nuestro CLUB METROPOLITAN y aprovecha nuestras exclusivas ofertas.</p>
                  </div>
                    <div class="bg-light shadow-sm mx-auto unete-socios" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
 
                    </div>
                </div>
                <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                  <div class="my-3 p-3">
                      <h2 class="display-5 dark"><a href="areasocio.jsp">Reserva tu actividad</a></h2>
                    <p class="lead">Desde nuestra app podrás reservar tu actividad y ver más información sobre el horario disponible.</p>
                  </div>
                  <div class="bg-dark shadow-sm mx-auto reservar-actividad" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </div>
        </main>
       
        <!--- FOOTER --->
        <%@ include file="includes/footer.jsp" %>

                <!-- 
        <p>Accede una <a href="mypage.jsp">página JSP de ejemplo</a></p>
        <p>Hazte socio <a href="haztesocio.jsp">aqui</a></p>
        <p>Area socio <a href="areasocio.jsp">aqui</a></p>
        <p>Area administrador <a href="areaadminsocio.jsp">aqui</a></p>
        <p>Desde aqui podrás ver el <a href="movies">listado de peliculas (con servlet)</a></p>
        <p>Desde aqui podrás ver el <a href="movies.jsp">listado de peliculas (con JSP)</a></p>
        -->
    </body>
</html>

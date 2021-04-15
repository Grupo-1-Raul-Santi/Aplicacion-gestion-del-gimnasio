<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hazte socio | Gimnasios Metropolitan</title>
        <meta name="description" content="Conoce nuestro gimnasio y accede al área de socio, entre otras funcionalidades.">
        
        <%@ include file="includes/head.jsp" %>
    </head>
    <body>
        <%@ include file="includes/menu.jsp" %>
        
        <div class="banner-hero inner-pages" style="background-image: url('images/hero-unete-socios.jpg'); background-size: cover; background-position: center center;">
            <h1>Hazte socio</h1>
        </div>
        
        <section class="container">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <img src="images/unete-socios.jpg" class="wow fadeInLeft" style="visibility: visible;animation-name: fadeInLeft;" data-wow-delay="0.2s">
                </div>
                
                <div class="col-lg-6 col-xs-12">
                    
                    <div class="inner-text">
                        <h2>Únete al Club Metropolitan</h2>
                        <p>¿Te gustaría unirte a nuestro club? Rellena el siguiente formulario para poder formar parte de inmediato de nuestro CLUB METROPOLITAN.</p>
                    </div>
                    
                    <form method="post" action="anadir-socio">
                        <div class="form-field">
                            <p>Nombre:</p>
                            <input type="text" name="nombre" placeholder="Escribe aquí tu nombre..."/>
                        </div>
                        <div class="form-field">
                            <p>Apellido:</p>
                             <input type="text" name="apellido" placeholder="Escribe aquí tu apellido..."/>
                        </div>
                        <div class="form-field">
                            <p>DNI:</p>
                             <input type="text" name="dni" placeholder="Escribe aquí tu DNI..."/>
                        </div>
                        <div class="form-field">
                            <p>Dirección:</p>
                             <input type="text" name="direccion" placeholder="Escribe aquí tu dirección..."/>
                        </div>                
                        <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Registrar"/>
                        
                        <%
                        String status = request.getParameter("status");
                        if (status == null)
                            status = "";

                        if (status.equals("ok")) {
                            out.println("<div class='message msg-ok'><p>El cliente se ha registrado con éxito</p></div>");
                        } else if (status.equals("error")) {
                            out.println("<div class='message msg-fail'><p>No se ha podido registrar el cliente</p></div>");
                        }
                        %>
                    </form>
                </div>
            </div>
        </section>
        
        <%@ include file="includes/footer.jsp" %>
    </body>
</html>

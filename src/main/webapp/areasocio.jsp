<%@page import="com.sanvalero.gimnasio.dao.SalaDao"%>
<%@page import="com.sanvalero.gimnasio.domain.Sala"%>
<%@page import="com.sanvalero.gimnasio.domain.Tipo"%>
<%@page import="com.sanvalero.gimnasio.dao.TipoDao"%>
<%@page import="com.sanvalero.gimnasio.dao.ActividadDao"%>
<%@page import="com.sanvalero.gimnasio.dao.Conexion"%>
<%@page import="com.sanvalero.gimnasio.domain.Actividad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Reserva tu actividad | Gimnasios Metropolitan</title> 
        
        <%@ include file="includes/head.jsp" %>
    </head>
    
    <body> 
        <%@ include file="includes/menu.jsp" %>

        <header class="banner-hero inner-pages" style="background-image: url('images/hero-area-socios.jpg'); background-size: cover; background-position: center center;">
            <h1>Reserva tu actividad</h1>
        </header>

        <div class="bg-special-dark padding-3-vertical">
            <div class="container">
                <div class="row margin-bottom-3">
                    <div class="col-lg-12">
                        <div class="inner-text">
                            <h2>Paso 1: Introduce tu DNI</h2>
                            <p>Introduce tu DNI a continuación para poder comprobar que ya eres socio de nuestro club.</p>
                        </div>
                        <form method="post" action="comprobar-dni-socio">
                            <div class="form-field">
                                <p>DNI:</p>
                                <input type="text" name="dni" placeholder="Escribe aquí tu DNI..."/>
                            </div>
                            <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Validar"/>
                        </form>

                        <%
                            String idSocio = request.getParameter("idSocio");
                            String nombre = request.getParameter("nombre");
                            String apellido = request.getParameter("apellido");
                            if (idSocio == null) {
                                idSocio = "";
                            }
                            if (nombre == null) {
                                nombre = " ";
                            }
                            if (apellido == null) {
                                apellido = " ";
                            }
                        %>
                        
                        <div class="padding-1-vertical">
                            <h2>Datos del socio</h2>
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Apellido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%= nombre%></td>
                                        <td><%= apellido%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container padding-6-vertical">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Paso 2: Selecciona la actividad deseada</h2>
                    <p>Escoge la actividad que desees realizar, el monitor que la va a impartir y la sala donde la vas a realizar.</p>
                    <%
                        ArrayList<Tipo> tipos = new ArrayList<>();
                        Conexion conexion = new Conexion();
                        conexion.connect();
                        TipoDao tipodao = new TipoDao(conexion);
                        tipos = tipodao.listarTiposSalasActividad();
                    %>
                    
                    <form method="post" action="cita-socio">
                        <div class="seleccion-actividad">
                            <!--Ocultar este input -->
                            <input class="display-none" type="text" name="idSocio" value="<%= idSocio%>" required="">
                        
                            <select class="custom-select" name="tipo" id="tipo" onchange="tipo_change()" >
                                <option selected="selected"> --Seleccionar actividad-- </option> 
                                    <%
                                       for (Tipo tipo : tipos) {%>
                                    <option value="<%= tipo.getIdTipo()%>" ><%= tipo.getNombreTipo()%></option>
                                    <%}%>
                            </select> 
                        
                           <select class="custom-select" name="sala" id="sala" onchange="sala_change()" >
                                <option selected="selected"> --Seleccionar sala-- </option> 
                           </select> 

                            <select class="custom-select" name="monitor" id="monitor" >
                                 <option selected="selected"> --Seleccionar monitor-- </option> 
                            </select>
                        </div>
                        <input class="w-100 btn btn-lg btn-primary button-dark" type="submit" value="Reservar"/>
                    </form>
                    
                    <%
                        String status = request.getParameter("status");
                        if (status == null) {
                            status = "";
                        }
                        if (status.equals("ok")) {
                            out.println("<div class='message msg-ok'><p>El cliente se ha citado con éxito</p></div>");
                        } else if (status.equals("error")) {
                            out.println("<div class='message msg-fail'><p>No se ha podido crear la cita</p></div>");
                        }
                    %>
                </div>
            </div>
        </div>
        
        <div class="parallax">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="wow fadeInUp" style="visibility: visible;animation-name: fadeInUp;" data-wow-delay="0.2s">Paso 3: ¡Disfruta de tu actividad favorita!</h2>
                    </div>
                </div>
            </div>
        </div>


<%@ include file="includes/footer.jsp" %>
</body> 
</html>
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
        <title>How to Make jQuery 0nchange Select Option Value using ajax in JSP</title> 
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"> 
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" type="text/javascript"></script> 
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
        <script type="text/javascript">
            function tipo_change() {
                var tipo = $("#tipo").val();
                $.ajax({
                    type: "POST",
                    url: "tipo.jsp",
                    data: "idTipo=" + tipo,
                    cache: false,
                    success: function (response) {
                        $("#sala").html(response);
                    }
                });
            }
            function sala_change() {
                var sala = $("#sala").val();
                var tipo = $("#tipo").val();
                $.ajax({
                    type: "POST",
                    url: "sala.jsp",
                    data: {idSala: sala, idTipo: tipo},
                    cache: false,
                    success: function (response) {
                        $("#monitor").html(response);
                    }
                });
            }
        </script> 
    </head> 
    <body> 
            <h1>Formulario</h1>
            <form method="post" action="comprobar-dni-socio">
                <p>DNI</p>
                <input type="text" name="dni"/><br/>
                <input type="submit" value="Validar"/>
            </form>
            <%
                String idSocio = request.getParameter("idSocio");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                if (nombre == null) {
                    nombre = " ";
                }
                if (apellido == null) {
                    apellido = " ";
                }
            %> 
            <p>Nombre</p>
            <div><p><%= nombre%></p></div>
            <p>Apellido</p>
            <div><p><%= apellido%></p></div>

            <%
                ArrayList<Tipo> tipos = new ArrayList<>();
                Conexion conexion = new Conexion();
                conexion.connect();
                TipoDao tipodao = new TipoDao(conexion);
                tipos = tipodao.listarTiposSalasActividad();
            %>
            <form method="post" action="cita-socio">
                <input type="text" name="idSocio" value="<%= idSocio%>"> <!--Ocultar este input -->
                <select id="tipo" onchange="tipo_change()">
                    <option selected="selected"> --Seleccionar actividad-- </option> 
                    <%
                    for (Tipo tipo : tipos) {%>
                    <option value="<%= tipo.getIdTipo()%>"><%= tipo.getNombreTipo()%></option>
                    <%}%>
                </select> 
                
                <select id="sala" onchange="sala_change()">
                    <option selected="selected"> --Seleccionar sala-- </option> 
                </select> 
                
                <select id="monitor">
                    <option selected="selected"> --Seleccionar monitor-- </option> 
                </select> 
                
                <input type="submit" value="Reservar"/>
            </form>
    </body> 
</html>

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
            function country_change() {
                var actividad = $("#actividad").val();                
                $.ajax({
                    type: "POST",
                    url: "state.jsp",
                  data: "idActividad=" + actividad,
                    cache: false,
                    success: function (response) {
                        $("#sala").html(response);
                    }
                });
            }
            function state_change() {
                var state = $("#sala").val();
                $.ajax({
                    type: "POST",
                    url: "city.jsp",
                    data: "state id=" + state,
                    cache: false,
                    success: function (response) {
                        $("#city").html(response);
                    }
                });
            }
        </script> 
    </head> 
    <body> 
        <div class="container"> 
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
            <p>ID socio</p>
            <div><p><%= idSocio%></p></div>
            <p>Nombre</p>
            <div><p><%= nombre%></p></div>
            <p>Apellido</p>
            <div><p><%= apellido%></p></div>
            <p>Actividades</p>
            <input type="date" id="start" name="trip-start"
       value="2018-07-22"
       min="2018-01-01" max="2018-12-31">
            <%
                ArrayList<Actividad> act = new ArrayList<>();
                Conexion conexion = new Conexion();
                conexion.connect();
                ActividadDao actDao = new ActividadDao(conexion);

                act = actDao.listarTiposSalasActividad();%>

            <select name='Actividades'  id="actividad" onchange="country_change()">
                <%
                    for (Actividad actividad : act) {%>
                <option value="<%= actividad.getIdActividad()%>" > <%= actividad.getDescripcion()%> </option>
                <%}%>
            </select> 

            
                 
                 
                <label class="col-sm-1 control-label">State</label> 
                <div class="col-sm-3"> 
                    <select class="form-control" id="sala" onchange="state_change()"> 
                        <option selected="selected"> - select state </option> 
                    </select> 
                </div> 
                <label class="col-sm-1 control-label">City</label> 
                <div class="col-sm-3"> 
                    <select class="form-control" id="city"> 
                        <option selected="selected"> select city </option> 
                    </select> 
                </div> 
             
    </body> 
</html>
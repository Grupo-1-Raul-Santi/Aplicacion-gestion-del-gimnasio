<%@page import="java.io.PrintWriter"%>
<%@page import="com.sanvalero.gimnasio.dao.ActividadDao"%>
<%@page import="com.sanvalero.gimnasio.domain.Actividad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.gimnasio.dao.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area socio</title>
        <script src="js/jquery-1.12.4-jquery.min.js" type="text/javascript"></script> 
        <script type="text/javascript">
            function country_change() {
                var country = $("#country").val();
                $.ajax({type: "POST",
                    url: "state.jsp",
                    data: "country_id=" + country,
                    cache: false,
                    success: function (response) {
                        $("#state").html(response);
                    }
                });
            }
            function state_change() {
                var state = $("#state").val();
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
        <h1>Formulario</h1>
        <form method="post" action="comprobar-dni-socio">
            <p>DNI</p>
            <input type="text" name="dni"/><br/>
            <input type="submit" value="Validar"/>
        </form>
        <%
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
        <p>Actividades</p>
        <%
            PrintWriter outPrint = response.getWriter();
            ArrayList<Actividad> act = new ArrayList<>();
            Conexion conexion = new Conexion();
            conexion.connect();
            ActividadDao actDao = new ActividadDao(conexion);

            act = actDao.listarTiposSalasActividad();%>

        <select name='Actividades'>
            <%
                for (Actividad actividad : act) {%>
            <option value="<%= actividad.getIdActividad()%>"> <%= actividad.getDescripcion()%> </option>
            <%}%>
        </select>
    </body>
</html>

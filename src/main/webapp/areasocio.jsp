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
            <option value='1'> <%= actividad.getDescripcion()%> </option>
            <%}%>
        </select>

        <select name="Actividades">
            <option value="1">Windows Vista</option> 
            <option value="2">Windows 7</option> 
            <option value="3">Windows XP</option>
            <option value="10">Fedora</option> 
            <option value="11">Debian</option> 
            <option value="12">Suse</option> 
        </select>
    </body>
</html>

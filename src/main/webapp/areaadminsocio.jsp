<%@page import="com.sanvalero.gimnasio.domain.Socio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.gimnasio.dao.SocioDao"%>
<%@page import="com.sanvalero.gimnasio.dao.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area administrador</title>
    </head>
    <body>
        <h1>Lista de socios</h1>
        <%
            Conexion conexion = new Conexion();
        conexion.connect();
        SocioDao socioDao = new SocioDao(conexion);
        ArrayList<Socio> socios = socioDao.listarSocio();
          
        %>
        <ul>
        <%
            for (Socio socio : socios) {
        %>
        <li><%= socio.getIdSocio() %> <&nbsp;> <%= socio.getNombre()%> <&nbsp;> <%= socio.getApellido()%> <&nbsp;> <%= socio.getDni()%> <&nbsp;> <%= socio.getDireccion()%>
            <a href="borrar-socio?id=<%= socio.getIdSocio() %>">Eliminar</a></li>
        <%    
            }
        %>
        </ul>
    </body>
</html>

<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.gimnasio.domain.Socio"%>
<%@page import="com.sanvalero.gimnasio.dao.Conexion"%>
<%@page import="com.sanvalero.gimnasio.dao.SocioDao"%>
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
            DNI:
            <input type="text" name="dni"/><br/>
            <input type="submit" value="Validar"/>
        </form>
        <%
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
        %> 
        Nombre:
        <div><p><%=nombre%></p></div>
        Apellido
        <div><p><%=apellido%></p></div>
    </body>
</html>

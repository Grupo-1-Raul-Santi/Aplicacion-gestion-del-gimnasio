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
        <li><%= socio.getIdSocio() %> &nbsp; <%= socio.getNombre()%> &nbsp; <%= socio.getApellido()%> &nbsp; <%= socio.getDni()%> &nbsp; <%= socio.getDireccion()%>
            <a href="borrar-socio?id=<%= socio.getIdSocio() %>">Eliminar</a></li>
        <%    
            }
        %>
        </ul>
        <%
            // Muestra el mensaje (si lo hay)
            String message = request.getParameter("message");
            if (message != null) {
        %>
            <p style='color:green'><%= message %></p>
        <%        
            }
        %>
        
        <h1>Añadir socio</h1>
        <form method="post" action="anadir-socio-admin">
            Nombre:
            <input type="text" name="nombre"/><br/>
            Apellido
            <input type="text" name="apellido"/><br/>
            DNI:
            <input type="text" name="dni"/><br/>
            Dirección:
            <input type="text" name="direccion"/><br/>
            <input type="submit" value="Registrar"/>
        </form>
        <%
            String status = request.getParameter("status");
            if (status == null)
                status = "";
                
            if (status.equals("ok")) {
                out.println("<p style='color:green'>El cliente se ha registrado con éxito</p>");
            } else if (status.equals("error")) {
                out.println("<p style='color:red'>No se ha podido registrar el cliente</p>");
            }
        %>
    </body>
</html>

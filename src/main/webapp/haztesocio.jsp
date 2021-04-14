<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hazte socio</title>
    </head>
    <body>
        <h1>Hazte socio</h1>
        <form method="post" action="anadir-socio">
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

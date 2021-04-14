<%@page import="com.sanvalero.gimnasio.domain.Tipo"%>
<%@page import="com.sanvalero.gimnasio.dao.TipoDao"%>
<%@page import="com.sanvalero.gimnasio.domain.Socio"%>
<%@page import="com.sanvalero.gimnasio.dao.*"%>
<%@page import="com.sanvalero.gimnasio.domain.*"%>
<%@page import="java.util.ArrayList"%>
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
            <%            for (Socio socio : socios) {
            %>
            <li><%= socio.getIdSocio()%> &nbsp; <%= socio.getNombre()%> &nbsp; <%= socio.getApellido()%> &nbsp; <%= socio.getDni()%> &nbsp; <%= socio.getDireccion()%>
                <a href="borrar-socio?id=<%= socio.getIdSocio()%>">Eliminar</a>
                <a href="EditarSocio.jsp?id=<%= socio.getIdSocio()%>">Editar</a></li></li>
                <%
                    }
                %>
    </ul>
    <%
        // Muestra el mensaje (si lo hay)
        String messageSocio = request.getParameter("messageSocio");
        if (messageSocio != null) {
    %>
    <p style='color:green'><%= messageSocio%></p>
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
        String statusSocio = request.getParameter("statusSocio");
        if (statusSocio == null) {
            statusSocio = "";
        }

        if (statusSocio.equals("ok")) {
            out.println("<p style='color:green'>El socio se ha registrado con éxito</p>");
        } else if (statusSocio.equals("error")) {
            out.println("<p style='color:red'>No se ha podido registrar el socio</p>");
        }
    %>


    <h1>Lista de tipos</h1>
    <%
        TipoDao tipoDao = new TipoDao(conexion);
        ArrayList<Tipo> tipos = tipoDao.listarTipo();

    %>
    <ul>
        <%            for (Tipo tipo : tipos) {
        %>
        <li><%= tipo.getIdTipo()%> &nbsp; <%= tipo.getNombreTipo()%> <a href="borrar-tipo?id=<%= tipo.getIdTipo()%>">Eliminar</a></li>
            <%
                }
            %>
    </ul>
    <%
        // Muestra el mensaje (si lo hay)
        String messageTipo = request.getParameter("messageTipo");
        if (messageTipo != null) {
    %>
    <p style='color:green'><%= messageTipo%></p>
    <%
        }
    %>

    <h1>Añadir tipo</h1>
    <form method="post" action="anadir-tipo-admin">
        Nombre de la actividad:
        <input type="text" name="nombre"/><br/>
        <input type="submit" value="Registrar"/>
    </form>
    <%
        String statusTipo = request.getParameter("statusTipo");
        if (statusTipo == null) {
            statusTipo = "";
        }

        if (statusTipo.equals("ok")) {
            out.println("<p style='color:green'>El tipo de actividad se ha registrado con éxito</p>");
        } else if (statusTipo.equals("error")) {
            out.println("<p style='color:red'>No se ha podido registrar el tipo de actividad</p>");
        }
    %>



    <h1>Lista de monitores</h1>
    <%
        MonitorDao monitorDao = new MonitorDao(conexion);
        ArrayList<Monitor> monitores = monitorDao.listarMonitor();

    %>
    <ul>
        <%            for (Monitor monitor : monitores) {
        %>
        <li><%= monitor.getIdMonitor()%> &nbsp; <%= monitor.getNombre()%> &nbsp; <%= monitor.getApellido()%> &nbsp; <%= monitor.getDni()%> &nbsp; <%= monitor.getDireccion()%>
            <a href="borrar-monitor?id=<%= monitor.getIdMonitor()%>">Eliminar</a>
            <a href="EditarMonitor.jsp?id=<%= monitor.getIdMonitor()%>">Editar</a></li>

        <%
            }
        %>
    </ul>
    <%
        // Muestra el mensaje (si lo hay)
        String messageMonitor = request.getParameter("messageMonitor");
        if (messageMonitor != null) {
    %>
    <p style='color:green'><%= messageMonitor%></p>
    <%
        }
    %>

    <h1>Añadir monitor</h1>
    <form method="post" action="anadir-monitor">
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
        String statusMonitor = request.getParameter("statusMonitor");
        if (statusMonitor == null) {
            statusMonitor = "";
        }

        if (statusMonitor.equals("ok")) {
            out.println("<p style='color:green'>El monitor se ha registrado con éxito</p>");
        } else if (statusMonitor.equals("error")) {
            out.println("<p style='color:red'>No se ha podido registrar el monitor</p>");
        }
    %>



    <h1>Lista de salas</h1>
    <%
        SalaDao saladao = new SalaDao(conexion);
        ArrayList<Sala> salas = saladao.listarSala();

    %>
    <ul>
        <%            for (Sala sala : salas) {
        %>
        <li><%= sala.getIdSala()%> &nbsp; <%= sala.getNombre()%> &nbsp; <%= sala.getExtension()%>
            <a href="borrar-sala?id=<%= sala.getIdSala()%>">Eliminar</a></li>
            <%
                }
            %>
    </ul>
    <%
        // Muestra el mensaje (si lo hay)
        String messageSala = request.getParameter("messageSala");
        if (messageSala != null) {
    %>
    <p style='color:green'><%= messageSala%></p>
    <%
        }
    %>

    <h1>Añadir sala</h1>
    <form method="post" action="anadir-sala">
        Nombre de la sala:
        <input type="text" name="nombre"/><br/>
        Extension
        <input type="text" name="extension"/><br/>
        <input type="submit" value="Registrar"/>
    </form>
    <%
        String statusSala = request.getParameter("statusSala");
        if (statusSala == null) {
            statusSala = "";
        }

        if (statusSala.equals("ok")) {
            out.println("<p style='color:green'>La sala se ha registrado con éxito</p>");
        } else if (statusSala.equals("error")) {
            out.println("<p style='color:red'>No se ha podido registrar la sala</p>");
        }
    %>
</body>
</html>

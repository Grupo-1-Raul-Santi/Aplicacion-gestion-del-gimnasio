
<%@page import="com.sanvalero.gimnasio.dao.MonitorDao"%>
<%@page import="com.sanvalero.gimnasio.domain.Monitor"%>
<%@page import="com.sanvalero.gimnasio.dao.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Conexion conexion = new Conexion();
            conexion.connect();

            Monitor monitor;
            MonitorDao monitordao = new MonitorDao(conexion);
            String id = request.getParameter("id");
            monitor = monitordao.listarMonitorId(id);
            //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada


        %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID
                <input type="text" readonly="" class="form-control" value="<%= monitor.getIdMonitor()%>"/>
                Nombre
                <input type="text" name="txtNom" class="form-control" value="<%= monitor.getNombre()%>"/><br>
                Apellido
                <input type="text" name="txtApe" class="form-control" value="<%= monitor.getApellido()%>"/><br>
                DNI
                <input type="text" name="txtDNI" class="form-control" value="<%= monitor.getDni()%>"/><br>
                Dirección
                <input type="text" name="txtDirec" class="form-control" value="<%= monitor.getDireccion()%>"/><br>
                
                <input type="submit" value="actualizar"/>
                <a href="areaadmin.jsp">Volver</a>
            </form>
        </div>
    </body>
</html>
<%
    monitor.setNombre(request.getParameter("txtNom"));
    monitor.setApellido(request.getParameter("txtApe"));
    monitor.setDni(request.getParameter("txtDNI"));
    monitor.setDireccion(request.getParameter("txtDirec"));

    if (monitor.getNombre()!= null && monitor.getDni() != null) {
        monitordao.editarMonitor(monitor);
        response.sendRedirect("areaadmin.jsp");
    }


%>

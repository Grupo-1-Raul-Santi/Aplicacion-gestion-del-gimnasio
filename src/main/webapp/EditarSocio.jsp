
<%@page import="com.sanvalero.gimnasio.dao.*"%>
<%@page import="com.sanvalero.gimnasio.domain.*"%>
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

            Socio socio;
            SocioDao sociodao = new SocioDao(conexion);
            String id = request.getParameter("id");
            socio = sociodao.listarSocioId(id);
            //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada


        %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID
                <input type="text" readonly="" class="form-control" value="<%= socio.getIdSocio()%>"/>
                Nombre
                <input type="text" name="txtNom" class="form-control" value="<%= socio.getNombre()%>"/><br>
                Apellido
                <input type="text" name="txtApe" class="form-control" value="<%= socio.getApellido()%>"/><br>
                DNI
                <input type="text" name="txtDNI" class="form-control" value="<%= socio.getDni()%>"/><br>
                Dirección
                <input type="text" name="txtDirec" class="form-control" value="<%= socio.getDireccion()%>"/><br>
                
                <input type="submit" value="actualizar"/>
                <a href="areaadmin.jsp">Volver</a>
            </form>
        </div>
    </body>
</html>
<%
    socio.setNombre(request.getParameter("txtNom"));
    socio.setApellido(request.getParameter("txtApe"));
    socio.setDni(request.getParameter("txtDNI"));
    socio.setDireccion(request.getParameter("txtDirec"));

    if (socio.getNombre()!= null && socio.getDni() != null) {
        sociodao.editarSocio(socio);
        response.sendRedirect("areaadmin.jsp");
    }


%>

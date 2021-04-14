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
        <script src="js/jquery-1.12.4-jquery.min.js" type="text/javascript"></script> 
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
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
        <div class-"container"> 
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

            <div class="form-group"> 
                <label class="col-sm-1 control-label">Country</label> 
                <div class="col-sm-3"> 
                    <select class="form-control" id="country" onchange="country_change()"> 
                        <option value="" selected="selected"> - select country - </option> 
                        <%
                            String dburl = "jdbc:mysql://localhost:3306/onchange_select_option_db";
                            String dbusername = "root";
                            String dbpassword = "";
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection(dburl, dbusername, dbpassword);
                                PreparedStatement pstmt = null;
                                pstmt = con.prepareStatement("SELECT * FROM country");
                                ResultSet rs = pstmt.executeQuery();
                                while (rs.next()) {
                        %> 
                        <option value=" <%=rs.getInt("country_id")%>"> 
                            <%=rs.getString("country_name")%> 
                        </option> 
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </select> 
                </div> 
                <label class="col-sm-1 control-label">State</label> 
                <div class="col-sm-3"> 
                    <select class="form-control" id="state" onchange="state_change()"> 
                        <option selected="selected"> - select state </option> 
                    </select> 
                </div> 
                <label class="col-sm-1 control-label">City</label> 
                <div class="col-sm-3"> 
                    <select class="form-control" id="city"> 
                        <option selected="selected"> select city </option> 
                    </select> 
                </div> 
            </div> 
    </body> 
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.gimnasio.dao.ActividadDao"%>
<%@page import="com.sanvalero.gimnasio.dao.Conexion"%>
<%@page import="com.sanvalero.gimnasio.domain.Actividad"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 

<%
    if (request.getParameter("idActividad") != null) {
        Actividad actividad = new Actividad();

        actividad.setIdActividad(request.getParameter("idActividad")); //ACTIVIDADid

        Conexion conexion = new Conexion();
        conexion.connect();
        ActividadDao actividadDao = new ActividadDao(conexion);
        ArrayList<Actividad> actividades = actividadDao.listarSalaActividad(actividad);


%> 
<option selected="selected">--Selecionar sala--</option>
<%    for (Actividad actAux : actividades) {
%>
<option value="<%= actAux.getIdActividad()%>" > <%= actAux.getSala().getNombre()%> </option>
<%}%>
<%}%>
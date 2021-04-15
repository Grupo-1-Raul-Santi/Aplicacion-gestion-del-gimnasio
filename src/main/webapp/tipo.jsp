<%@page import="com.sanvalero.gimnasio.domain.Tipo"%>
<%@page import="com.sanvalero.gimnasio.dao.SalaDao"%>
<%@page import="com.sanvalero.gimnasio.domain.Sala"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.gimnasio.dao.ActividadDao"%>
<%@page import="com.sanvalero.gimnasio.dao.Conexion"%>
<%@page import="com.sanvalero.gimnasio.domain.Actividad"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 

<%
    if (request.getParameter("idTipo") != null) {
        Tipo tipo = new Tipo();

        tipo.setIdTipo(request.getParameter("idTipo"));

        Conexion conexion = new Conexion();
        conexion.connect();
        SalaDao saladao = new SalaDao(conexion);
        ArrayList<Sala> salas = saladao.listarSalaActividad(tipo);


%> 
<option selected="selected">--Selecionar sala--</option>
<%    for (Sala salaAux : salas) {
%>
<option value="<%= salaAux.getIdSala()%>" > <%= salaAux.getNombre()%> </option>
<%}%>
<%}%>
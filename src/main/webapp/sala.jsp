<%@page import="com.sanvalero.gimnasio.domain.Monitor"%>
<%@page import="com.sanvalero.gimnasio.dao.MonitorDao"%>
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
    if (request.getParameter("idSala") != null) {
        Sala sala = new Sala();
        Tipo tipo = new Tipo();
        Actividad act = new Actividad();


        sala.setIdSala(request.getParameter("idSala"));
        act.setSala(sala);
        tipo.setIdTipo(request.getParameter("idTipo"));
        act.setTipo(tipo);


        Conexion conexion = new Conexion();
        conexion.connect();
        MonitorDao monitordao = new MonitorDao(conexion);
        ArrayList<Monitor> monitores = monitordao.listarMonitorActividad(act);


%> 
<option selected="selected">--Selecionar monitor--</option>
<%    for (Monitor monAux : monitores) {
%>
<option value="<%= monAux.getIdMonitor()%>" > <%= monAux.getNombre()%> </option>
<%}%>
<%}%>
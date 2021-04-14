package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.Conexion;
import com.sanvalero.gimnasio.dao.MonitorDao;
import com.sanvalero.gimnasio.dao.SocioDao;
import com.sanvalero.gimnasio.domain.Monitor;
import com.sanvalero.gimnasio.domain.Socio;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que añade una película a la base de datos
 */
@WebServlet(name = "anadir-monitor", urlPatterns = {"/anadir-monitor"})
public class AnadirMonitorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String direccion = request.getParameter("direccion");
        Monitor monitor = new Monitor(nombre, apellido, dni, direccion);

        Conexion conexion = new Conexion();
        conexion.connect();
        MonitorDao monitorDao = new MonitorDao(conexion);

        try {
            monitorDao.crearMonitor(monitor);

            PrintWriter out = response.getWriter();
            response.sendRedirect("areaadmin.jsp?statusMonitor=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("areaadmin.jsp?statusMonitor=error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}

package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.Conexion;
import com.sanvalero.gimnasio.dao.MonitorDao;
import com.sanvalero.gimnasio.dao.SocioDao;
import com.sanvalero.gimnasio.domain.Monitor;
import com.sanvalero.gimnasio.domain.Socio;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que elimina una película a la base de datos
 */
@WebServlet(name = "borrar-monitor", urlPatterns = {"/borrar-monitor"})
public class BorrarMonitorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException, SQLException {
        Monitor monitor = new Monitor();
        monitor.setIdMonitor(request.getParameter("id"));

        Conexion conexion = new Conexion();
        conexion.connect();
        MonitorDao monitorDao = new MonitorDao(conexion);
        monitorDao.borrarMonitor(monitor);

        response.sendRedirect("areaadmin.jsp?messageMonitor=Monitor eliminado");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(BorrarMonitorServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(BorrarMonitorServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

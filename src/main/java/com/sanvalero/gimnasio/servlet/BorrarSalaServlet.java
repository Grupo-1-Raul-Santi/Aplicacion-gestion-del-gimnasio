package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.*;
import com.sanvalero.gimnasio.domain.*;
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
@WebServlet(name = "borrar-sala", urlPatterns = {"/borrar-sala"})
public class BorrarSalaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException, SQLException {
        Sala sala = new Sala();
        sala.setIdSala((request.getParameter("id")));

        Conexion conexion = new Conexion();
        conexion.connect();
        SalaDao salaDao = new SalaDao(conexion);
        salaDao.borrarSala(sala);

        response.sendRedirect("areaadmin.jsp?messageSala=Sala eliminada");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(BorrarSalaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(BorrarSalaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

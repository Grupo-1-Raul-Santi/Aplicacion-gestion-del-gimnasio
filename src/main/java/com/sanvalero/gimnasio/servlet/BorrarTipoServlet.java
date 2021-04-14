package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.Conexion;
import com.sanvalero.gimnasio.dao.SocioDao;
import com.sanvalero.gimnasio.dao.TipoDao;
import com.sanvalero.gimnasio.domain.Socio;
import com.sanvalero.gimnasio.domain.Tipo;
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
 * Servlet que elimina un tipo a la base de datos
 */
@WebServlet(name = "borrar-tipo", urlPatterns = {"/borrar-tipo"})
public class BorrarTipoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException, SQLException {
        Tipo tipo = new Tipo();
        tipo.setIdTipo(request.getParameter("id"));

        Conexion conexion = new Conexion();
        conexion.connect();
        TipoDao tipoDao = new TipoDao(conexion);
        tipoDao.borrarTipo(tipo);

        response.sendRedirect("areaadmin.jsp?messageTipo=Tipo de actividad eliminado");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(BorrarSocioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(BorrarSocioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
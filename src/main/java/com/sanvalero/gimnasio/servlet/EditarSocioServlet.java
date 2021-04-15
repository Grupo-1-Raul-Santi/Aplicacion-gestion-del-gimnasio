package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.Conexion;
import com.sanvalero.gimnasio.dao.SocioDao;
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
@WebServlet(name = "editar-socio", urlPatterns = {"/editar-socio"})
public class EditarSocioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException, SQLException {

        Socio socio = new Socio();
        Conexion conexion = new Conexion();
        conexion.connect();

        socio.setIdSocio(request.getParameter("txtId"));
        socio.setNombre(request.getParameter("txtNom"));
        socio.setApellido(request.getParameter("txtApe"));
        socio.setDni(request.getParameter("txtDNI"));
        socio.setDireccion(request.getParameter("txtDirec"));

        SocioDao socioDao = new SocioDao(conexion);

        try {
            socioDao.editarSocio(socio);
            response.sendRedirect("areaadmin.jsp?statusSocioEdit=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("areaadmin.jsp?statusSocioEdit=error");
        }

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

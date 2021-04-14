package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.Conexion;
import com.sanvalero.gimnasio.dao.SocioDao;
import com.sanvalero.gimnasio.dao.TipoDao;
import com.sanvalero.gimnasio.domain.Socio;
import com.sanvalero.gimnasio.domain.Tipo;
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
@WebServlet(name = "anadir-tipo-admin", urlPatterns = {"/anadir-tipo-admin"})
public class AnadirTipoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String nombre = request.getParameter("nombre");
        Tipo tipo = new Tipo(nombre);

        Conexion conexion = new Conexion();
        conexion.connect();
        TipoDao tipoDao = new TipoDao(conexion);

        try {
            tipoDao.crearTipo(tipo);

            PrintWriter out = response.getWriter();
            response.sendRedirect("areaadmin.jsp?statusTipo=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("areaadmin.jsp?statusTipo=error");
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

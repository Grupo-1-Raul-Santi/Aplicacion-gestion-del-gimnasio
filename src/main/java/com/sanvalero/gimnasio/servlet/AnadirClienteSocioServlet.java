package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.Conexion;
import com.sanvalero.gimnasio.dao.SocioDao;
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
@WebServlet(name = "anadir-socio", urlPatterns = {"/anadir-socio"})
public class AnadirClienteSocioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String direccion = request.getParameter("direccion");
        Socio socio = new Socio(nombre, apellido, dni, direccion);

        Conexion conexion = new Conexion();
        conexion.connect();
        SocioDao socioDao = new SocioDao(conexion);

        try {
            socioDao.crearSocio(socio);

            PrintWriter out = response.getWriter();
            response.sendRedirect("haztesocio.jsp?status=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("haztesocio.jsp?status=error");
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

package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.*;
import com.sanvalero.gimnasio.domain.*;
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
@WebServlet(name = "anadir-sala", urlPatterns = {"/anadir-sala"})
public class AnadirSalaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String nombre = request.getParameter("nombre");
        int extension = Integer.parseInt(request.getParameter("extension"));
        Sala sala = new Sala(nombre, extension);

        Conexion conexion = new Conexion();
        conexion.connect();
        SalaDao saladao = new SalaDao(conexion);

        try {
            saladao.crearSala(sala);

            PrintWriter out = response.getWriter();
            response.sendRedirect("areaadmin.jsp?statusSala=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("areaadmin.jsp?statusSala=error");
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

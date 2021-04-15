/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.ActividadDao;
import com.sanvalero.gimnasio.dao.Conexion;
import com.sanvalero.gimnasio.dao.RealizaDao;
import com.sanvalero.gimnasio.dao.SocioDao;
import com.sanvalero.gimnasio.domain.Actividad;
import com.sanvalero.gimnasio.domain.Monitor;
import com.sanvalero.gimnasio.domain.Realiza;
import com.sanvalero.gimnasio.domain.Sala;
import com.sanvalero.gimnasio.domain.Socio;
import com.sanvalero.gimnasio.domain.Tipo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raul
 */
@WebServlet(name = "cita-socio", urlPatterns = {"/cita-socio"})
public class CitaSocioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException, SQLException {

        Tipo tipo = new Tipo();
        Sala sala = new Sala();
        Socio socio = new Socio();
        Monitor monitor = new Monitor();
        Actividad actividad = new Actividad();

        socio.setIdSocio(request.getParameter("idSocio"));
        System.out.println(socio.getIdSocio());

        tipo.setIdTipo(request.getParameter("tipo"));
        System.out.println(tipo.getIdTipo());
        actividad.setTipo(tipo);

        sala.setIdSala(request.getParameter("sala"));
        System.out.println(sala.getIdSala());
        actividad.setSala(sala);

        monitor.setIdMonitor(request.getParameter("monitor"));
        System.out.println(monitor.getIdMonitor());
        actividad.setMonitor(monitor);

        Conexion conexion = new Conexion();
        conexion.connect();
        ActividadDao actividadDao = new ActividadDao(conexion);

        actividad = actividadDao.listarIdActividad(actividad);
        Realiza realiza = new Realiza("16/04/2021", socio, actividad);
        RealizaDao realizaDao = new RealizaDao(conexion);

        try {

            realizaDao.crearRealizan(realiza);
            response.sendRedirect("areasocioPRUEBA.jsp?status=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("areasocioPRUEBA.jsp?status=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CitaSocioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CitaSocioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

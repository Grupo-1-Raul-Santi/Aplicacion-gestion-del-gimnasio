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
@WebServlet(name = "crear-actividad", urlPatterns = {"/crear-actividad"})
public class CrearActividadServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
           ServletException, IOException, SQLException {
       
        String descripcion;
        Tipo tipo = new Tipo();
        Sala sala = new Sala();
        Monitor monitor = new Monitor();
        Actividad actividad = new Actividad();

        descripcion = request.getParameter("descripcionAux");
        actividad.setDescripcion(descripcion);
        
        tipo.setIdTipo(request.getParameter("tipoAux"));
        actividad.setTipo(tipo);

        sala.setIdSala(request.getParameter("salaAux"));
        actividad.setSala(sala);

        monitor.setIdMonitor(request.getParameter("monitorAux"));
        actividad.setMonitor(monitor);

        Conexion conexion = new Conexion();
        conexion.connect();
        ActividadDao actividadDao = new ActividadDao(conexion);


        try {
            actividadDao.crearActividad(actividad);
            response.sendRedirect("areaadmin.jsp?crearActividad=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("areaadmin.jsp?crearActividad=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CrearActividadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CrearActividadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

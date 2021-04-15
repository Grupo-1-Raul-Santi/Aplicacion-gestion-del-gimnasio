/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanvalero.gimnasio.servlet;

import com.sanvalero.gimnasio.dao.Conexion;
import com.sanvalero.gimnasio.dao.SocioDao;
import com.sanvalero.gimnasio.domain.Socio;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
@WebServlet(name = "comprobar-dni-socio", urlPatterns = {"/comprobar-dni-socio"})
public class ComprobarDniSocioServlet extends HttpServlet{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException, SQLException {

        String nombre = "";
        String apellido = "";
        String idSocio = "";
        ArrayList<Socio> socios = new ArrayList<>();
        Conexion conexion = new Conexion();
        conexion.connect();
        Socio socio = new Socio();
        socio.setDni(request.getParameter("dni"));
        SocioDao sociodao = new SocioDao(conexion);
        socios = sociodao.listarNombreApellido(socio);
        for (Socio socioAux : socios) {
            idSocio = socioAux.getIdSocio();
            nombre = socioAux.getNombre();
            apellido = socioAux.getApellido();
        }

        response.sendRedirect("areasocio.jsp?nombre=" + nombre + "&apellido=" + apellido + "&idSocio=" + idSocio);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(ComprobarDniSocioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(ComprobarDniSocioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

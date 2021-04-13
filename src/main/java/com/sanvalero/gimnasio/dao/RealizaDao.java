package com.sanvalero.gimnasio.dao;

import com.sanvalero.gimnasio.domain.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RealizaDao {
    private Conexion conexion;
    private int confirm;

    public RealizaDao(Conexion conexion) {
        this.conexion = conexion;
    }
    
    
    public int crearRealizan (Realiza rea) throws SQLException {
        String sql = "INSERT INTO REALIZAN (ID_SOCIO, ID_ACTIVIDAD, FECHA) VALUES (?, ?, ?)";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, rea.getSocio().getIdSocio());
        sentencia.setString(2, rea.getActividad().getIdActividad());
        sentencia.setString(3, rea.getFecha());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public int borrarRealizanActividad(Realiza rea) throws SQLException {
        String sql = "DELETE FROM REALIZAN WHERE ID_ACTIVIDAD = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, rea.getActividad().getIdActividad());
        confirm = sentencia.executeUpdate();
        return confirm;
    }
    
     public int borrarRealizanSocio(Realiza rea) throws SQLException {
        String sql = "DELETE FROM REALIZAN WHERE ID_SOCIO = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, rea.getSocio().getIdSocio());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public ArrayList<Realiza> listarRealizan(Realiza rea) throws SQLException {
        ArrayList<Realiza> realizaciones = new ArrayList<>();
        String sql = "SELECT * FROM REALIZAN WHERE ID_ACTIVIDAD = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, rea.getActividad().getIdActividad());
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Socio socioAux = new Socio();
            Actividad actAux = new Actividad();
            Realiza reaAux = new Realiza();
            
            socioAux.setIdSocio(rs.getString(1));
            reaAux.setSocio(socioAux);
            actAux.setIdActividad(rs.getString(2));
            reaAux.setActividad(actAux);
            reaAux.setFecha(rs.getString(3));
            realizaciones.add(reaAux);
        }
        return realizaciones;
    }
}

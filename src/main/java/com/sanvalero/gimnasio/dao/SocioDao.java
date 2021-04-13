package com.sanvalero.gimnasio.dao;

import com.sanvalero.gimnasio.domain.Sala;
import com.sanvalero.gimnasio.domain.Socio;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SocioDao {

    private Conexion conexion;
    private int confirm;

    public SocioDao(Conexion conexion) {
        this.conexion = conexion;
    }

    public int crearSocio(Socio socio) throws SQLException {
        String sql = "INSERT INTO SOCIOS (NOMBRE_SOCIO, APELLIDO_SOCIO, DNI, DIRECCION) VALUES ( ? , ? , ? , ? )";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, socio.getNombre());
        sentencia.setString(2, socio.getApellido());
        sentencia.setString(3, socio.getDni());
        sentencia.setString(4, socio.getDireccion());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public int borrarSocio(Socio socio) throws SQLException {
        String sql = "DELETE FROM SOCIOS WHERE ID_SOCIO = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, socio.getIdSocio());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public ArrayList<Socio> listarSocio(Socio socio) throws SQLException {
        ArrayList<Socio> socios = new ArrayList<>();
        String sql = "SELECT * FROM SOCIOS WHERE ID_SOCIO = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, socio.getIdSocio());
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Socio socioAux = new Socio();
            socioAux.setIdSocio(rs.getString(1));
            socioAux.setIdSocio(rs.getString(2));
            socioAux.setIdSocio(rs.getString(3));
            socioAux.setIdSocio(rs.getString(4));
            socioAux.setIdSocio(rs.getString(5));
            socios.add(socioAux);
        }
        return socios;
    }
    
    public ArrayList<Socio> listarNombreApellido(Socio socio) throws SQLException {
        ArrayList<Socio> socios = new ArrayList<>();
        String sql = "SELECT NOMBRE_SOCIO, APELLIDO_SOCIO FROM SOCIOS WHERE DNI = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, socio.getDni());
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Socio socioAux = new Socio();
            socioAux.setNombre(rs.getString(1));
            socioAux.setApellido(rs.getString(2));
            socios.add(socioAux);
        }
        return socios;
    }
}

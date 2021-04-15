package com.sanvalero.gimnasio.dao;

import com.sanvalero.gimnasio.domain.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ActividadDao {

    private Conexion conexion;
    private int confirm;

    public ActividadDao(Conexion conexion) {
        this.conexion = conexion;
    }

    public int crearActividad(Actividad act) throws SQLException {
        String sql = "INSERT INTO ACTIVIDADES (DESCRIPCION, ID_TIPO, ID_SALA, ID_MONITOR) VALUES (?, ?, ?, ?)";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, act.getDescripcion());
        sentencia.setString(2, act.getTipo().getIdTipo());
        sentencia.setString(3, act.getSala().getIdSala());
        sentencia.setString(4, act.getMonitor().getIdMonitor());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public int borrarActividad(Actividad act) throws SQLException {
        String sql = "DELETE FROM ACTIVIDADES WHERE ID_ACTIVIDAD = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, act.getIdActividad());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public ArrayList<Actividad> listarActividad(Actividad act) throws SQLException {
        ArrayList<Actividad> actividades = new ArrayList<>();
        String sql = "SELECT * FROM ACTIVIDADES WHERE ID_ACTIVIDAD = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, act.getIdActividad());
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Tipo tipoAux = new Tipo();
            Sala salaAux = new Sala();
            Monitor monAux = new Monitor();
            Actividad actAux = new Actividad();

            actAux.setIdActividad(rs.getString(1));
            actAux.setDescripcion(rs.getString(2));
            tipoAux.setIdTipo(rs.getString(3));
            actAux.setTipo(tipoAux);
            salaAux.setIdSala(rs.getString(4));
            actAux.setSala(salaAux);
            monAux.setIdMonitor(rs.getString(5));
            actAux.setMonitor(monAux);
            actividades.add(actAux);
        }
        return actividades;
    }

    public ArrayList<Actividad> listarTiposSalasActividad() throws SQLException {
        ArrayList<Actividad> actividades = new ArrayList<>();

        String sql = "SELECT A.ID_ACTIVIDAD, T.NOMBRE_TIPO FROM "
                + "ACTIVIDADES A INNER JOIN TIPOS T ON T.ID_TIPO = A.ID_TIPO ";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);

        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Actividad act = new Actividad();

            act.setIdActividad(rs.getString(1));

            act.setDescripcion(rs.getString(2));

            actividades.add(act);
        }
        return actividades;
    }

    public ArrayList<Actividad> listarSalaActividad(Actividad act) throws SQLException {
        ArrayList<Actividad> actividades = new ArrayList<>();
        String sql = "SELECT A.ID_ACTIVIDAD, S.NOMBRE_SALA FROM ACTIVIDADES A INNER JOIN SALAS S ON S.ID_SALA = A.ID_SALA WHERE A.ID_ACTIVIDAD = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, act.getIdActividad());
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Actividad actAux = new Actividad();
            Sala salaAux = new Sala();
            actAux.setIdActividad(rs.getString(1));
            salaAux.setNombre(rs.getString(2));
            actAux.setSala(salaAux);
            actividades.add(actAux);
        }
        return actividades;
    }
}

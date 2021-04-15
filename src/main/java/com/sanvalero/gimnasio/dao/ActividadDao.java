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

    /**
     * Devuelve el id de la actividad selecionada según el tipo de actividad, la
     * sala y el monitor.
     *
     * @param act Objeto de tipo ciudad con ID_TIPO, ID_SALA y ID_MONITOR
     * @return ID_ACTIVIDAD
     * @throws SQLException
     */
    public Actividad listarIdActividad(Actividad act) throws SQLException {
        String sql = "SELECT ID_ACTIVIDAD FROM ACTIVIDADES WHERE ID_TIPO = ? AND ID_SALA= ? AND ID_MONITOR= ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);

        sentencia.setString(1, act.getTipo().getIdTipo());
        sentencia.setString(2, act.getSala().getIdSala());
        sentencia.setString(3, act.getMonitor().getIdMonitor());

        ResultSet rs = sentencia.executeQuery();
        Actividad actAux = new Actividad();
        
        while (rs.next()) {

            actAux.setIdActividad(rs.getString(1));

        }
        return actAux;
    }
}

package com.sanvalero.gimnasio.dao;

import com.sanvalero.gimnasio.domain.Actividad;
import com.sanvalero.gimnasio.domain.Monitor;
import com.sanvalero.gimnasio.domain.Sala;
import com.sanvalero.gimnasio.domain.Tipo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MonitorDao {

    private Conexion conexion;
    private int confirm;

    public MonitorDao(Conexion conexion) {
        this.conexion = conexion;
    }

    public int crearMonitor(Monitor monitor) throws SQLException {
        String sql = "INSERT INTO MONITORES (NOMBRE_MONITOR, APELLIDO_MONITOR, DNI, DIRECCION) VALUES (?, ?, ?, ?)";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, monitor.getNombre());
        sentencia.setString(2, monitor.getApellido());
        sentencia.setString(3, monitor.getDni());
        sentencia.setString(4, monitor.getDireccion());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public int borrarMonitor(Monitor monitor) throws SQLException {
        String sql = "DELETE FROM MONITORES WHERE ID_MONITOR = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, monitor.getIdMonitor());
        confirm = sentencia.executeUpdate();
        return confirm;
    }
    
    public int editarMonitor(Monitor monitor) throws SQLException {
        String sql = "UPDATE MONITORES SET NOMBRE_MONITOR = ?, APELLIDO_MONITOR = ?, DNI = ?, DIRECCION = ? WHERE ID_MONITOR = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, monitor.getNombre());
        sentencia.setString(2, monitor.getApellido());
        sentencia.setString(3, monitor.getDni());
        sentencia.setString(4, monitor.getDireccion());
        sentencia.setString(5, monitor.getIdMonitor());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public ArrayList<Monitor> listarMonitor() throws SQLException {
        ArrayList<Monitor> monitores = new ArrayList<>();
        String sql = "SELECT * FROM MONITORES";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Monitor monitorAux = new Monitor();
            monitorAux.setIdMonitor(rs.getString(1));
            monitorAux.setNombre(rs.getString(2));
            monitorAux.setApellido(rs.getString(3));
            monitorAux.setDni(rs.getString(4));
            monitorAux.setDireccion(rs.getString(5));
            monitores.add(monitorAux);
        }
        return monitores;
    }
    
    public Monitor listarMonitorId(String id) throws SQLException {
        String sql = "SELECT * FROM MONITORES WHERE ID_MONITOR = "+id;
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        ResultSet rs = sentencia.executeQuery();
        Monitor monitorAux = new Monitor();
        while (rs.next()) {
            monitorAux.setIdMonitor(rs.getString(1));
            monitorAux.setNombre(rs.getString(2));
            monitorAux.setApellido(rs.getString(3));
            monitorAux.setDni(rs.getString(4));
            monitorAux.setDireccion(rs.getString(5));
        }
        return monitorAux;
    }
    
    public ArrayList<Monitor> listarMonitorActividad(Actividad act) throws SQLException {
        ArrayList<Monitor> monitores = new ArrayList<>();
        String sql = "SELECT M.ID_MONITOR, M.NOMBRE_MONITOR "
                + "FROM ACTIVIDADES A INNER JOIN MONITORES M "
                + "ON M.ID_MONITOR = A.ID_MONITOR "
                + "WHERE A.ID_SALA= ? AND A.ID_TIPO= ? "
                + "GROUP BY M.ID_MONITOR, M.NOMBRE_MONITOR";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, act.getSala().getIdSala());
        sentencia.setString(2, act.getTipo().getIdTipo());
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Monitor mon = new Monitor();
            mon.setIdMonitor(rs.getString(1));
            mon.setNombre(rs.getString(2));
            monitores.add(mon);
        }
        return monitores;
    }
}

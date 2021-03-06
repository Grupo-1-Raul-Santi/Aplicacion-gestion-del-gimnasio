package com.sanvalero.gimnasio.dao;

import com.sanvalero.gimnasio.domain.Actividad;
import com.sanvalero.gimnasio.domain.Sala;
import com.sanvalero.gimnasio.domain.Tipo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SalaDao {

    private Conexion conexion;
    private int confirm;

    public SalaDao(Conexion conexion) {
        this.conexion = conexion;
    }

    public int crearSala(Sala sala) throws SQLException {
        String sql = "INSERT INTO SALAS (NOMBRE_SALA, EXTENSION) VALUES (?, ?)";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, sala.getNombre());
        sentencia.setString(2, String.valueOf(sala.getExtension()));
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public int borrarSala(Sala sala) throws SQLException {
        String sql = "DELETE FROM SALAS WHERE ID_SALA = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, sala.getIdSala());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public ArrayList<Sala> listarSala() throws SQLException {
        ArrayList<Sala> salas = new ArrayList<>();
        String sql = "SELECT * FROM SALAS";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Sala salaAux = new Sala();
            salaAux.setIdSala(rs.getString(1));
            salaAux.setNombre(rs.getString(2));
            salaAux.setExtension(rs.getInt(3));
            salas.add(salaAux);
        }
        return salas;
    }
    
    public ArrayList<Sala> listarSalaActividad(Tipo tipo) throws SQLException {
        ArrayList<Sala> salas = new ArrayList<>();
        String sql = "SELECT S.ID_SALA, S.NOMBRE_SALA "
                + "FROM ACTIVIDADES A INNER JOIN SALAS S "
                + "ON S.ID_SALA = A.ID_SALA WHERE ID_TIPO= ?"
                + "GROUP BY S.ID_SALA, S.NOMBRE_SALA";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, tipo.getIdTipo());
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Sala salaAux = new Sala();
            salaAux.setIdSala(rs.getString(1));
            salaAux.setNombre(rs.getString(2));
            salas.add(salaAux);
        }
        return salas;
    }
}

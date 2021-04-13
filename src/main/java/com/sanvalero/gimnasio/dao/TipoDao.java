package com.sanvalero.gimnasio.dao;

import com.sanvalero.gimnasio.domain.Sala;
import com.sanvalero.gimnasio.domain.Tipo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TipoDao {

    private Conexion conexion;
    private int confirm;

    public TipoDao(Conexion conexion) {
        this.conexion = conexion;
    }

    public int crearTipo(Tipo tipo) throws SQLException {
        String sql = "INSERT INTO TIPOS (NOMBRE_TIPO) VALUES ( ? )";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, tipo.getNombreTipo());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public int borrarTipo(Tipo tipo) throws SQLException {
        String sql = "DELETE FROM TIPOS WHERE ID_TIPO = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, tipo.getIdTipo());
        confirm = sentencia.executeUpdate();
        return confirm;
    }

    public ArrayList<Tipo> listarTipo(Tipo tipo) throws SQLException {
        ArrayList<Tipo> tipos = new ArrayList<>();
        String sql = "SELECT * FROM TIPOS WHERE ID_TIPO = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(sql);
        sentencia.setString(1, tipo.getIdTipo());
        ResultSet rs = sentencia.executeQuery();
        while (rs.next()) {
            Tipo tipoAux = new Tipo();
            tipoAux.setIdTipo(rs.getString(1));
            tipoAux.setNombreTipo(rs.getString(2));
            tipos.add(tipoAux);
        }
        return tipos;
    }
}

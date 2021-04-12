
package com.sanvalero.netflix.dao;

import com.sanvalero.netflix.domain.Movie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovieDAO {

    private final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private final String URL_CONEXION = "jdbc:mysql://localhost:3306/netflix";
    private final String USUARIO = "netflixuser";
    private final String CONTRASENA = "netflix1234";
    
    private Connection connection;
    
    public MovieDAO() {
        connect();
    }
    
    /**
     * Conecta con la base de datos
     */
    public void connect() {
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL_CONEXION, USUARIO, CONTRASENA);
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
    
    /**
     * Desconecta de la base de datos
     */
    public void disconnect() {
        try {
            connection.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
    
    /**
     * Añade una pelicula a la base de datos
     * @param movie La pelicula con la información que se quiere registrar
     * @throws SQLException 
     */
    public void addMovie(Movie movie) throws SQLException {
        String sql = "INSERT INTO movies (title, director, duration, category, viewed) " +
                "VALUES (?, ?, ?, ?, ?)";
        
        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setString(1, movie.getTitle());
        sentencia.setString(2, movie.getDirector());
        sentencia.setInt(3, movie.getDuration());
        sentencia.setString(4, movie.getCategory());
        sentencia.setBoolean(5, movie.isViewed());
        sentencia.executeUpdate();
    }
    
    /**
     * Obtiene la lista de peliculas de la base de datos
     * @return Una colección con las peliculas
     */
    public ArrayList<Movie> getAllMovies() throws SQLException {        
        return new ArrayList<>();
    }
    
    /**
     * Elimina una película
     * @param id El id de la pelicula a eliminar
     */
    public void removeMovie(int id) {
        
    }
    
    /**
     * Modifica la información de una pelicula
     * @param movie La película con la información a modificar
     */
    public void modifyMovie(Movie movie) {
        
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanvalero.gimnasio.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Raul
 */
public class Conexion {

    private Connection conexion;
    private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
   // private final String URL_CONEXION = "jdbc:oracle:thin:@192.168.108.6:1521/XE";
    //private final String USUARIO = "GESTION_GYM";
    //private final String CONTRASENA = "1234";

    //Conexion Raul
    //private final String URL_CONEXION = "jdbc:oracle:thin:@localhost:1521:XE";
    //private final String USUARIO = "RAULCOROE";
    //private final String URL_CONEXION = "jdbc:oracle:thin:@localhost:1521:XE";
    
    // Conexion Santi
    //private final String USUARIO = "GESTION";


    // Conexion Lara
    private final String URL_CONEXION = "jdbc:oracle:thin:@192.168.108.6:1521/XE";
    private final String USUARIO = "GESTION_GYM";
    private final String CONTRASENA = "1234";

    public Connection getConexion() {
        return conexion;
    }

    /**
     * Método que permite conectar el proyecto a la BBDD
     */
    public void connect() {
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL_CONEXION, USUARIO, CONTRASENA);
            if (conexion != null) {
                System.out.println("Conexion exitosa a GIMNASIO"); // CAMBIAR NOMBRE DE LA CONEXION
            } else {
                System.out.println("Conexion fallida");
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }

    /**
     * Metodo que desconecta la BBDD
     */
    public void desconectar() {
        try {
            conexion.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}

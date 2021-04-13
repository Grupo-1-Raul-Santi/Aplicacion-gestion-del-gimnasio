/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanvalero.gimnasio.domain;

/**
 *
 * @author Raul
 */
public abstract class Persona {
    protected String nombre;
    protected String apellido;
    protected String dni;
    protected String direccion;

    public Persona(String nombre, String apellido, String dni, String direccion) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
    }

    public Persona() {
    }
    
    
    
}

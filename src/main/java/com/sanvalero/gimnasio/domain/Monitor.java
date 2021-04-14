/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanvalero.gimnasio.domain;

import java.util.Objects;

/**
 *
 * @author Raul
 */
public class Monitor extends Persona{
    private String idMonitor;

    public Monitor(String nombre, String apellido, String dni, String direccion) {
        super(nombre, apellido, dni, direccion);
    }
    
    public Monitor() {
    }

    public String getIdMonitor() {
        return idMonitor;
    }

    public void setIdMonitor(String idMonitor) {
        this.idMonitor = idMonitor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "Monitor{" + "idMonitor=" + idMonitor + '}';
    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Monitor other = (Monitor) obj;
        if (!Objects.equals(this.idMonitor, other.idMonitor)) {
            return false;
        }
        return true;
    }

    
    
}

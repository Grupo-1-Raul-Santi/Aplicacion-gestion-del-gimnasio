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
public class Sala {
    private String idSala;
    private String nombre;
    private int extension;

    public Sala(String idSala, String nombre, int extension) {
        this.idSala = idSala;
        this.nombre = nombre;
        this.extension = extension;
    }

    public Sala() {
    }

    public String getIdSala() {
        return idSala;
    }

    public void setIdSala(String idSala) {
        this.idSala = idSala;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getExtension() {
        return extension;
    }

    public void setExtension(int extension) {
        this.extension = extension;
    }

    @Override
    public String toString() {
        return "Sala{" + "idSala=" + idSala + ", nombre=" + nombre + ", extension=" + extension + '}';
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
        final Sala other = (Sala) obj;
        if (this.extension != other.extension) {
            return false;
        }
        if (!Objects.equals(this.idSala, other.idSala)) {
            return false;
        }
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        return true;
    }
    
    
}

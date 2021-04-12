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
public class Actividad {
    private String idActividad;
    private String descripcion;
    private Tipo tipo;
    private Sala sala;
    private Monitor monitor;

    public Actividad(String idActividad, String descripcion, Tipo tipo, Sala sala, Monitor monitor) {
        this.idActividad = idActividad;
        this.descripcion = descripcion;
        this.tipo = tipo;
        this.sala = sala;
        this.monitor = monitor;
    }

    public Actividad() {
    }

    public String getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(String idActividad) {
        this.idActividad = idActividad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

    public Sala getSala() {
        return sala;
    }

    public void setSala(Sala sala) {
        this.sala = sala;
    }

    public Monitor getMonitor() {
        return monitor;
    }

    public void setMonitor(Monitor monitor) {
        this.monitor = monitor;
    }

    @Override
    public String toString() {
        return "Actividad{" + "idActividad=" + idActividad + ", descripcion=" + descripcion + ", tipo=" + tipo + ", sala=" + sala + ", monitor=" + monitor + '}';
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
        final Actividad other = (Actividad) obj;
        if (!Objects.equals(this.idActividad, other.idActividad)) {
            return false;
        }
        return true;
    }


    
  
    
  
}

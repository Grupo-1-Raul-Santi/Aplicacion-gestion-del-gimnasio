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
public class Realiza {
    private String fecha;
    private Socio socio;
    private Actividad actividad;

    public Realiza(String fecha, Socio socio, Actividad actividad) {
        this.fecha = fecha;
        this.socio = socio;
        this.actividad = actividad;
    }

    public Realiza() {
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Socio getSocio() {
        return socio;
    }

    public void setSocio(Socio socio) {
        this.socio = socio;
    }

    public Actividad getActividad() {
        return actividad;
    }

    public void setActividad(Actividad actividad) {
        this.actividad = actividad;
    }

    @Override
    public String toString() {
        return "Realiza{" + "fecha=" + fecha + ", socio=" + socio + ", actividad=" + actividad + '}';
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
        final Realiza other = (Realiza) obj;
        if (!Objects.equals(this.fecha, other.fecha)) {
            return false;
        }
        if (!Objects.equals(this.socio, other.socio)) {
            return false;
        }
        if (!Objects.equals(this.actividad, other.actividad)) {
            return false;
        }
        return true;
    }
    
    
}

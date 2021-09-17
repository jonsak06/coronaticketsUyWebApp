/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.datatypes;

import java.sql.Date;

/**
 *
 * @author tecnologo
 */
public class DtPaqueteDeEspectaculos {
    private Long id;
    private String nombre;
    private String descripcion;
    private Date fechaInicio;
    private Date fechaFin;
    private float descuento;
    private Date fechaAlta;
    
    public DtPaqueteDeEspectaculos(){}
    
    public DtPaqueteDeEspectaculos(String nombre, String descripcion, Date fechaInicio, Date fechaFin, float descuento){
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.descuento = descuento;
    }

    public DtPaqueteDeEspectaculos(Long id, String nombre, String descripcion, Date fechaInicio, Date fechaFin, float descuento, Date fechaAlta) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.descuento = descuento;
        this.fechaAlta = fechaAlta;
    }

    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public float getDescuento() {
        return descuento;
    }
    
    public Date getFechaAlta() {
        return fechaAlta;
    }
    
    
}

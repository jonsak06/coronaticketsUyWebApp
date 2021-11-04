/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.datatypes;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author tecnologo
 */
public class DtPaqueteDeEspectaculos {
    private Long id;
    private String nombre;
    private String descripcion;
    private long fechaInicio;
    private long fechaFin;
    private float descuento;
    private long fechaAlta;
    private String imagen;
    private List<String> categorias;
    
    public DtPaqueteDeEspectaculos(){}
    
    public DtPaqueteDeEspectaculos(String nombre, String descripcion, Date fechaInicio, Date fechaFin, float descuento){
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio.getTime();
        this.fechaFin = fechaFin.getTime();
        this.descuento = descuento;
    }

    public DtPaqueteDeEspectaculos(Long id, String nombre, String descripcion, Date fechaInicio, Date fechaFin, float descuento, Date fechaAlta) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio.getTime();
        this.fechaFin = fechaFin.getTime();
        this.descuento = descuento;
        this.fechaAlta = fechaAlta.getTime();
    }
    
    public DtPaqueteDeEspectaculos(Long id, String nombre, String descripcion, Date fechaInicio, Date fechaFin, float descuento, Date fechaAlta, String imagen) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio.getTime();
        this.fechaFin = fechaFin.getTime();
        this.descuento = descuento;
        this.fechaAlta = fechaAlta.getTime();
        this.imagen = imagen;
    }
    
    public DtPaqueteDeEspectaculos(Long id, String nombre, String descripcion, Date fechaInicio, Date fechaFin, float descuento, Date fechaAlta, String imagen, List<String> categorias) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio.getTime();
        this.fechaFin = fechaFin.getTime();
        this.descuento = descuento;
        this.fechaAlta = fechaAlta.getTime();
        this.imagen = imagen;
        this.categorias = categorias;
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
        java.sql.Date finicio = new java.sql.Date(fechaInicio);
        return finicio;
    }

    public Date getFechaFin() {
        java.sql.Date ffin = new java.sql.Date(fechaFin);
        return ffin;
    }

    public float getDescuento() {
        return descuento;
    }
    
    public Date getFechaAlta() {
        java.sql.Date falta = new java.sql.Date(fechaAlta);
        return falta;
    }
    
    public String getImagen() {
        return imagen;
    }
    
    public List<String> getCategorias() {
        return categorias;
    }
    
    
}

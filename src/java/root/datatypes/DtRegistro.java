/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.datatypes;
import java.sql.Date;
import root.entidades.EstadoRegistro;
/**
 *
 * @author tecnologo
 */
public class DtRegistro {
    private Long id;
    private long fecha;
    private float costo;
    private EstadoRegistro estado;
    
    private String nombreFuncion;

    public String getNombreFuncion() {
        return nombreFuncion;
    }

    private java.sql.Date fechaFuncion;

    public Date getFechaFuncion() {
        return fechaFuncion;
    }

    public void setFechaFuncion(Date fechaFuncion) {
        this.fechaFuncion = fechaFuncion;
    }
    public void setNombreFuncion(String nombreFuncion) {
        this.nombreFuncion = nombreFuncion;
    }
    
    public DtRegistro(){}

    public DtRegistro(Long id, Date fecha, float costo, EstadoRegistro estado) {
        this.id = id;
        this.fecha = fecha.getTime();
        this.costo = costo;
        this.estado = estado;
    }

    public Long getId() {
        return id;
    }

    public Date getFecha() {
        java.sql.Date date = new java.sql.Date(fecha);
        return date;
    }

    public float getCosto() {
        return costo;
    }

    public EstadoRegistro getEstado() {
        return estado;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.datatypes;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.List;
/**
 *
 * @author tecnologo
 */


public class DtFuncion {
    private Long id;
    private String nombre;
    private Timestamp horaInicio;
    private Date fechaDeRegistro;
    private Date fecha;
    private String imagen;
    
    public DtFuncion(){}

    public DtFuncion(Long id, String nombre, Timestamp horaInicio, Date fechaDeRegistro, Date fecha) {
        this.id = id;
        this.nombre = nombre;
        this.horaInicio = horaInicio;
        this.fechaDeRegistro = fechaDeRegistro;
        this.fecha = fecha;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getImagen() {
        return imagen;
    }
    
    
    

    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public Timestamp getHoraInicio() {
        return horaInicio;
    }

    public Date getFechaDeRegistro() {
        return fechaDeRegistro;
    }

    public Date getFecha() {
        return fecha;
    }
    
    
}

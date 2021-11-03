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
public class DtSorteo {
    private String nombre;
    private Long id;
    private Long fechaLong;

    public DtSorteo(String nombre, Date fecha, Long id) {
        this.nombre = nombre;
        this.fechaLong = fecha.getTime();
        this.id = id;
    }
    public Date getFechaLong() {
        return new Date(fechaLong);
    }
    
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    

    public String getNombre() {
        return nombre;
    }

    


    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
}

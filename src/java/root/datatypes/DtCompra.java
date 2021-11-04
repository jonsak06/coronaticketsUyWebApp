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
public class DtCompra {
    private Long id;
    private long fecha;

    public DtCompra(){}
    public DtCompra(Long id, Date fecha) {
        this.id = id;
        this.fecha = fecha.getTime();
    }

    public Long getId() {
        return id;
    }

    public Date getFecha() {
        java.sql.Date date = new java.sql.Date(fecha);
        return date;
    }
    
}

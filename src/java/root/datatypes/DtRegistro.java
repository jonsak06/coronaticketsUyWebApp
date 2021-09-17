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
    private Date fecha;
    private float costo;
    private EstadoRegistro estado;
    
    public DtRegistro(){}

    public DtRegistro(Long id, Date fecha, float costo, EstadoRegistro estado) {
        this.id = id;
        this.fecha = fecha;
        this.costo = costo;
        this.estado = estado;
    }

    public Long getId() {
        return id;
    }

    public Date getFecha() {
        return fecha;
    }

    public float getCosto() {
        return costo;
    }

    public EstadoRegistro getEstado() {
        return estado;
    }
    
    
}

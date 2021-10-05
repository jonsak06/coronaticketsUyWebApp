/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.entidades;

import root.datatypes.DtCompra;
import java.io.Serializable;
import javax.persistence.*;
import java.sql.*;

/**
 *
 * @author julio
 */
@Entity
public class Compra implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public Compra(){}
    
    public Compra(PaqueteDeEspectaculos paq, int dia, int mes, int anio){
    
        this.paquete = paq;
        java.sql.Date fecha = new java.sql.Date(anio-1899,mes-12,dia-31);
        this.fecha = fecha;
    }
    
    public Compra (PaqueteDeEspectaculos paq , Date fecha, Espectador esp){
    this.espectador=esp;
    this.fecha = fecha;
    this.paquete = paq;
    }
    
    @Column(name = "FECHA_COMPRA")
    private Date fecha;
    public Date getFecha() {
        return fecha;
    }
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
//    @ManyToOne
//    @JoinColumn(name = "ESPECTACULO_ID")
//    private Espectaculo espectaculo;
//    public Espectaculo getEspectaculo() {
//        return espectaculo;
//    }
//    public void setEspectaculo(Espectaculo espectaculo) {
//        this.espectaculo = espectaculo;
//    }
    
    @ManyToOne 
    private PaqueteDeEspectaculos paquete;
    public PaqueteDeEspectaculos getPaquete() {
        return paquete;
    }
    public void setPaquete(PaqueteDeEspectaculos p) {
        this.paquete = p;
    }
    
    @ManyToOne
    private Espectador espectador;

    public Espectador getEspectador() {
        return espectador;
    }

    public void setEspectador(Espectador espectador) {
        this.espectador = espectador;
    }
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Compra)) {
            return false;
        }
        Compra other = (Compra) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "presentacion.Compra[ id=" + id + " ]";
    }
    
    public DtCompra getMyDt()
    {
        DtCompra dt = new DtCompra(this.id, this.fecha);
        return dt;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.entidades;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import root.datatypes.DtFuncion;
import root.datatypes.DtPremio;

/**
 *
 * @author tecnologo
 */
@Entity
public class Premio implements Serializable {

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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Premio)) {
            return false;
        }
        Premio other = (Premio) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "root.entidades.Premio[ id=" + id + " ]";
    }
    
    @Column(name = "NOMBRE")
    private String nombre;
    
    
    @Column(name = "DESCRIPCION")
    private String descripcion;

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    @ManyToOne
    private Sorteo sorteo;
    public Sorteo getSorteo() {
        return sorteo;
    }
    public void setSorteo(Sorteo sorteo) {
        this.sorteo = sorteo;
    }
    
    @ManyToOne
    private Espectador espectador;
    public Espectador getEspectador() {
        return espectador;
    }
    public void setEspectador(Espectador espectador) {
        this.espectador = espectador;
    }
    
    public DtPremio getMyDt()
    {
        DtPremio dt = new DtPremio(this.id, this.nombre, this.descripcion);
        return dt;
    }
}

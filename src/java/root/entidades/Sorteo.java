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
import root.datatypes.DtSorteo;

/**
 *
 * @author tecnologo
 */
@Entity
public class Sorteo implements Serializable {

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
        if (!(object instanceof Sorteo)) {
            return false;
        }
        Sorteo other = (Sorteo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "root.entidades.Sorteo[ id=" + id + " ]";
    }

    @Column(name = "NOMBRE")
    String nombre;

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }
    @Column(name = "FECHA")
    Date fecha;

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getFecha() {
        return fecha;
    }
    
    @ManyToOne
    private Artista artista;
    public Artista getArtista() {
        return artista;
    }
    public void setArtista(Artista artista) {
        this.artista = artista;
    }
    
    @ManyToMany//(mappedBy = "espectaculos")
    private List<Espectador> espectadores;
    public List<Espectador> getEspectadores(){
        return this.espectadores;
    }
    public void addEspectador(Espectador e){
        this.espectadores.add(e);
    }

    public void setEspectadores(List<Espectador> espectadores) {
        this.espectadores = espectadores;
    }
    
    @OneToOne
    private Funcion funcion;

    public Funcion getFuncion() {
        return funcion;
    }

    public void setFuncion(Funcion funcion) {
        this.funcion = funcion;
    }

    
    
    @OneToMany(mappedBy = "sorteo")
    private List<Premio> premios;

    public List<Premio> getPremios() {
        return premios;
    }

    public void addPremio(Premio p){
        int i = this.premios.size();
        this.premios.add(i+1,p);
    }

    public Sorteo() {
    }

    public Sorteo(String nombre, Date fecha, Artista artista, List<Espectador> espectadores, Funcion funcion) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.artista = artista;
        this.espectadores = espectadores;
        this.funcion = funcion;
    }
    
    public DtSorteo getMyDt()
    {
        DtSorteo dt = new DtSorteo(this.nombre, this.fecha, this.id);
        return dt;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.entidades;

import root.datatypes.DtFuncion;
import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author julio
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Funcion.findAll", query = "SELECT f FROM Funcion f"),
    @NamedQuery(name = "Funcion.findByNombre", query = "SELECT f FROM Funcion f WHERE f.nombre = :nombre")})
public class Funcion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    
    @Column
    private String imagen;

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
        
    public Funcion(){
        this.artistasInvitados = new ArrayList<Artista>();
    }
    
      
    public Funcion(String nombre, int dinicio, int minicio, int yinicio, int hinicio, int mininicio, int dreg, int mreg, int yreg, Espectaculo e, List<Artista> artistasInvitados){
        
        this.setNombre(nombre);
        this.setEspectaculo(e);
        java.sql.Timestamp fhinicio = new java.sql.Timestamp(yinicio-1899,minicio-12,dinicio-31,hinicio,mininicio,0,0);
        this.setHoraInicio(fhinicio);
        java.sql.Date f = new java.sql.Date(yinicio-1899,minicio-12,dinicio-31);
        this.setFecha(f);
        java.sql.Date freg = new java.sql.Date(yreg-1899,mreg-12,dreg-31);
        this.setFechaRegistro(freg);
        this.artistasInvitados = artistasInvitados;
            
    }

    public Funcion(List<Artista> artistasInvitados, String nombre, Timestamp horaInicio, Date fechaDeRegistro, Date fecha, Espectaculo espectaculo) {
        this.artistasInvitados = artistasInvitados;
        this.nombre = nombre;
        this.horaInicio = horaInicio;
        this.fechaDeRegistro = fechaDeRegistro;
        this.fecha = fecha;
//        this.espectaculo = espectaculo;
        this.setEspectaculo(espectaculo);

    }
    
    
    
    public boolean estaCompleta(){
        int maximo = this.espectaculo.getCantMaxEspectadores();
        int cantidadDeRegistro = 0;
        for(Registro i :this.registros){
            if(i.getEstado() == EstadoRegistro.PENDIENTE){
                cantidadDeRegistro++;
            }
        }
        if(cantidadDeRegistro == maximo){
            return true;
        }else{
            return false;
        }
    }
    
    @ManyToMany
    private List<Artista> artistasInvitados;
    public List<Artista> getInvitados(){
        return this.artistasInvitados;
    }
    
    public void addInvitado(Artista a){
        int i = this.artistasInvitados.size();
        this.artistasInvitados.add(a);
    }
    @Column(name = "NOMBRE_FUNC")
    private String nombre;
    public String getNombre(){
        return this.nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;           
    }
    
    @Column(name = "HORA_INICIO")
//    @Temporal(TemporalType.TIMESTAMP)
    private Timestamp horaInicio;
    public Timestamp getHoraInicio(){
        return this.horaInicio;
    }
    public void setHoraInicio(Timestamp h){
        this.horaInicio = h;
    }

    @Column(name="FECHA_REG")
//    @Temporal(TemporalType.DATE)
    private Date fechaDeRegistro;
    public Date getFechaRegistro(){
        return this.fechaDeRegistro;
    }
    public void setFechaRegistro(Date f){
        this.fechaDeRegistro = f;
    }
    
//    @Temporal(TemporalType.DATE)
    @Column(name="FECHA")
    private Date fecha;
    public Date getFecha(){
        return this.fecha;
    }
    public void setFecha(Date f){
        this.fecha = f;
    }
    
//    @Column(name = "ESPECTACULO")
    @ManyToOne
    private Espectaculo espectaculo;
    public Espectaculo getEspectaculo(){
        return this.espectaculo;
    }
    public void setEspectaculo(Espectaculo e){
        this.espectaculo = e;
    }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }
    
    @OneToMany(mappedBy = "funcion")
    private List<Registro> registros;
    public List<Registro> getRegistros(){
        return this.registros;
    }
    public void addRegistro(Registro r){
        int i = this.registros.size();
        this.registros.add(i+1,r);
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Funcion)) {
            return false;
        }
        Funcion other = (Funcion) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "presentacion.Funcion[ id=" + id + " ]";
    }
    
     @OneToOne(mappedBy = "funcion")
    private Sorteo sorteo;

    public Sorteo getSorteo() {
        return sorteo;
    }

    public void setSorteo(Sorteo sorteo) {
        this.sorteo = sorteo;
    }
    
    public DtFuncion getMyDt()
    {
        DtFuncion dt = new DtFuncion(this.id, this.nombre, this.horaInicio, this.fechaDeRegistro, this.fecha);
        dt.setImagen(this.imagen);
        return dt;
    }
}

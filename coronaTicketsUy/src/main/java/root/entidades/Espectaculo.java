/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.entidades;

import root.datatypes.DtEspectaculo;
import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author julio
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Espectaculo.findAll", query = "SELECT e FROM Espectaculo e"),
    @NamedQuery(name = "Espectaculo.findByNombre", query = "SELECT e FROM Espectaculo e WHERE e.nombre = :nombre"),
    @NamedQuery(name = "Espectaculo.listarPorEstado", query = "SELECT e FROM Espectaculo e WHERE e.estado = :estado")})
public class Espectaculo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    public Espectaculo(){}
    
    public Espectaculo(String nombre, String descripcion, int duracion, int minEsp, int maxEsp, String url, float costo, int da, int ma, int ya, Artista a, Plataforma p){
        this.setArtista(a);
        this.setCantMaxEspectadores(maxEsp);
        this.setCantMinEspectadores(minEsp);
        this.setCosto(costo);
        this.setDescrp(descripcion);
        this.setDuracion(duracion);
        java.sql.Date falta = new java.sql.Date(ya-1899,ma-12,da-31);
        this.setFechaRegistro(falta);
        this.setNombre(nombre);
        this.setPlataforma(p);
        this.setURL(url);
        this.estado = EstadoEspectaculo.ACEPTADO;
        this.categoria = new ArrayList<Categoria>();

    }

    public Espectaculo(String nombre, String descripcion, int duracion, int cantidadMaximaEspectadores, int cantidadMinimaEspectadores, String url, float costo, Date fechaDeRegistro, Plataforma plataforma, Artista artista) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.duracion = duracion;
        this.cantidadMaximaEspectadores = cantidadMaximaEspectadores;
        this.cantidadMinimaEspectadores = cantidadMinimaEspectadores;
        this.url = url;
        this.costo = costo;
        this.fechaDeRegistro = fechaDeRegistro;
        this.plataforma = plataforma;
        this.artista = artista;
        this.estado = EstadoEspectaculo.ACEPTADO;
        this.categoria = new ArrayList<Categoria>();

    }
    
    
    @Column(name = "NOMBRE_ESP")
    private String nombre;
    public String getNombre(){
        return this.nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;           
    }
    
    @Column(name = "ESTADO_ESPECTACULO")
    @Enumerated(value = EnumType.STRING)
    private EstadoEspectaculo estado;

    public EstadoEspectaculo getEstado() {
        return estado;
    }

    public void setEstado(EstadoEspectaculo estado) {
        this.estado = estado;
    }

   @Column
   private String imagen;

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
   
    
    @Lob
    @Column(name = "DESCR_ESP")
    private String descripcion;
    public String getDescrp(){
        return this.descripcion;
    }
    public void setDescrp(String desc){
        this.descripcion = desc;
    }
    
    @Column(name = "DURACION")
    private int duracion;
    public int getDuracion(){
        return this.duracion;
    }
    public void setDuracion(int dur){
        this.duracion = dur;
    }
    
    @Column(name = "MAX_ESPECT")
    private int cantidadMaximaEspectadores;
    public int getCantMaxEspectadores(){
        return this.cantidadMaximaEspectadores;
    }
    public void setCantMaxEspectadores(int cme){
        this.cantidadMaximaEspectadores = cme;
    }
   
    @Column(name = "MIN_ESPECT")
    private int cantidadMinimaEspectadores;
    public int getCantMinEspectadores(){
        return this.cantidadMinimaEspectadores;
    }
    public void setCantMinEspectadores(int cme){
        this.cantidadMinimaEspectadores = cme;
    }
    
    @Column(name = "URL")
    private String url;
    public String getURL(){
        return this.url;
    }
    public void setURL(String url){
        this.url = url;
    }
    
    @Column(name = "COSTO")
    private float costo;
    public float getCosto(){
        return this.costo;
    }
    public void setCosto(float c){
        this.costo = c;
    }
    
    @Column(name="FECHA_REG")
    private java.sql.Date fechaDeRegistro;
    public java.sql.Date getFechaRegistro(){
        return this.fechaDeRegistro;
    }
    public void setFechaRegistro(java.sql.Date f){
        this.fechaDeRegistro = f;
    }
    
    @ManyToMany
    private List<Categoria> categoria;

    public List<Categoria> getCategoria() {
        return categoria;
    }

    public void setCategoria(List<Categoria> categoria) {
        this.categoria = categoria;
    }
    
//    @Column(name = "PLATAFORMA")
    @ManyToOne
    private Plataforma plataforma;
    public Plataforma getPlataforma(){
    return this.plataforma;
    }
    public void setPlataforma(Plataforma p){
        this.plataforma = p;
    }
    
    @OneToMany(mappedBy = "espectaculo")
    private List<Funcion> funciones;
    public List<Funcion> getFunciones(){
        return this.funciones;
    }
    public void addFuncion(Funcion f){
    int i = this.funciones.size();
    this.funciones.add(i+1, f);
    }
    
    @ManyToMany//(mappedBy = "espectaculos")
    private List<PaqueteDeEspectaculos> paquetes;
    public List<PaqueteDeEspectaculos> getPaquetes(){
        return this.paquetes;
    }
    public void addPaquete(PaqueteDeEspectaculos p){
        this.paquetes.add(p);
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @ManyToOne
    private Artista artista;
    public Artista getArtista() {
        return artista;
    }
    public void setArtista(Artista artista) {
        this.artista = artista;
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
        if (!(object instanceof Espectaculo)) {
            return false;
        }
        Espectaculo other = (Espectaculo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "presentacion.Espectaculo[ id=" + id + " ]";
    }
    
    public DtEspectaculo getMyDt()
    {
        DtEspectaculo dt = new DtEspectaculo(this.id, this.nombre, this.descripcion, this.duracion, this.cantidadMaximaEspectadores, this.cantidadMinimaEspectadores, this.url, this.costo, this.fechaDeRegistro);
        String nombreArt = this.artista.getNombre()+" "+this.artista.getApellido();
        dt.setNombreArtista(nombreArt);
        dt.setPlataforma(this.plataforma.getNombre());
        return dt;
    }

   
    
}

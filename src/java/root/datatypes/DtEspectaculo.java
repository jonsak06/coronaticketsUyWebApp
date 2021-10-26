/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.datatypes;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;
/**
 *
 * @author tecnologo
 */

public class DtEspectaculo {
    private Long id;
    private String nombre;
    private String descripcion;
    private int duracion;
    private int cantidadMaximaEspectadores;
    private int cantidadMinimaEspectadores;
    private String url;
    private float costo;
    private Date fechaDeRegistro;
    private String imagen;
    private String plataforma;
    private List<String> categorias;
    private String estado;
    private float valoracionPromedio;
    private String video;
    private String descripcionDelPremio;
    private int numeroDePremios;

    public String getDescripcionDelPremio() {
        return descripcionDelPremio;
    }

    public void setDescripcionDelPremio(String descripcionDelPremio) {
        this.descripcionDelPremio = descripcionDelPremio;
    }

    public int getNumeroDePremios() {
        return numeroDePremios;
    }

    public void setNumeroDePremios(int numeroDePremios) {
        this.numeroDePremios = numeroDePremios;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public float getValoracionPromedio() {
        return valoracionPromedio;
    }

    public void setValoracionPromedio(float valoracionPromedio) {
        this.valoracionPromedio = valoracionPromedio;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public DtEspectaculo(Long id, String nombre, String descripcion, int duracion, int cantidadMaximaEspectadores, int cantidadMinimaEspectadores, String url, float costo, Date fechaDeRegistro, String imagen, String plataforma, List<String> categorias, String estado, float valoracionPromedio, String video, String nombreArtista) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.duracion = duracion;
        this.cantidadMaximaEspectadores = cantidadMaximaEspectadores;
        this.cantidadMinimaEspectadores = cantidadMinimaEspectadores;
        this.url = url;
        this.costo = costo;
        this.fechaDeRegistro = fechaDeRegistro;
        this.imagen = imagen;
        this.plataforma = plataforma;
        this.categorias = categorias;
        this.estado = estado;
        this.valoracionPromedio = valoracionPromedio;
        this.video = video;
        this.nombreArtista = nombreArtista;
    }
    

    public DtEspectaculo(){}
    public DtEspectaculo(Long id, String nombre, String descripcion, int duracion, int cantidadMaximaEspectadores, int cantidadMinimaEspectadores, String url, float costo, Date fechaDeRegistro) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.duracion = duracion;
        this.cantidadMaximaEspectadores = cantidadMaximaEspectadores;
        this.cantidadMinimaEspectadores = cantidadMinimaEspectadores;
        this.url = url;
        this.costo = costo;
        this.fechaDeRegistro = fechaDeRegistro;
    }

    public DtEspectaculo(Long id, String nombre, String descripcion, int duracion, int cantidadMaximaEspectadores, int cantidadMinimaEspectadores, String url, float costo, Date fechaDeRegistro, String imagen) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.duracion = duracion;
        this.cantidadMaximaEspectadores = cantidadMaximaEspectadores;
        this.cantidadMinimaEspectadores = cantidadMinimaEspectadores;
        this.url = url;
        this.costo = costo;
        this.fechaDeRegistro = fechaDeRegistro;
        this.imagen = imagen;
    }

    
    
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }
    
    public void setCategorias(List<String> categorias) {
        this.categorias = categorias;
    }

    public DtEspectaculo(Long id, String nombre, String descripcion, int duracion, int cantidadMaximaEspectadores, int cantidadMinimaEspectadores, String url, float costo, Date fechaDeRegistro, String imagen, String nombreArtista) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.duracion = duracion;
        this.cantidadMaximaEspectadores = cantidadMaximaEspectadores;
        this.cantidadMinimaEspectadores = cantidadMinimaEspectadores;
        this.url = url;
        this.costo = costo;
        this.fechaDeRegistro = fechaDeRegistro;
        this.imagen = imagen;
        this.nombreArtista = nombreArtista;
    }

    

    public String getImagen() {
        return imagen;
    }
    
    private String nombreArtista;

    public String getNombreArtista() {
        return nombreArtista;
    }

    public void setNombreArtista(String nombreArtista) {
        this.nombreArtista = nombreArtista;
    }
    

    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getDuracion() {
        return duracion;
    }

    public int getCantidadMaximaEspectadores() {
        return cantidadMaximaEspectadores;
    }

    public int getCantidadMinimaEspectadores() {
        return cantidadMinimaEspectadores;
    }

    public String getUrl() {
        return url;
    }

    public float getCosto() {
        return costo;
    }

    public Date getFechaDeRegistro() {
        return fechaDeRegistro;
    }
    
    public String getPlataforma() {
        return plataforma;
    }
    
    public List<String> getCategorias() {
        return categorias;
    }
    
}

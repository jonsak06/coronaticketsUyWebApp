/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.datatypes;

/**
 *
 * @author tecnologo
 */
public class DtPlataforma {
    private Long id;
    private String url;
    private String nombre;
    private String descripcion;
    
    public DtPlataforma(){}

    public DtPlataforma(Long id, String url, String nombre, String descripcion) {
       this.setDescripcion(descripcion);
       this.setId(id);
       this.setNombre(nombre);
       this.setUrl(url);
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Long getId() {
        return id;
    }

    public String getUrl() {
        return url;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }
    
    
    
}

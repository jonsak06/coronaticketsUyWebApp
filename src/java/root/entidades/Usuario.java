/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.*;
import java.util.List;

/**
 *
 * @author tecnologo
 */
@Entity
@Inheritance(strategy=InheritanceType.JOINED)

public abstract class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column
    private String passwd;
    
    @ManyToMany(mappedBy = "siguiendo")
    private List<Usuario> seguidores;

    public void setSeguidores(List<Usuario> seguidores) {
        this.seguidores = seguidores;
    }

    public void setSiguiendo(List<Usuario> siguiendo) {
        this.siguiendo = siguiendo;
    }
    

    public List<Usuario> getSeguidores() {
        return seguidores;
    }

    public List<Usuario> getSiguiendo() {
        return siguiendo;
    }
    
    
    @ManyToMany
    private List<Usuario> siguiendo;
    
    
    public void setPasswd(String passwd){
        this.passwd=passwd;
    }
    public String getPasswd(){
        return this.passwd;
    }
    @Column(name = "NOMBRE")
    private String nombre;
    
    @Column(name = "APELLIDO")
    private String apellido;
    
    @Column(name = "CORREO")
    private String correo;
    
    @Column(name = "NICKNAME")
    private String nickname;
    
    @Column(name = "IMAGEN")
    private String imagen;
    
    @Column(name = "FECHANACIMIENTO")
//    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;
    public Usuario(){}
    public Usuario(String nombre, String apellido, String correo, String nickname, String imagen, Date fechaNacimiento) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.nickname = nickname;
        this.imagen = imagen;
        this.fechaNacimiento = fechaNacimiento;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public String getNickname() {
        return nickname;
    }

    public String getImagen() {
        return imagen;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }
    
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
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "presentacion.Usuario[ id=" + id + " ]";
    }
    
}

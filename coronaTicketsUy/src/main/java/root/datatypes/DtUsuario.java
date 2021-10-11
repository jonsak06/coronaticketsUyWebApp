/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.datatypes;
import java.io.Serializable;
import java.sql.*;
/**
 *
 * @author tecnologo
 */
public abstract class DtUsuario 
{
    
    private Long id;
    private String nombre;
    private String apellido;
    private String correo;
    private String nickname;
    private String imagen;
    private Date fechaNacimiento;
    private String pass;

    public DtUsuario(){}
    public DtUsuario(Long id, String nombre, String apellido, String correo, String nickname, String imagen, Date fechaNacimiento, String pass) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.nickname = nickname;
        this.imagen = imagen;
        this.fechaNacimiento = fechaNacimiento;
        this.pass = pass;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Long getId() {
        return id;
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

    public DtUsuario getMyDt()
    {
        DtUsuario dt=null;
        
        return dt; 
    }
}

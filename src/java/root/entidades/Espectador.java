/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.entidades;

import root.datatypes.DtEspectador;
import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author julio
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Espectador.findAll", query = "SELECT e FROM Espectador e"),
    @NamedQuery(name = "EspectadorporNick", query = "SELECT e FROM Espectador e WHERE e.nickname = :nickname"),
    @NamedQuery(name = "EspectadorporCorreo", query = "SELECT e FROM Espectador e WHERE e.correo = :correo"   )})
public class Espectador extends Usuario {

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
    
    @Column(name = "CANT_CANJEABLES")
    private int canjeables;
    
//    public void actualizarRegistros(){
//        java.sql.Date f= new java.sql.Date(Calendar.getInstance().getTime().getTime());
//        for(Registro i :this.registros){
//            if(i.getFuncion().getFecha().before(f)){
//                i.setEstado(EstadoRegistro.USADO);
//                
//            }
//        }
//    }

    public void calcularCanjeables(){
        canjeables = 0;
//        this.actualizarRegistros();
        for (Registro i :this.registros){
            if(i.getEstado()!=EstadoRegistro.USADO && i.getCosto()!=0){
            canjeables = canjeables + 1;
            }
        }
    }
    public int getCanjeables() {
        return canjeables;
    }

    public Espectador() {
        this.compras = new ArrayList<Compra>();
        
    }

    public Espectador(String nick, String nombre, String apellido, String email, int dnac, int mnac, int ynac){
        this.setApellido(apellido);
        this.setCorreo(email);
        java.sql.Date fnac = new java.sql.Date(ynac-1899,mnac-12,dnac-31);
        this.setFechaNacimiento(fnac);
        this.setNickname(nick);
        this.setNombre(nombre);
        this.setImagen("PATH");
        this.compras = new ArrayList<Compra>();


        
    }
    
    
    
    @OneToMany(mappedBy = "espectador")
    private List<Registro> registros;
    public List<Registro> getRegistros() {
        return registros;
    }
    public void addRegistro(Registro r){
        int i = this.registros.size();
        this.registros.add(i+1,r);
    }
    
    
    @OneToMany(mappedBy = "espectador")
    private List<Compra> compras;
    public List<Compra> getCompras() {
        return compras;
    }

    public Espectador(String nombre, String apellido, String correo, String nickname, String imagen, Date fechaNacimiento, String pass) {
        super(nombre, apellido, correo, nickname, imagen, fechaNacimiento);
        this.canjeables=0;
        this.setPasswd(pass);
    }

    public void addCompra(Compra c) {
        this.compras.add(c);
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
        if (!(object instanceof Espectador)) {
            return false;
        }
        Espectador other = (Espectador) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "presentacion.Espectador[ id=" + id + " ]";
    }
    
    public DtEspectador getMyDt()
    {
        this.calcularCanjeables();
        
    
        DtEspectador dt = new DtEspectador(this.getCanjeables(), this.id, this.getNombre(), this.getApellido(), this.getCorreo(), this.getNickname(), this.getImagen(), this.getFechaNacimiento(),this.getPasswd());
        return dt; 
    }
    
    @OneToMany(mappedBy = "espectador")
    private List<Premio> premios;

    public List<Premio> getPremios() {
        return premios;
    }

    public void addPremio(Premio p){
        int i = this.premios.size();
        this.premios.add(i+1,p);
    }
    
    @OneToMany(mappedBy = "espectador")
    private List<Valoracion> valoraciones;

    public List<Valoracion> getValoraciones() {
        return valoraciones;
    }

    public void addValoracion(Valoracion v){
        int i = this.valoraciones.size();
        this.valoraciones.add(i+1,v);
    }
    
    @ManyToMany//(mappedBy = "espectaculos")
    private List<Sorteo> sorteos;
    public List<Sorteo> getSorteos(){
        return this.sorteos;
    }
    public void addSorteo(Sorteo s){
        this.sorteos.add(s);
    }
    
    @ManyToMany//(mappedBy = "espectaculos")
    private List<Espectaculo> faboritos;
    public List<Espectaculo> getFaboritos(){
        return this.faboritos;
    }
    public void addFaborito(Espectaculo s){
        this.faboritos.add(s);
    }
    
    public void setFaboritos(List<Espectaculo> faboritos) {
        this.faboritos = faboritos;
    }
    
}

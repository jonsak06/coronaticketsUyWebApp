/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package root.entidades;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import root.datatypes.DtRegistroAcceso;

/**
 *
 * @author julio
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "RegistroAcceso.findAll", query = "SELECT r FROM RegistroAcceso r")
})
public class RegistroAcceso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int counter;
    private String ipCliente;
    private String navCliente;
    private String urlSitio;
    private long moment;

    public RegistroAcceso(){}
    
    public RegistroAcceso(DtRegistroAcceso r){
    
        this.counter = r.getCounter();
        this.ipCliente = r.getIpCliente();
        this.navCliente = r.getNavCliente();
        this.urlSitio = r.getUrlSitio();
        this.moment = r.getMoment();
    
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getCounter() {
        return counter;
    }

    public void setCounter(int counter) {
        this.counter = counter;
    }

    public String getIpCliente() {
        return ipCliente;
    }

    public void setIpCliente(String ipCliente) {
        this.ipCliente = ipCliente;
    }

    public String getNavCliente() {
        return navCliente;
    }

    public void setNavCliente(String navCliente) {
        this.navCliente = navCliente;
    }

    public String getUrlSitio() {
        return urlSitio;
    }

    public void setUrlSitio(String urlSitio) {
        this.urlSitio = urlSitio;
    }

    public long getMoment() {
        return moment;
    }

    public void setMoment(long moment) {
        this.moment = moment;
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
        if (!(object instanceof RegistroAcceso)) {
            return false;
        }
        RegistroAcceso other = (RegistroAcceso) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "root.entidades.RegistroAcceso[ id=" + id + " ]";
    }
    
}

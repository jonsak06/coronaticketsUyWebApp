/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package root.datatypes;

/**
 *
 * @author julio
 */
public class DtRegistroAcceso {
    private int counter;
    private String ipCliente;
    private String navCliente;
    private String urlSitio;
    private long moment;
    
    public DtRegistroAcceso(){}
    public DtRegistroAcceso(int counter, String ipCliente, String navCliente, String urlSitio, long moment){
    this.counter=counter;
    this.ipCliente = ipCliente;
    this.navCliente = navCliente;
    this.urlSitio = urlSitio;
    this.moment = moment;
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
    
    
}

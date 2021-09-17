/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.controladores;

import java.sql.Date;
import java.util.List;
import javax.persistence.*;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtPaqueteDeEspectaculos;
import root.entidades.Espectaculo;
import root.manejadores.ManEspectaculo;
import root.manejadores.ManPlataformas;
import root.manejadores.ManejadorPaquetes;
import root.entidades.PaqueteDeEspectaculos;
import root.interfaces.iPaquetes;

/**
 *
 * @author dexion
 */
public class CtrlPaquetes implements iPaquetes {
    private static final CtrlPaquetes instance = new CtrlPaquetes();
    private CtrlPaquetes(){this.mp = ManejadorPaquetes.getInstance();
};
    public static CtrlPaquetes getInstance() {
        return instance;
    }
    
    private final ManejadorPaquetes mp;
    
    @Override
    public boolean confirmarAltaPaquete(String nombre, String descripcion, Date fechaInicio, Date fechaFin, float descuento){
        DtPaqueteDeEspectaculos dvPaquete = new DtPaqueteDeEspectaculos(nombre, descripcion, fechaInicio, fechaFin, descuento);
        return mp.crearPaquete(dvPaquete);
    }
    
    @Override
    public List<String> listarPaquetes() {
        return mp.getNombres();
    }
    
    @Override
    public List<String> listarPlataformas() {
        return ManPlataformas.getNombres();
    }
    
    @Override
    public List<String> listarEspectaculosNoIncluidos(String nombrePaquete, String nombrePlataforma) {
        List<String> nomEsps = ManEspectaculo.getNombres(nombrePlataforma);
        PaqueteDeEspectaculos p = mp.getPaquete(nombrePaquete);
        return p.filtrarEspectaculosNoIncluidos(nomEsps, nombrePlataforma);
    }
    
    @Override
    public void confirmarAgregadoEspectaculo(String nombreEspectaculo, String nombrePaquete) {
        //falta corregir persistencia
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectaculo> consultaEsp = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class);
        consultaEsp.setParameter("nombre", nombreEspectaculo);
        Espectaculo e = consultaEsp.getSingleResult();
        TypedQuery<PaqueteDeEspectaculos> consulta = em.createNamedQuery("PaqueteByName",PaqueteDeEspectaculos.class);
        consulta.setParameter("nombre", nombrePaquete);
        PaqueteDeEspectaculos paq = consulta.getSingleResult();
        paq.addEspectaculo(e);
        e.addPaquete(paq);
        em.persist(paq);
        em.persist(e);
        em.getTransaction().commit();
        em.close();
        emf.close();
        
    }
    
    @Override
    public DtPaqueteDeEspectaculos mostrarInfoPaquete(String nombrePaquete) {
        PaqueteDeEspectaculos p = mp.getPaquete(nombrePaquete);
        return p.getMyDt();
    }
    
    @Override
    public List<String> listarEspectaculosIncluidos(String nombrePaquete) {
        PaqueteDeEspectaculos p = mp.getPaquete(nombrePaquete);
        return p.getNombresEspectaculos();
    }
    
    @Override
    public DtEspectaculo mostarInfoEspectaculo(String nombreEspectaculo) {
        Espectaculo e = ManEspectaculo.getEspectaculo(nombreEspectaculo);
        return e.getMyDt();
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serviciosWeb;
import static java.time.Instant.now;
import root.datatypes.DtPaqueteDeEspectaculos;
import java.util.*;
import javax.persistence.*;
import root.entidades.PaqueteDeEspectaculos;
/**
 *
 * @author dexion
 */
public class ManejadorPaquetes {
    private static final ManejadorPaquetes instance = new ManejadorPaquetes();
    private ManejadorPaquetes(){};
    public static ManejadorPaquetes getInstance() {
        return instance;
    }
    
    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
    
    public boolean existePaquete(String nombrePaquete) {
        EntityManager em = emf.createEntityManager();
        List<PaqueteDeEspectaculos> paq = em.createNamedQuery("PaqueteByName", PaqueteDeEspectaculos.class)
                .setParameter("nombre", nombrePaquete).getResultList();
        
        em.close();
        return paq.size()>0;
    }
    
    public boolean crearPaquete(DtPaqueteDeEspectaculos dvPaquete){
        if(existePaquete(dvPaquete.getNombre())) {
            return false;
        }
        PaqueteDeEspectaculos p = new PaqueteDeEspectaculos(dvPaquete);
        p.setFechaAlta(new java.sql.Date(System.currentTimeMillis()));
        EntityManager em = emf.createEntityManager();
        EntityTransaction txn = em.getTransaction();
        txn.begin();
        em.persist(p);
        txn.commit();
        em.close();
        return true;
    }
    
    public List<String> getNombres() {
       EntityManager em = emf.createEntityManager();
       List<PaqueteDeEspectaculos> paqs = em.createNamedQuery("PaqueteDeEspectaculos.findAll", PaqueteDeEspectaculos.class)
               .getResultList();
       em.close();
       ArrayList<String> nombres = new ArrayList();
       for(PaqueteDeEspectaculos p: paqs){
//       paqs.forEach(p -> {
           nombres.add(p.getNombre());
//       });
       }
       return nombres;
    }
    
        public List<String> getNombresVigentes() {
       EntityManager em = emf.createEntityManager();
       List<PaqueteDeEspectaculos> paqs = em.createNamedQuery("PaqueteDeEspectaculos.findAll", PaqueteDeEspectaculos.class)
               .getResultList();
       em.close();
       ArrayList<String> nombres = new ArrayList();
       for(PaqueteDeEspectaculos p: paqs){
           Date date = new Date();
           if(p.getFechaFin().after(date)){
           nombres.add(p.getNombre());
           }
       }
       return nombres;
    }
    
    public PaqueteDeEspectaculos getPaquete(String nombrePaquete) {
        EntityManager em = emf.createEntityManager();
        PaqueteDeEspectaculos paq = em.createNamedQuery("PaqueteByName", PaqueteDeEspectaculos.class)
                .setParameter("nombre", nombrePaquete).getSingleResult();
        em.close();
        return paq;
    }
    
    public List<DtPaqueteDeEspectaculos> getDtPaquetes() {
        List<DtPaqueteDeEspectaculos> lista = new ArrayList();
        EntityManager em = emf.createEntityManager();
        List<PaqueteDeEspectaculos> paqs = em.createNamedQuery("PaqueteDeEspectaculos.findAll", PaqueteDeEspectaculos.class)
               .getResultList();
        em.close();
        for(PaqueteDeEspectaculos p : paqs) {
            lista.add(p.getMyDt());
        }
        return lista;
    }
}

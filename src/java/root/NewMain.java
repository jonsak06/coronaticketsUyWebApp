/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root;

import root.manejadores.ManejadorUsuarios;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author julio
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ManejadorUsuarios.actualizarRegistros();
//        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
//        EntityManager em = emf.createEntityManager();
//        java.sql.Date f= new java.sql.Date(Calendar.getInstance().getTime().getTime());
//        em.getTransaction().begin();
//        List<Espectador> lista = new ArrayList<Espectador>();
//        TypedQuery<Espectador> consulta = em.createNamedQuery("Espectador.findAll",Espectador.class);
//        lista = consulta.getResultList();
//        for(Espectador i :lista){
//            List<Registro> registros = i.getRegistros();
//            for(Registro j :registros){
//                if(j.getFuncion().getFecha().before(f)){
//                    j.setEstado(EstadoRegistro.USADO);
//                }
//            }
//            em.persist(i);
//        }
//        em.getTransaction().commit();
//        em.close();
//        emf.close();
          
    }
    
}
 
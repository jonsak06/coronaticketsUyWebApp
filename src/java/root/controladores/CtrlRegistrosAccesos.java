/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package root.controladores;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import root.datatypes.DtRegistroAcceso;
import root.entidades.RegistroAcceso;
import root.interfaces.iRegistrosAcceso;

/**
 *
 * @author julio
 */
public class CtrlRegistrosAccesos  implements iRegistrosAcceso {
    public CtrlRegistrosAccesos(){}
    public void ingresarRegistro(DtRegistroAcceso r) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        List<RegistroAcceso> registros = em.createNamedQuery("RegistroAcceso.findAll",RegistroAcceso.class).getResultList();
        if(registros.size()!=0){
            long mom = new java.util.Date().getTime();
            if(registros.size()==10000 /*|| (mom- registros.get(0).getMoment())>=30*24*60*60*1000*/){
            em.getTransaction().begin();
            for(RegistroAcceso reg: registros){
            em.remove(reg);
            }
            em.getTransaction().commit();
                em.getTransaction().begin();
                RegistroAcceso nuevoRegistro = new RegistroAcceso(r);
                nuevoRegistro.setCounter(1);
                em.persist(nuevoRegistro);
                em.getTransaction().commit();
            }else{
                em.getTransaction().begin();
                RegistroAcceso nuevoRegistro = new RegistroAcceso(r);
                nuevoRegistro.setCounter(registros.size()+1);
                em.persist(nuevoRegistro);
                em.getTransaction().commit();
            }
        }else{
                em.getTransaction().begin();
                RegistroAcceso nuevoRegistro = new RegistroAcceso(r);
                nuevoRegistro.setCounter(1);
                em.persist(nuevoRegistro);
                em.getTransaction().commit();
        }
        em.close();
        emf.close();
    }
    
    public List<DtRegistroAcceso> getRegistrosAcceso(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        List<RegistroAcceso> result = em.createNamedQuery("RegistroAcceso.findAll",RegistroAcceso.class).getResultList();
        List<DtRegistroAcceso> resultado = new ArrayList<DtRegistroAcceso>();
        for(RegistroAcceso r: result){
            DtRegistroAcceso reg = new DtRegistroAcceso(r.getCounter(),r.getIpCliente(),r.getNavCliente(),r.getUrlSitio(), r.getMoment());
            resultado.add(reg);
        }
        em.close();
        emf.close();
        return resultado;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package root.manejadores;

import root.datatypes.DtPaqueteDeEspectaculos;
import root.datatypes.DtFuncion;
import root.datatypes.DtPlataforma;
import root.datatypes.DtEspectaculo;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import root.entidades.Artista;
import root.entidades.Compra;
import root.datatypes.DtArtista;
import root.entidades.Espectaculo;
import root.entidades.Espectador;
import root.entidades.EstadoEspectaculo;
import root.entidades.Funcion;
import root.entidades.PaqueteDeEspectaculos;
import root.entidades.Plataforma;

/**
 *
 * @author elinzar
 */
public class ManEspectaculo {
    
    /**
     *
     * @param plataforma
     * @param artista
     * @param espectaculo
     */
    public static void altaEspectaculo(String plataforma, String artista, DtEspectaculo espectaculo)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        TypedQuery<Plataforma> consultaPlataforma = em.createNamedQuery("Plataforma.findByNombre",Plataforma.class);
        consultaPlataforma.setParameter("nombre", plataforma);
        Plataforma estaPlataforma = consultaPlataforma.getSingleResult();
        
        TypedQuery<Artista> consultaArtista = em.createNamedQuery("ArtistaporNick",Artista.class);
        consultaArtista.setParameter("nickname", artista);
        Artista esteArtista = consultaArtista.getSingleResult();
        
        Espectaculo nuevoEspectaculo = new Espectaculo(espectaculo.getNombre(),espectaculo.getDescripcion(),espectaculo.getDuracion(),espectaculo.getCantidadMaximaEspectadores(),espectaculo.getCantidadMinimaEspectadores(),espectaculo.getUrl(),espectaculo.getCosto(),espectaculo.getFechaDeRegistro(), estaPlataforma, esteArtista);
        nuevoEspectaculo.setEstado(EstadoEspectaculo.ACEPTADO);
        em.getTransaction().commit();
        em.getTransaction().begin();
        em.persist(nuevoEspectaculo);
        em.getTransaction().commit();
        em.getTransaction().begin();
        em.close();
        emf.close(); 
    }
    
    public static boolean existeEspectaculo(String nombreEspectaculo){
        boolean existe = false;
       EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
       EntityManager em = emf.createEntityManager();
       em.getTransaction().begin();
       TypedQuery<Espectaculo> consulta = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class);
       consulta.setParameter("nombre", nombreEspectaculo);
       List<Espectaculo> lEspectaculo = consulta.getResultList();
       em.getTransaction().commit();
       if(lEspectaculo.size()>0 && lEspectaculo.get(0).getEstado()==EstadoEspectaculo.ACEPTADO)
        {
            existe=true;
        }
       em.close();
       emf.close();
       return existe;
       
   }
    
    public static List<DtFuncion> listarFunciones(String nombreEsp){
       EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
       EntityManager em = emf.createEntityManager();
       em.getTransaction().begin();
       TypedQuery<Espectaculo> consulta = em.createNamedQuery("Espectaculo.findByNombre", Espectaculo.class);
       consulta.setParameter("nombre", nombreEsp);
       Espectaculo e = consulta.getSingleResult();
       if(e.getEstado()==EstadoEspectaculo.ACEPTADO){
       List<DtFuncion> lDtf = new ArrayList<DtFuncion>();
       List<Funcion> funciones = e.getFunciones();
        java.sql.Date f= new java.sql.Date(Calendar.getInstance().getTime().getTime());
       for (Funcion i :funciones){
           if(i.getFecha().after(f)){
           DtFuncion esteDt = new DtFuncion(i.getId(),i.getNombre(),i.getHoraInicio(),i.getFechaRegistro(),i.getFecha());
           lDtf.add(esteDt);
           }
       }
       em.close();
       emf.close();
       return lDtf;}else{
       return null;
       }
    }
    
    public static float getDescuento(String nickname, String nombreFuncion){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick",Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        java.sql.Date ahorita= new java.sql.Date(Calendar.getInstance().getTime().getTime());
        List<Compra> comprasDesteMen = esteMen.getCompras();
        List<PaqueteDeEspectaculos> paquetesComprados = new ArrayList<PaqueteDeEspectaculos>();
        for(Compra i :comprasDesteMen){
            if(i.getPaquete().getFechaFin().after(ahorita)){
           paquetesComprados.add(i.getPaquete());
            }
        }
        TypedQuery<Funcion> consultaFuncion = em.createNamedQuery("Funcion.findByNombre",Funcion.class);
        consultaFuncion.setParameter("nombre", nombreFuncion);
        Funcion funcion = consultaFuncion.getSingleResult();
        float result = 0;
        for(PaqueteDeEspectaculos i :paquetesComprados){
            for(Espectaculo j :i.getEspectaculos()){
                if(j.getId()==funcion.getEspectaculo().getId()){
                    result = i.getDescuento();
                }
            }
        }
        em.close();
        emf.close();
        return result;
    }
    
    public static float getCosto(String nombreFuncion){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery<Funcion> consultaFuncion = em.createNamedQuery("Funcion.findByNombre",Funcion.class);
        consultaFuncion.setParameter("nombre", nombreFuncion);
        Funcion funcion = consultaFuncion.getSingleResult();
        em.close();
        emf.close();
        return funcion.getEspectaculo().getCosto();
    }
    
    public static DtFuncion getDatosFuncion(String nombreFuncion){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery<Funcion> consultaFuncion = em.createNamedQuery("Funcion.findByNombre",Funcion.class);
        consultaFuncion.setParameter("nombre", nombreFuncion);
        Funcion funcion = consultaFuncion.getSingleResult();
        em.close();
        emf.close();
        return funcion.getMyDt();
    }
    
    
    
    
    public static DtPlataforma plataformaEspectaculos(String nombre)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectaculo> consulta = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class);
        consulta.setParameter("nombre", nombre);
        Espectaculo e = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        DtPlataforma plat=new DtPlataforma();
        
        plat=e.getPlataforma().getMyDt();
        
        return plat;
    }
    
    
    
    
    public static List<DtPaqueteDeEspectaculos> listarPaquetesEspectaculos(String nombre)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectaculo> consulta = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class);
        consulta.setParameter("nombre", nombre);
        Espectaculo e = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<DtPaqueteDeEspectaculos> lista=new ArrayList<DtPaqueteDeEspectaculos>();

        for(int u=0; u<e.getPaquetes().size(); u++)
        {
            lista.add(e.getPaquetes().get(u).getMyDt());
        }

        return lista;
    }
    
    public static List<String> getNombres(String nombrePlataforma) {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
            EntityManager em = emf.createEntityManager();
            List<Espectaculo> esps = em.createNamedQuery("Espectaculo.findAll", Espectaculo.class)
                    .getResultList();
            em.close();
            for(Espectaculo i: esps){
                if(i.getEstado()!=EstadoEspectaculo.ACEPTADO){
                    esps.remove(i);
                }
            }
            ArrayList<String> nombres = new ArrayList();
            for(Espectaculo e: esps){
//            esps.forEach(e -> {
                if(e.getPlataforma().getNombre().equals(nombrePlataforma)) {
                    nombres.add(e.getNombre());
                }
//            });
            }
            return nombres;
        }
    
    public static Espectaculo getEspectaculo(String nombreEspectaculo) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        Espectaculo e = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class)
                .setParameter("nombre", nombreEspectaculo).getSingleResult();
        em.close();
        emf.close();
        return e;
    }
    
    public static boolean estaCompleta(String nombreFuncion){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery<Funcion> consulta = em.createNamedQuery("Funcion.findByNombre",Funcion.class);
        consulta.setParameter("nombre", nombreFuncion);
        Funcion estaF = consulta.getSingleResult();
        boolean result = estaF.estaCompleta();
        em.close();
        emf.close();
        return result;
    }
    
    public static List<DtArtista> getInvitados(String nombreFuncion){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery<Funcion> consulta = em.createNamedQuery("Funcion.findByNombre", Funcion.class);
        consulta.setParameter("nombre", nombreFuncion);
        Funcion estaFuncion = consulta.getSingleResult();
        em.close();
        emf.close();
        List<DtArtista> result = new ArrayList<DtArtista>();
        for(Artista i :estaFuncion.getInvitados()){
            result.add(i.getMyDt());
        }
        return result;
    }
    
    public static List<DtEspectaculo> listarRechazados(){
        List<DtEspectaculo> resultado = new ArrayList<DtEspectaculo>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery consulta = em.createNamedQuery("Espectaculo.listarPorEstado",Espectaculo.class);
        consulta.setParameter("estado", EstadoEspectaculo.RECHAZADO);
        List<Espectaculo> lista = consulta.getResultList();
        em.close();
        emf.close();
        for(Espectaculo i:lista){
            DtEspectaculo este = i.getMyDt();
            resultado.add(este);
        }
        return resultado;
    }
    
        public static List<DtEspectaculo> listarIngresados(){
        List<DtEspectaculo> resultado = new ArrayList<DtEspectaculo>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery consulta = em.createNamedQuery("Espectaculo.listarPorEstado",Espectaculo.class);
        consulta.setParameter("estado", EstadoEspectaculo.INGRESADO);
        List<Espectaculo> lista = consulta.getResultList();
        em.close();
        emf.close();
        for(Espectaculo i:lista){
            DtEspectaculo este = i.getMyDt();
            resultado.add(este);
        }
        return resultado;
    }
        
    public static void aceptar_rechazarIngresado(String nombre, EstadoEspectaculo estado){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectaculo> consulta = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class);
        consulta.setParameter("nombre", nombre);
        Espectaculo e = consulta.getSingleResult();
        e.setEstado(estado);
        em.persist(e);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }
     
}

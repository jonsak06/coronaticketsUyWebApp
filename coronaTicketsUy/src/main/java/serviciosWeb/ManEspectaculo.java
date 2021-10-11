/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serviciosWeb;

import root.datatypes.DtPaqueteDeEspectaculos;
import root.datatypes.DtFuncion;
import root.datatypes.DtPlataforma;
import root.datatypes.DtEspectaculo;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import root.entidades.Artista;
import root.entidades.Compra;
import root.datatypes.DtArtista;
import root.entidades.Categoria;
import root.entidades.Espectaculo;
import root.entidades.Espectador;
import root.entidades.EstadoEspectaculo;
import root.entidades.EstadoRegistro;
import root.entidades.Funcion;
import root.entidades.PaqueteDeEspectaculos;
import root.entidades.Plataforma;
import root.entidades.Registro;

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
    public static void altaEspectaculo(String plataforma, String artista, List<String> categorias,DtEspectaculo espectaculo, String pathImagen)
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
        nuevoEspectaculo.setEstado(EstadoEspectaculo.INGRESADO);
        nuevoEspectaculo.setImagen(pathImagen);
        
        em.getTransaction().commit();
        em.getTransaction().begin();
        List<Categoria> categoriasDelEsp = new ArrayList<Categoria>();
        for(String i:categorias){
            TypedQuery<Categoria> consulta = em.createNamedQuery("Categoria.findByNombre",Categoria.class);
            consulta.setParameter("nombre", i);
            categoriasDelEsp.add(consulta.getSingleResult());
        }
        nuevoEspectaculo.setCategoria(categoriasDelEsp);
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
    
    public static boolean existeCategoria(String nombreCat) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        List<Categoria> paq = em.createNamedQuery("Categoria.findByNombre", Categoria.class)
                .setParameter("nombre", nombreCat).getResultList();
        
        em.close();
        return paq.size()>0;
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
    
    public static List<DtEspectaculo> listarEspPorCat(String nombreCat){
    
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Categoria> consulta = em.createNamedQuery("Categoria.findByNombre", Categoria.class);
        consulta.setParameter("nombre", nombreCat);
        List<Categoria> p = consulta.getResultList();
        Categoria plat = p.get(0);
        em.getTransaction().commit();
        List<Espectaculo> todos = em.createNamedQuery("Espectaculo.findAll",Espectaculo.class).getResultList();
        em.close();
        emf.close();
        
        List<DtEspectaculo> dtE = new ArrayList<DtEspectaculo>();
        for (Espectaculo i :todos){
            if(i.getEstado()==EstadoEspectaculo.ACEPTADO){
                List<Categoria> categoriasDelEsp = i.getCategoria();
                for(Categoria j: categoriasDelEsp){
                if(j.getNombre().equals(plat.getNombre())){
                DtEspectaculo esteDt = i.getMyDt();
                dtE.add(esteDt);}

                }
                }
            
        }
        return dtE;
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
    
    public static List<String> listarCategorias(){
    List<String> lista = new ArrayList<String>();
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
    EntityManager em = emf.createEntityManager();
    List<Categoria> todas = em.createNamedQuery("Categoria.findAll",Categoria.class).getResultList();
    em.close();
    emf.close();
    for(Categoria i :todas){
        lista.add(i.getNombre());
    }
    return lista;
    }
     
    public static List<DtFuncion> funcEspNoReg(String nickname, String nombreEspectaculo){//lista las funciones del espectaculo a las cuales el espectador no esta registrado
         EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
         EntityManager em = emf.createEntityManager();
         TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick",Espectador.class);
         consulta.setParameter("nickname", nickname);
         Espectador estemen = consulta.getSingleResult();
         TypedQuery<Espectaculo> consulta2 = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class);
        
         consulta2.setParameter("nombre", nombreEspectaculo);
         Espectaculo e = consulta2.getSingleResult();
         em.close();
         emf.close();
         List<Funcion> funcionesDelEsp = e.getFunciones();
         List<Funcion> funcionesRegistradas = new ArrayList<Funcion>();
         for(Registro r: estemen.getRegistros()){
             if(r.getEstado()!=EstadoRegistro.USADO){
             funcionesRegistradas.add(r.getFuncion());
             }
         }
         List<Funcion> func2 = new ArrayList<Funcion>();
         List<DtFuncion> resultado = new ArrayList<DtFuncion>();
         for(Funcion i: funcionesDelEsp){
             Date date = new Date();
             if(funcionesRegistradas.contains(i)==false && i.estaCompleta()==false && i.getFecha().after(date)){
                 func2.add(i);
             }
         }
         for(Funcion f: func2){
             resultado.add(f.getMyDt());
         }
         return resultado;
    }
    
    public static List<DtFuncion> listarTodasLasFunciones(String nombreEsp) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectaculo> consulta = em.createNamedQuery("Espectaculo.findByNombre", Espectaculo.class);
        consulta.setParameter("nombre", nombreEsp);
        Espectaculo e = consulta.getSingleResult();
        if (e.getEstado() == EstadoEspectaculo.ACEPTADO) {
            List<DtFuncion> lDtf = new ArrayList<DtFuncion>();
            List<Funcion> funciones = e.getFunciones();
            for (Funcion i : funciones) {
                DtFuncion esteDt = new DtFuncion(i.getId(), i.getNombre(), i.getHoraInicio(), i.getFechaRegistro(), i.getFecha());
                lDtf.add(esteDt);
            }
            em.close();
            emf.close();
            return lDtf;
        } else {
            return null;
        }
    }
    
    public static List<DtEspectaculo> listarEspectaculos() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        List<Espectaculo> esps = em.createNamedQuery("Espectaculo.findAll",Espectaculo.class).getResultList();
        List<DtEspectaculo> dvEsps = new ArrayList();
        for(Espectaculo e : esps) {
            dvEsps.add(e.getMyDt());
        }
        em.close();
        emf.close();
        return dvEsps;
    }
    
    public static List<DtEspectaculo> listarAceptados() {
        List<DtEspectaculo> dvEsps = new ArrayList<DtEspectaculo>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        List<Espectaculo> esps = em.createNamedQuery("Espectaculo.listarPorEstado", Espectaculo.class)
                .setParameter("estado", EstadoEspectaculo.ACEPTADO).getResultList();
        em.close();
        emf.close();
        for (Espectaculo e : esps) {
            dvEsps.add(e.getMyDt());
        }
        return dvEsps;
    }
    
}

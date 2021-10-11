/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serviciosWeb;

import root.datatypes.DtEspectador;
import root.datatypes.DtFuncion;
import root.datatypes.DtRegistro;
import root.datatypes.DtEspectaculo;
import java.util.*;
import java.io.Serializable;
import java.sql.Date;
import java.time.Instant;
import static java.time.Instant.now;
import java.util.List;
import javax.persistence.*;
import root.entidades.Artista;
import root.datatypes.DtArtista;
import root.datatypes.DtPaqueteDeEspectaculos;
import root.datatypes.DtUsuario;
import root.entidades.Compra;
import root.entidades.Espectaculo;
import root.entidades.Espectador;
import root.entidades.EstadoRegistro;
import root.entidades.Funcion;
import root.entidades.PaqueteDeEspectaculos;
import root.entidades.Registro;
import root.entidades.Usuario;
import static serviciosWeb.ManejadorUsuarios.getArtistas;
import static serviciosWeb.ManejadorUsuarios.getEspectadores;

/**
 *
 * @author tecnologo
 */
public class ManejadorUsuarios {

//           
    public ManejadorUsuarios() {
    }

    public static List<DtEspectador> getEspectadores() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("Espectador.findAll", Espectador.class);
        List<Espectador> e = consulta.getResultList();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<DtEspectador> dtE = new ArrayList<DtEspectador>();
        for (Espectador i : e) {
            DtEspectador esteDt = i.getMyDt();
            dtE.add(esteDt);
        }
        return dtE;
    }
//    

    public static List<DtArtista> getArtistas() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("Artista.findAll", Artista.class);
        List<Artista> a = consulta.getResultList();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<DtArtista> dtA = new ArrayList<DtArtista>();
        for (Artista i : a) {
            DtArtista esteDt = i.getMyDt();
            dtA.add(esteDt);
        }
        return dtA;
    }

    public static List<DtEspectador> getNoRegistrados(String nombreFuncion) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Funcion> consulta = em.createNamedQuery("Funcion.findByNombre", Funcion.class);
        consulta.setParameter("nombre", nombreFuncion);
        Funcion estaFuncion = consulta.getSingleResult();
        em.getTransaction().commit();
        List<DtEspectador> listaFinal = new ArrayList<DtEspectador>();
        List<Registro> regF = estaFuncion.getRegistros();
        List<String> listadeNick = new ArrayList<String>();
        for (Registro i : regF) {
            if (i.getEstado() != EstadoRegistro.USADO) {
                String nick = i.getEspectador().getNickname();
                listadeNick.add(nick);
            }
        }
        for (String i : listadeNick) {
            TypedQuery<Espectador> cons = em.createNamedQuery("EspectadorporNick", Espectador.class);
            Espectador este = cons.setParameter("nickname", i).getSingleResult();
            DtEspectador esteDt = este.getMyDt();
            listaFinal.add(esteDt);
        }
        List<DtEspectador> resultado = new ArrayList<DtEspectador>();
        List<DtEspectador> listaTotal = ManejadorUsuarios.getEspectadores();
        for (DtEspectador i : listaTotal) {
            int esta = 0;
            for (DtEspectador j : listaFinal) {
                if (j.getNickname().equals(i.getNickname())) {
                    esta = esta + 1;
                }
            }
            if (esta == 0) {
                resultado.add(i);
            }
        }
        em.close();
        emf.close();
        return resultado;
    }

    public static boolean existeArtista(String nickname) {
        boolean us = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("ArtistaporNick", Artista.class);
        consulta.setParameter("nickname", nickname);
        List<Artista> a = consulta.getResultList();
        em.getTransaction().commit();
        if (a.size() > 0) {
            us = true;
        }
        em.close();
        emf.close();
        return us;
    }

        
    public static boolean existeEspectador(String nickname) {
        boolean us = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        List<Espectador> e = consulta.getResultList();
        em.getTransaction().commit();
        if (e.size() > 0) {
            us = true;
        }
        em.close();
        emf.close();
        return us;
    }

    public static boolean existeCorreo(String correo) {
        boolean us = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("Artista.findAll", Artista.class);
        List<Artista> a = consulta.getResultList();
        for (int i = 0; i < a.size(); i++) {
            if (a.get(i).getCorreo().equals(correo)) {
                us = true;
            }
        }
        TypedQuery<Espectador> consulta2 = em.createNamedQuery("Espectador.findAll", Espectador.class);
        List<Espectador> e = consulta2.getResultList();
        for (int i = 0; i < e.size(); i++) {
            if (e.get(i).getCorreo().equals(correo)) {
                us = true;
            }
        }

        em.getTransaction().commit();
        em.close();
        emf.close();
        return us;
    }

    public static void altaArtista(DtArtista ar) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Artista vp = new Artista(ar.getNombre(), ar.getApellido(), ar.getCorreo(), ar.getNickname(), ar.getImagen(), ar.getFechaNacimiento(), ar.getDescripcion(), ar.getLinkWeb(), ar.getBiografia(), ar.getPass());
        em.getTransaction().commit();
        em.getTransaction().begin();

        em.persist(vp);
        em.getTransaction().commit();
        em.getTransaction().begin();
        em.close();
        emf.close();
    }

    public static void altaEspectador(DtEspectador es) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Espectador vp = new Espectador(es.getNombre(), es.getApellido(), es.getCorreo(), es.getNickname(), es.getImagen(), es.getFechaNacimiento(), es.getPass());
        em.getTransaction().commit();
        em.getTransaction().begin();
        em.persist(vp);
        em.getTransaction().commit();
        em.getTransaction().begin();
        em.close();
        emf.close();
    }
//    

    public static void modificarArtista(DtArtista ar) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> lista = em.createNamedQuery("ArtistaporNick", Artista.class);
        lista.setParameter("nickname", ar.getNickname());
        Artista vp = lista.getSingleResult();
        vp.setApellido(ar.getApellido());
        vp.setBiografia(ar.getBiografia());
        vp.setImagen(ar.getImagen());
        vp.setNombre(ar.getNombre());
        vp.setPasswd(ar.getPass());
        vp.setLinkWeb(ar.getLinkWeb());
        em.persist(vp);
        em.getTransaction().commit();
//        em.getTransaction().begin();   NO ENTIENDO POR QUE UN BEGIN AQUI
        em.close();
        emf.close();
    }
//    
//    

    public static void modificarEspectador(DtEspectador es) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> lista = em.createNamedQuery("EspectadorporNick", Espectador.class);
        lista.setParameter("nickname", es.getNickname());
        Espectador vp = lista.getSingleResult();
        vp.setApellido(es.getApellido());
        vp.setNombre(es.getNombre());
        vp.setCorreo(es.getCorreo());
        vp.setPasswd(es.getPass());
        em.persist(vp);
        em.getTransaction().commit();
        em.close();
        emf.close();

    }

    public static int getCanjeables(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        consulta.getSingleResult().calcularCanjeables();
        int cantCanj = consulta.getSingleResult().getCanjeables();
        em.close();
        emf.close();
        return cantCanj;
    }

    public static List<DtRegistro> listarCanjeables(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        List<Registro> registros = esteMen.getRegistros();
        List<Registro> canjeables = new ArrayList<Registro>();
        for (Registro i : registros) {
            if (i.getEstado() != EstadoRegistro.USADO && i.getCosto() != 0) {
                canjeables.add(i);
            }
        }
        em.close();
        emf.close();
        List<DtRegistro> resultado = new ArrayList<DtRegistro>();
        for (Registro i : canjeables) {
            DtRegistro dt = i.getMyDt();
            resultado.add(dt);
        }
        return resultado;
    }

    public static void canjearRegistros(List<String> canjeables, String nickname, float costo, String nombreFuncion, int fdia, int fmes, int fanio) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
//        Registro r = new Registro();
//        r.setCosto(costo);
        List<Registro> canjeados = new ArrayList<Registro>();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        TypedQuery<Funcion> consultaFuncion = em.createNamedQuery("Funcion.findByNombre", Funcion.class);
        consultaFuncion.setParameter("nombre", nombreFuncion);
        Funcion estaFUncion = consultaFuncion.getSingleResult();
//        r.setEspectador(esteMen);
//        r.setFuncion(estaFUncion);
        List<Registro> registros = esteMen.getRegistros();
        for (Registro i : registros) {
            int esta = 0;
            for (String j : canjeables) {
                if (i.getFuncion().getNombre().equals(j)) {
                    esta++;
                }
            }
            if (esta != 0) {
                i.setEstado(EstadoRegistro.USADO);
                canjeados.add(i);
//                i.setFuncion(null);
                em.persist(i);
            }
        }
//        r.setCanjeados(canjeados);

//        java.sql.Date estaFecha = new java.sql.Date(anio+1900-1899,mes-12,dia-31);
//        r.setFecha(estaFecha);
//        r.setEstado(EstadoRegistro.PENDIENTE);
        Registro r = new Registro(estaFUncion, esteMen, fdia, fmes, fanio, costo);
//        em.persist(r);
        r.setCanjeados(canjeados);
        em.persist(r);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public static void registrarUsuario(String nickname, String nombreFuncion, float costo, int fdia, int fmes, int fanio) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");//pedir instancia de la fabrica del entity manager
        EntityManager em = emf.createEntityManager();//le pido a la fabrica una instaancia del EM
        em.getTransaction().begin();//si vas a guardar o modificar la base de datos 
//        Registro r = new Registro();
//        r.setCosto(costo);
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);//declara la consulta
        consulta.setParameter("nickname", nickname);//setear parametros de la consulta
        Espectador esteMen = consulta.getSingleResult();//si es un solo resultado si no usar getResultList()
        TypedQuery<Funcion> consultaFuncion = em.createNamedQuery("Funcion.findByNombre", Funcion.class);
        consultaFuncion.setParameter("nombre", nombreFuncion);
        Funcion estaFUncion = consultaFuncion.getSingleResult();
//        r.setEspectador(esteMen);
//        r.setFuncion(estaFUncion);
//        java.sql.Date estaFecha = new java.sql.Date(anio+1900-1899,mes-12,dia-31);
//        r.setFecha(estaFecha);
//        r.setEstado(EstadoRegistro.PENDIENTE);
        Registro r = new Registro(estaFUncion, esteMen, fdia, fmes, fanio, costo);
        em.persist(r);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public static DtEspectador getDatosEspectador(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        return esteMen.getMyDt();
    }

    public static DtArtista getDatosArtista(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("ArtistaporNick", Artista.class);
        consulta.setParameter("nickname", nickname);
        Artista esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        return esteMen.getMyDt();
    }

    public static List<DtRegistro> getRegistros(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<DtRegistro> lista = new ArrayList<DtRegistro>();
        for (int i = 0; i < esteMen.getRegistros().size(); i++) {
            lista.add(esteMen.getRegistros().get(i).getMyDt());

        }
        return lista;
    }

    public static List<DtFuncion> getFuncionesRegistros(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<DtFuncion> lista = new ArrayList<DtFuncion>();
        for (int i = 0; i < esteMen.getRegistros().size(); i++) {
            lista.add(esteMen.getRegistros().get(i).getFuncion().getMyDt());

        }
        return lista;
    }

    public static List<DtFuncion> getFuncionesRegistrosNoUsados(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<DtFuncion> lista = new ArrayList<DtFuncion>();
        for (Registro r : esteMen.getRegistros()) {
            if (r.getEstado() == EstadoRegistro.PENDIENTE) {
                lista.add(r.getFuncion().getMyDt());
            }

        }
        return lista;
    }

    public static List<DtEspectaculo> listarEspectaculosDeArtista(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("ArtistaporNick", Artista.class);
        consulta.setParameter("nickname", nickname);
        Artista a = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<DtEspectaculo> lista = new ArrayList<DtEspectaculo>();
        for (int i = 0; i < a.getEspectaculos().size(); i++) {
            lista.add(a.getEspectaculos().get(i).getMyDt());

        }
        return lista;
    }

    public static void actualizarRegistros() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        java.sql.Date f = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        em.getTransaction().begin();
        List<Espectador> lista = new ArrayList<Espectador>();
        TypedQuery<Espectador> consulta = em.createNamedQuery("Espectador.findAll", Espectador.class);
        lista = consulta.getResultList();
        for (Espectador i : lista) {
            List<Registro> registros = i.getRegistros();
            for (Registro j : registros) {
                if (j.getFuncion().getFecha().before(f)) {
                    j.setEstado(EstadoRegistro.USADO);
                }
            }
            em.persist(i);
        }
        em.getTransaction().commit();
        em.close();
        emf.close();

    }

    public static List<DtFuncion> getFuncionesNoRegistradas(String nickname) {
        List<DtFuncion> resultado = new ArrayList<DtFuncion>();

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador estemen = consulta.getSingleResult();
        List<Registro> registros = estemen.getRegistros();
        List<Funcion> funcionesDesteMen = new ArrayList<Funcion>();
        for (Registro i : registros) {
            if (i.getEstado() != EstadoRegistro.USADO) {
                funcionesDesteMen.add(i.getFuncion());
            }
        }
        TypedQuery<Funcion> consulta2 = em.createNamedQuery("Funcion.findAll", Funcion.class);
        List<Funcion> todasLasFunciones = consulta2.getResultList();
        todasLasFunciones.retainAll(funcionesDesteMen);
        for (Funcion f : todasLasFunciones) {
            resultado.add(f.getMyDt());
        }
        em.close();
        emf.close();

        return resultado;
    }

    public static boolean tienePaquetesParaEspectaculo(String nickname, String nombreEspectaculo) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        Espectador estemen = em.createNamedQuery("EspectadorporNick", Espectador.class).setParameter("nickname", nickname).getSingleResult();
        Espectaculo esp = em.createNamedQuery("Espectaculo.findByNombre", Espectaculo.class).setParameter("nombre", nombreEspectaculo).getSingleResult();
        em.close();
        emf.close();
        boolean result = true;
        List<Compra> compras = estemen.getCompras();
        List<Espectaculo> espectaculosComprados = new ArrayList<Espectaculo>();
        java.sql.Date f = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        for (Compra i : compras) {
            if (i.getPaquete().getFechaFin().after(f)) {
                for (Espectaculo e : i.getPaquete().getEspectaculos()) {
                    if (espectaculosComprados.contains(e) == false) {
                        espectaculosComprados.add(e);
                    }
                }
            }
        }
        if (espectaculosComprados.contains(esp)) {
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    public static List<String> listarPaquetesParaEsp(String nickname, String nombreEspectaculo) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        Espectador estemen = em.createNamedQuery("EspectadorporNick", Espectador.class).setParameter("nickname", nickname).getSingleResult();
        Espectaculo esp = em.createNamedQuery("Espectaculo.findByNombre", Espectaculo.class).setParameter("nombre", nombreEspectaculo).getSingleResult();
        em.close();
        emf.close();
        List<String> result = new ArrayList<String>();
        List<Compra> compras = estemen.getCompras();
        List<Espectaculo> espectaculosComprados = new ArrayList<Espectaculo>();
        java.sql.Date f = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        for (Compra i : compras) {
            if (i.getPaquete().getFechaFin().after(f)) {
                if (i.getPaquete().getEspectaculos().contains(esp)) {
                    result.add(i.getPaquete().getNombre());
                }
            }
        }
        return result;
    }
    
    public static List<DtPaqueteDeEspectaculos> getPaquetesDelUsuario(String nickname){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        Espectador estemen = em.createNamedQuery("EspectadorporNick", Espectador.class).setParameter("nickname", nickname).getSingleResult();
        em.close();
        emf.close();
        List<DtPaqueteDeEspectaculos> resultado = new ArrayList<DtPaqueteDeEspectaculos>();
        List<Compra> compras = estemen.getCompras();
        for(Compra i:compras){
            resultado.add(i.getPaquete().getMyDt());
        }
        return resultado;
    }
    
    public static void comprarPaquete(String nickname, String nombrePaq){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Espectador estemen = em.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", nickname).getSingleResult();
        PaqueteDeEspectaculos paq = em.createNamedQuery("PaqueteByName",PaqueteDeEspectaculos.class).setParameter("nombre", nombrePaq).getSingleResult();
        long fecha = new java.util.Date().getTime();
        java.sql.Date date = new java.sql.Date(fecha);
        Compra compra = new Compra(paq, date,estemen);
        em.persist(compra);
        em.getTransaction().commit();
        
        
        em.close();
        emf.close();
    }
    
        public static List<DtUsuario> getUsuariosQueSiguesAr(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("ArtistaporNick", Artista.class);
        consulta.setParameter("nickname", nickname);
        Artista esteMen = consulta.getSingleResult();

        em.getTransaction().commit();
        em.close();
        emf.close();
        List<Usuario> lu = esteMen.getSiguiendo();
        List<DtUsuario> dtA = new ArrayList<DtUsuario>();
        for (Usuario i : lu) {
            if (i instanceof Artista) {

                DtUsuario esteDt = ((Artista) i).getMyDt();

                dtA.add(esteDt);
            }
            if (i instanceof Espectador) {

                DtUsuario esteDt = ((Espectador) i).getMyDt();

                dtA.add(esteDt);
            }
        }
        return dtA;
    }

    public static List<DtUsuario> getUsuariosQueSiguesEs(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<Usuario> lu = esteMen.getSiguiendo();
        List<DtUsuario> dtA = new ArrayList<DtUsuario>();
        for (Usuario i : lu) {
            if (i instanceof Artista) {

                DtUsuario esteDt = ((Artista) i).getMyDt();

                dtA.add(esteDt);
            }
            if (i instanceof Espectador) {

                DtUsuario esteDt = ((Espectador) i).getMyDt();

                dtA.add(esteDt);
            }
        }
        return dtA;
    }

    public static List<DtUsuario> getUsuariosQueNoSiguesAr(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("ArtistaporNick", Artista.class);
        consulta.setParameter("nickname", nickname);
        Artista esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();

        List<DtArtista> lAr = getArtistas();
        List<DtEspectador> lEs = getEspectadores();

        List<Usuario> lu = esteMen.getSiguiendo();
        List<DtUsuario> lDtU = new ArrayList<DtUsuario>();
        List<String> aux = new ArrayList<String>();
        for (Usuario i : lu) {
            aux.add(i.getNickname());
        }
        for (DtArtista i : lAr) {
            if (!aux.contains(i.getNickname())&& i.getNickname().equals(nickname)==false) {
                lDtU.add(i);
            }
        }
        for (DtEspectador i : lEs) {
            if (!aux.contains(i.getNickname())&& i.getNickname().equals(nickname)==false) {
                lDtU.add(i);
            }
        }

        return lDtU;
    }

    public static List<DtUsuario> getUsuariosQueNoSiguesEs(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();

        List<DtArtista> lAr = getArtistas();
        List<DtEspectador> lEs = getEspectadores();

        List<Usuario> lu = esteMen.getSiguiendo();
        List<DtUsuario> lDtU = new ArrayList<DtUsuario>();
        List<String> aux = new ArrayList<String>();
        for (Usuario i : lu) {
            aux.add(i.getNickname());
        }
        for (DtArtista i : lAr) {
            if (!aux.contains(i.getNickname())&& i.getNickname().equals(nickname)==false) {
                lDtU.add(i);
            }
        }
        for (DtEspectador i : lEs) {
            if (!aux.contains(i.getNickname())&& i.getNickname().equals(nickname)==false) {
                lDtU.add(i);
            }
        }

        return lDtU;
    }

    public static void seguirUsuarioEs(String nickname, String seguido) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();

        List<DtArtista> lAr = getArtistas();
        List<DtEspectador> lEs = getEspectadores();

        List<Usuario> lu = esteMen.getSiguiendo();

        for (DtArtista i : lAr) {
            if (seguido.equals(i.getNickname())) {

                TypedQuery<Artista> consulta2 = em.createNamedQuery("ArtistaporNick", Artista.class);
                consulta2.setParameter("nickname", seguido);
                Artista eseMen = consulta2.getSingleResult();
                lu.add(eseMen);
                esteMen.setSiguiendo(lu);

            }
        }
        for (DtEspectador i : lEs) {
            if (seguido.equals(i.getNickname())) {
                TypedQuery<Espectador> consulta2 = em.createNamedQuery("EspectadorporNick", Espectador.class);
                consulta2.setParameter("nickname", seguido);
                Espectador eseMen = consulta2.getSingleResult();
                lu.add(eseMen);
                esteMen.setSiguiendo(lu);
            }
        }
        em.persist(esteMen);
        em.getTransaction().commit();
        em.close();
        emf.close();

    }

    public static void seguirUsuarioAr(String nickname, String seguido) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("ArtistaporNick", Artista.class);
        consulta.setParameter("nickname", nickname);
        Artista esteMen = consulta.getSingleResult();

        List<DtArtista> lAr = getArtistas();
        List<DtEspectador> lEs = getEspectadores();

        List<Usuario> lu = esteMen.getSiguiendo();

        for (DtArtista i : lAr) {
            if (seguido.equals(i.getNickname())) {

                TypedQuery<Artista> consulta2 = em.createNamedQuery("ArtistaporNick", Artista.class);
                consulta2.setParameter("nickname", seguido);
                Artista eseMen = consulta2.getSingleResult();
                lu.add(eseMen);
                esteMen.setSiguiendo(lu);

            }
        }
        for (DtEspectador i : lEs) {
            if (seguido.equals(i.getNickname())) {
                TypedQuery<Espectador> consulta2 = em.createNamedQuery("EspectadorporNick", Espectador.class);
                consulta2.setParameter("nickname", seguido);
                Espectador eseMen = consulta2.getSingleResult();
                lu.add(eseMen);
                esteMen.setSiguiendo(lu);
            }
        }
        em.persist(esteMen);
        em.getTransaction().commit();
        em.close();
        emf.close();

    }
    
        public static void dejarDeSeguirUsuarioEs(String nickname, String seguido) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();

        List<DtArtista> lAr = getArtistas();
        List<DtEspectador> lEs = getEspectadores();

        List<Usuario> lu = esteMen.getSiguiendo();

        for (DtArtista i : lAr) {
            if (seguido.equals(i.getNickname())) {

                TypedQuery<Artista> consulta2 = em.createNamedQuery("ArtistaporNick", Artista.class);
                consulta2.setParameter("nickname", seguido);
                Artista eseMen = consulta2.getSingleResult();
                lu.remove(eseMen);
                esteMen.setSiguiendo(lu);

            }
        }
        for (DtEspectador i : lEs) {
            if (seguido.equals(i.getNickname())) {
                TypedQuery<Espectador> consulta2 = em.createNamedQuery("EspectadorporNick", Espectador.class);
                consulta2.setParameter("nickname", seguido);
                Espectador eseMen = consulta2.getSingleResult();
                lu.remove(eseMen);
                esteMen.setSiguiendo(lu);
            }
        }
        em.persist(esteMen);
        em.getTransaction().commit();
        em.close();
        emf.close();

    }
        
           public static void dejarDeSeguirUsuarioAr(String nickname, String seguido) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("ArtistaporNick", Artista.class);
        consulta.setParameter("nickname", nickname);
        Artista esteMen = consulta.getSingleResult();

        List<DtArtista> lAr = getArtistas();
        List<DtEspectador> lEs = getEspectadores();

        List<Usuario> lu = esteMen.getSiguiendo();

        for (DtArtista i : lAr) {
            if (seguido.equals(i.getNickname())) {

                TypedQuery<Artista> consulta2 = em.createNamedQuery("ArtistaporNick", Artista.class);
                consulta2.setParameter("nickname", seguido);
                Artista eseMen = consulta2.getSingleResult();
                lu.remove(eseMen);
                esteMen.setSiguiendo(lu);

            }
        }
        for (DtEspectador i : lEs) {
            if (seguido.equals(i.getNickname())) {
                TypedQuery<Espectador> consulta2 = em.createNamedQuery("EspectadorporNick", Espectador.class);
                consulta2.setParameter("nickname", seguido);
                Espectador eseMen = consulta2.getSingleResult();
                lu.remove(eseMen);
                esteMen.setSiguiendo(lu);
            }
        }
        em.persist(esteMen);
        em.getTransaction().commit();
        em.close();
        emf.close();

    }
    
    
    public static List<DtUsuario> getUsuariosQueTeSiguenAr(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Artista> consulta = em.createNamedQuery("ArtistaporNick", Artista.class);
        consulta.setParameter("nickname", nickname);
        Artista esteMen = consulta.getSingleResult();

        em.getTransaction().commit();
        em.close();
        emf.close();
        List<Usuario> lu = esteMen.getSeguidores();
        List<DtUsuario> dtA = new ArrayList<DtUsuario>();
        for (Usuario i : lu) {
            if (i instanceof Artista) {

                DtUsuario esteDt = ((Artista) i).getMyDt();

                dtA.add(esteDt);
            }
            if (i instanceof Espectador) {

                DtUsuario esteDt = ((Espectador) i).getMyDt();

                dtA.add(esteDt);
            }
        }
        return dtA;
    }
    
    public static List<DtUsuario> getUsuariosQueTeSiguenEs(String nickname) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        TypedQuery<Espectador> consulta = em.createNamedQuery("EspectadorporNick", Espectador.class);
        consulta.setParameter("nickname", nickname);
        Espectador esteMen = consulta.getSingleResult();
        em.getTransaction().commit();
        em.close();
        emf.close();
        List<Usuario> lu = esteMen.getSeguidores();
        List<DtUsuario> dtA = new ArrayList<DtUsuario>();
        for (Usuario i : lu) {
            if (i instanceof Artista) {

                DtUsuario esteDt = ((Artista) i).getMyDt();

                dtA.add(esteDt);
            }
            if (i instanceof Espectador) {

                DtUsuario esteDt = ((Espectador) i).getMyDt();

                dtA.add(esteDt);
            }
        }
        return dtA;
    }

}

//    






//    


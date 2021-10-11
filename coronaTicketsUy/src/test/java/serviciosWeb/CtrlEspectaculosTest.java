/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package serviciosWeb;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import root.datatypes.DtArtista;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtFuncion;
import root.datatypes.DtPlataforma;
import root.entidades.Espectaculo;
import root.entidades.EstadoEspectaculo;
import root.entidades.Funcion;
import root.entidades.Plataforma;

/**
 *
 * @author julio
 */
public class CtrlEspectaculosTest {
    
    public CtrlEspectaculosTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of listarPlataformas method, of class CtrlEspectaculos.
     */
    @Test
    public void testListarPlataformas() {
        System.out.println("listarPlataformas");
         Plataforma in = new Plataforma("Instagram Live","Funcionalidad de la red social Instagram, con la que \n" +
"los usuarios pueden transmitir vídeos en vivo.","https://www.instagram.com/liveoficial");
        Plataforma fb = new Plataforma("Facebook Watch","Servicio de video bajo demanda operado por \n" +
"Facebook.","https://www.facebook.com/watch/");
        Plataforma tl = new Plataforma("Twitter Live","Aplicación de Twitter para la transmisión de video \n" +
"en directo (streaming).","https://twitter.com/");
        Plataforma yt = new Plataforma("Youtube","Sitio web de origen estadounidense dedicado a \n" +
"compartir videos.","https://www.youtube.com/");
        CtrlEspectaculos instance = new CtrlEspectaculos();
        List<String> expResult = new ArrayList<String>();
          expResult.add(in.getNombre());
          expResult.add(fb.getNombre());
          expResult.add(tl.getNombre());
          expResult.add(yt.getNombre());
        List<DtPlataforma> result = instance.listarPlataformas();
        List<String> resultado = new ArrayList<String>();
        for(DtPlataforma i: result){
        resultado.add(i.getNombre());
        }
        assertEquals(expResult, resultado);
        // TODO review the generated test code and remove the default call to fail.
    }

//    /**
//     * Test of listarEspectaculos method, of class CtrlEspectaculos.
//     */
    @Test
    public void testListarEspectaculos() {
        CtrlEspectaculos instance = new CtrlEspectaculos();
        String nombre = "Twitter Live";
        List<String> resEsp = new ArrayList<String>();
        List<String> res = new ArrayList<String>();
        resEsp.add("Memphis Blues World");
        resEsp.add("Bien de Familia");
        resEsp.add("30 anios");
        List<DtEspectaculo> result = instance.listarEspectaculos(nombre);
        for(DtEspectaculo i:result){
            res.add(i.getNombre());
        }
        assertEquals(resEsp, res);
    }
//
    /**
     * Test of existeEspectaculo method, of class CtrlEspectaculos.
     */
    @Test
    public void testExisteEspectaculo1() {
        String nombreEspectaculo = "Los Village Volvieron";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = true;
        boolean result = instance.existeEspectaculo(nombreEspectaculo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
        public void testExisteEspectaculo2() {
        String nombreEspectaculo = "Grandes Exitos 2020";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = false;
        boolean result = instance.existeEspectaculo(nombreEspectaculo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    @Test
        public void testExisteEspectaculo3() {
        String nombreEspectaculo = "";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = false;
        boolean result = instance.existeEspectaculo(nombreEspectaculo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of listarFunciones method, of class CtrlEspectaculos.
//     */
    @Test
    public void testListarFunciones1() {
        String nombreEspectaculo = "Llega a Casa";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        List<DtFuncion> expResult = null;
        List<DtFuncion> result = instance.listarFunciones(nombreEspectaculo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testListarFunciones2() {
        String nombreEspectaculo = "Bien de Familia";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Bien de Familia - B");
        expResult.add("Bien de Familia - C");
        List<DtFuncion> result = instance.listarFunciones(nombreEspectaculo);
        List<String> resultado = new ArrayList<String>();
        for (DtFuncion i: result){
            resultado.add(i.getNombre());
        }
        assertEquals(expResult, resultado);
        // TODO review the generated test code and remove the default call to fail.
    }
//
    /**
     * Test of getDescuento method, of class CtrlEspectaculos.
     */
    @Test
    public void testGetDescuento() {
        String nickname = "costas";
        String nombreFuncion = "Bien de Familia - B";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        float expResult = 15;
        float result = instance.getDescuento(nickname, nombreFuncion);
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
    }

//    /**
//     * Test of getCosto method, of class CtrlEspectaculos.
//     */
    @Test
    public void testGetCosto() {
        String nombreFuncion = "Los Village Volvieron - 1";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        float expResult = 550;
        float result = instance.getCosto(nombreFuncion);
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of getDatosFuncion method, of class CtrlEspectaculos.
//     */
    @Test
    public void testGetDatosFuncion() {
        String nombreFuncion = "Los Village Volvieron - 1";
        
        CtrlEspectaculos instance = new CtrlEspectaculos();
        DtFuncion result = instance.getDatosFuncion(nombreFuncion);
        boolean id = result.getId()==35;
        boolean fecha = result.getFecha().toString().equals("2021-04-14");
        boolean fechaReg = result.getFechaDeRegistro().toString().equals("2021-03-31");
        boolean horaInicio = result.getHoraInicio().toString().equals("2021-04-14 15:30:00.0");
        boolean nombre = result.getNombre().equals("Los Village Volvieron - 1");
        assertTrue(id && fecha && horaInicio && fechaReg && nombre);
        

        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of existePlataforma method, of class CtrlEspectaculos.
//     */
    @Test
    public void testExistePlataforma() {
       String nombrePlat = "Youtube";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = true;
        boolean result = instance.existePlataforma(nombrePlat);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    @Test
    public void testExistePlataforma2() {
        String nombrePlat = "Youtube2";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = false;
        boolean result = instance.existePlataforma(nombrePlat);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of ingresarPlataforma method, of class CtrlEspectaculos.
//     */
    @Test
    public void testIngresarPlataforma() {
        String nombre = "plataformaTest";
        String descripcion = "esto es un test";
        String url = "www.test.com";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = true;
        boolean result = instance.ingresarPlataforma(nombre, descripcion, url);
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Plataforma plat = em.createNamedQuery("Plataforma.findByNombre",Plataforma.class).setParameter("nombre", nombre).getSingleResult();
        em.remove(plat);
        em.getTransaction().commit();
        em.close();
        emf.close();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of estaCompleta method, of class CtrlEspectaculos.
//     */
    @Test
    public void testEstaCompleta() {
        System.out.println("estaCompleta");
        String nombreFuncion = "Bien de Familia - C";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = false;
        boolean result = instance.estaCompleta(nombreFuncion);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of crearFuncion method, of class CtrlEspectaculos.
//     */
    @Test
    public void testCrearFuncion1() {
        System.out.println("crearFuncion");
        String nombreEspectaculo = "Bien de Familia";
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtFuncion dtFuncion = em.createNamedQuery("Funcion.findByNombre",Funcion.class).setParameter("nombre", "Bien de Familia - C").getSingleResult().getMyDt();
        em.close();
        emf.close();
        List<String> artInvi = new ArrayList<String>();
        artInvi.add("dmode");
        artInvi.add("vpeople");
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = false;
        boolean result = instance.crearFuncion(nombreEspectaculo, dtFuncion, artInvi);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
    
    @Test
    public void testCrearFuncion2() {
        System.out.println("crearFuncion");
        String nombreEspectaculo = "Bien de Familia";
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtFuncion dtFuncion = em.createNamedQuery("Funcion.findByNombre",Funcion.class).setParameter("nombre", "Bien de Familia - C").getSingleResult().getMyDt();
        em.close();
        emf.close();
        DtFuncion dtf = new DtFuncion(dtFuncion.getId(),"Bien de Familia - D",dtFuncion.getHoraInicio(),dtFuncion.getFechaDeRegistro(),dtFuncion.getFecha());
        List<String> artInvi = new ArrayList<String>();
        artInvi.add("dmode");
        artInvi.add("vpeople");
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = true;
        boolean result = instance.crearFuncion(nombreEspectaculo, dtf, artInvi);
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        em2.getTransaction().begin();
        Funcion f = em2.createNamedQuery("Funcion.findByNombre",Funcion.class).setParameter("nombre", "Bien de Familia - D").getSingleResult();
        em2.remove(f);
        em2.getTransaction().commit();
        em2.close();
        emf2.close();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//    /**
//     * Test of existeFuncion method, of class CtrlEspectaculos.
//     */
    @Test
    public void testExisteFuncion() {
        System.out.println("existeFuncion");
        String nombreFuncion = "Bien de Familia - C";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = true;
        boolean result = instance.existeFuncion(nombreFuncion);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testExisteFuncion2() {
        System.out.println("existeFuncion");
        String nombreFuncion = "Bien de Familia - D";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = false;
        boolean result = instance.existeFuncion(nombreFuncion);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of altaEspectaculo method, of class CtrlEspectaculos.
//     */
    @Test
    public void testAltaEspectaculo() {
        System.out.println("altaEspectaculo");
        String plataforma = "Youtube";
        String artista = "vpeople";
        List<String> categorias = new ArrayList<String>();
        categorias.add("Solistas");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtEspectaculo espectaculo = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class).setParameter("nombre", "Bien de Familia").getSingleResult().getMyDt();
        em.close();
        emf.close();
        DtEspectaculo dte = new DtEspectaculo(espectaculo.getId(),"test",espectaculo.getDescripcion(),espectaculo.getDuracion(),espectaculo.getCantidadMaximaEspectadores(),espectaculo.getCantidadMinimaEspectadores(),espectaculo.getUrl(),espectaculo.getCosto(),espectaculo.getFechaDeRegistro());
        String pathImagen = "PATH";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        instance.altaEspectaculo(plataforma, artista, categorias, dte, pathImagen);
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        em2.getTransaction().begin();
        Espectaculo e = em2.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class).setParameter("nombre", "test").getSingleResult();
        em2.remove(e);
        em2.getTransaction().commit();
        em2.close();
        emf2.close();
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of getInvitados method, of class CtrlEspectaculos.
//     */
    @Test
    public void testGetInvitados() {
        System.out.println("getInvitados");
        String nombreFuncion = "Los Village Volvieron - 1";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        List<String> expResult = new ArrayList<String>();
        expResult.add("dmode");
        expResult.add("clouper");
        List<DtArtista> result = instance.getInvitados(nombreFuncion);
        List<String> resultado = new ArrayList<String>();
        for(DtArtista i :result){
        resultado.add(i.getNickname());
        }
        assertEquals(expResult, resultado);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of listarRechazados method, of class CtrlEspectaculos.
//     */
    @Test
    public void testListarRechazados() {
        System.out.println("listarRechazados");
        CtrlEspectaculos instance = new CtrlEspectaculos();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Grandes Exitos 2020");
        List<DtEspectaculo> result = instance.listarRechazados();
        List<String> resultado = new ArrayList<String>();
        for(DtEspectaculo i: result){
        resultado.add(i.getNombre());
        }
        assertEquals(expResult, resultado);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of listarIngresados method, of class CtrlEspectaculos.
//     */
    @Test
    public void testListarIngresados() {
        System.out.println("listarIngresados");
         CtrlEspectaculos instance = new CtrlEspectaculos();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Llega a Casa");
        List<DtEspectaculo> result = instance.listarIngresados();
        List<String> resultado = new ArrayList<String>();
        for(DtEspectaculo i: result){
        resultado.add(i.getNombre());
        }
        assertEquals(expResult, resultado);
    }
//
//    /**
//     * Test of aceptar_rechazarIngresado method, of class CtrlEspectaculos.
//     */
    @Test
    public void testAceptar_rechazarIngresado() {
        System.out.println("aceptar_rechazarIngresado");
        String nombre = "Bien de Familia";
        EstadoEspectaculo estado = EstadoEspectaculo.RECHAZADO;
        CtrlEspectaculos instance = new CtrlEspectaculos();
        instance.aceptar_rechazarIngresado(nombre, estado);
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        EstadoEspectaculo estResult = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class).setParameter("nombre", nombre).getSingleResult().getEstado();
        assertEquals(estado, estResult);
        em.getTransaction().begin();
        Espectaculo e = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class).setParameter("nombre", nombre).getSingleResult();
        e.setEstado(EstadoEspectaculo.ACEPTADO);
        em.persist(e);
        em.getTransaction().commit();
        em.close();
        emf.close();
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of existeCategoria method, of class CtrlEspectaculos.
//     */
    @Test
    public void testExisteCategoria() {
        System.out.println("existeCategoria");
        String nombreCat = "Solistas2";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = false;
        boolean result = instance.existeCategoria(nombreCat);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testExisteCategoria2() {
        System.out.println("existeCategoria");
        String nombreCat = "Solistas";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        boolean expResult = true;
        boolean result = instance.existeCategoria(nombreCat);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of listarEspPorCat method, of class CtrlEspectaculos.
//     */
    @Test
    public void testListarEspPorCat() {
        System.out.println("listarEspPorCat");
        String nombreCat = "Solistas";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        List<String> expResult = new ArrayList<String>();
        List<String> resultado = new ArrayList<String>();
        expResult.add("Memphis Blues World");
        List<DtEspectaculo> result = instance.listarEspPorCat(nombreCat);
        for(DtEspectaculo i:result){
            resultado.add(i.getNombre());
        }
        assertEquals(expResult, resultado);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of listarCategorias method, of class CtrlEspectaculos.
//     */
    @Test
    public void testListarCategorias() {
        System.out.println("listarCategorias");
        CtrlEspectaculos instance = new CtrlEspectaculos();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Bandas Latinas");
        expResult.add("Solistas");
        expResult.add("Rock en Ingles");
        expResult.add("Musica Tropical");
        List<String> result = instance.listarCategorias();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of funcEspNoReg method, of class CtrlEspectaculos.
//     */
    @Test
    public void testFuncEspNoReg() {
        System.out.println("funcEspNoReg");
        String nickname = "costas";
        String nombreEspectaculo = "Bien de Familia";
        CtrlEspectaculos instance = new CtrlEspectaculos();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Bien de Familia - B");
        List<DtFuncion> result = instance.funcEspNoReg(nickname, nombreEspectaculo);
        List<String> resultado = new ArrayList<String>();
        for(DtFuncion i:result){
            resultado.add(i.getNombre());
        }
        assertEquals(expResult, resultado);
        // TODO review the generated test code and remove the default call to fail.
    }

    @Test
    public void testGetNombres() {
        System.out.println("testGetNombres");
        List<String> resEsp = new ArrayList<String>();
        resEsp.add("Memphis Blues World");
        resEsp.add("Bien de Familia");
        resEsp.add("30 anios");
        List<String> result = ManEspectaculo.getNombres("Twitter Live");
        assertEquals(resEsp, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testGetEspectaculo() {
        System.out.println("testGetNombres");
        String resEsp = "Bien de Familia";
        Espectaculo result = ManEspectaculo.getEspectaculo("Bien de Familia");
        String resultado = result.getNombre();
        assertEquals(resEsp, resultado);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testListarTodasLAsFunciones(){
        String nombreEsp = "Bien de Familia";
        CtrlEspectaculos instancia = new CtrlEspectaculos();
        List<DtFuncion> resFUnciones = instancia.listarTodasLasFunciones(nombreEsp);
        List<String> result = new ArrayList<String>();
        for (DtFuncion i: resFUnciones){
            result.add(i.getNombre());
        }
        List<String> resEsp = new ArrayList<String>();
        resEsp.add("Bien de Familia - A");
        resEsp.add("Bien de Familia - B");
        resEsp.add("Bien de Familia - C");
        assertEquals(resEsp, result);

    }
    
    @Test
    public void testListarTodasLAsFunciones2(){
        String nombreEsp = "Llega a Casa";
        CtrlEspectaculos instancia = new CtrlEspectaculos();
        List<DtFuncion> result = instancia.listarTodasLasFunciones(nombreEsp);
        List<DtFuncion> resEsp = null;
        assertEquals(resEsp, result);

    }
    
    @Test
    public void testListarTodosEspectaculos(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        List<Espectaculo> esps = em.createNamedQuery("Espectaculo.findAll").getResultList();      
        em.close();
        emf.close();
        List<String> resEsp = new ArrayList<String>();
        for (Espectaculo i: esps){
            resEsp.add(i.getNombre());
        }
        CtrlEspectaculos ce = new CtrlEspectaculos();
        List<DtEspectaculo> resultado = ce.listarTodosLosEspectaculos();
        List<String> result = new ArrayList<String>();
        for(DtEspectaculo e: resultado){
            result.add(e.getNombre());
        }
        assertEquals(resEsp, result);
    }
    
    @Test 
    public void testGetPlataforma(){
        Plataforma p = ManPlataformas.getPlataforma("Youtube");
        assertEquals("Youtube", p.getNombre());
    }
    
//    
}

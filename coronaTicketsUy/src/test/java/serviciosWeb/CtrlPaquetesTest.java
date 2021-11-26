/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package serviciosWeb;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtPaqueteDeEspectaculos;
import root.entidades.Espectaculo;
import root.entidades.PaqueteDeEspectaculos;

/**
 *
 * @author julio
 */
public class CtrlPaquetesTest {
    
    public CtrlPaquetesTest() {
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
     * Test of getInstance method, of class CtrlPaquetes.
     */

    /**
     * Test of confirmarAltaPaquete method, of class CtrlPaquetes.
     */
    @Test
    public void testConfirmarAltaPaquete() {
        System.out.println("confirmarAltaPaquete");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        PaqueteDeEspectaculos modelo = em.createNamedQuery("PaqueteByName",PaqueteDeEspectaculos.class).setParameter("nombre", "Paquete Latino").getSingleResult();
        em.close();
        emf.close();
        modelo.setNombre("test");
        CtrlPaquetes cp = CtrlPaquetes.getInstance();
        boolean resultado = cp.confirmarAltaPaquete(modelo.getNombre(), modelo.getDescrp(), modelo.getFechaAlta(), modelo.getFechaFin(), modelo.getDescuento());
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        em2.getTransaction().begin();
        PaqueteDeEspectaculos p = em2.createNamedQuery("PaqueteByName",PaqueteDeEspectaculos.class).setParameter("nombre", "test").getSingleResult();
        em2.remove(p);
        em2.getTransaction().commit();
        em2.close();
        emf2.close();
        assertTrue(resultado);
    }   
//
//    /**
//     * Test of listarPaquetes method, of class CtrlPaquetes.
//     */
    @Test
    public void testListarPaquetes() {
        System.out.println("listarPaquetes");
        List<String> resEsp = new ArrayList<String>();
        resEsp.add("Paquete de Bandas");
        resEsp.add("Paquete Solistas");
        resEsp.add("Paquete Latino");
        CtrlPaquetes cp = CtrlPaquetes.getInstance();
        List<String> resultado = cp.listarPaquetes();
        assertEquals(resEsp, resultado);
    }
//
//    /**
//     * Test of listarPaquetesVigentes method, of class CtrlPaquetes.
//     */
    @Test
    public void testListarPaquetesVigentes() {
        System.out.println("listarPaquetesVigentes");
        CtrlPaquetes instance = CtrlPaquetes.getInstance();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Paquete Latino");
        List<String> result = instance.listarPaquetesVigentes();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of listarPlataformas method, of class CtrlPaquetes.
//     */
    @Test
    public void testListarPlataformas() {
        System.out.println("listarPlataformas");
        CtrlPaquetes instance = CtrlPaquetes.getInstance();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Instagram Live");
        expResult.add("Facebook Watch");
        expResult.add("Twitter Live");
        expResult.add("Youtube");
        List<String> result = instance.listarPlataformas();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of listarEspectaculosNoIncluidos method, of class CtrlPaquetes.
//     */
    @Test
    public void testListarEspectaculosNoIncluidos() {
        System.out.println("listarEspectaculosNoIncluidos");
        String nombrePaquete = "Paquete Latino";
        String nombrePlataforma = "Twitter Live";
        CtrlPaquetes instance = CtrlPaquetes.getInstance();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Memphis Blues World");
        List<String> result = instance.listarEspectaculosNoIncluidos(nombrePaquete, nombrePlataforma);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of confirmarAgregadoEspectaculo method, of class CtrlPaquetes.
//     */
    @Test
    public void testConfirmarAgregadoEspectaculo() {
        System.out.println("confirmarAgregadoEspectaculo");
        String nombreEspectaculo = "Memphis Blues World";
        String nombrePaquete = "Paquete Latino";
        CtrlPaquetes instance = CtrlPaquetes.getInstance();
        instance.confirmarAgregadoEspectaculo(nombreEspectaculo, nombrePaquete);
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Espectaculo e = em.createNamedQuery("Espectaculo.findByNombre",Espectaculo.class).setParameter("nombre", nombreEspectaculo).getSingleResult();
        PaqueteDeEspectaculos p = em.createNamedQuery("PaqueteByName",PaqueteDeEspectaculos.class).setParameter("nombre",nombrePaquete).getSingleResult();
        e.getPaquetes().remove(p);
        p.getEspectaculos().remove(e);
        em.persist(p);
        em.persist(e);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }
//
//    /**
//     * Test of mostrarInfoPaquete method, of class CtrlPaquetes.
//     */
    @Test
    public void testMostrarInfoPaquete() {
        System.out.println("mostrarInfoPaquete");
        String nombrePaquete = "Paquete Latino";
        CtrlPaquetes instance = CtrlPaquetes.getInstance();
        DtPaqueteDeEspectaculos result = instance.mostrarInfoPaquete(nombrePaquete);
        boolean nombre = result.getNombre().equals("Paquete Latino");
        boolean descr = result.getDescripcion().equals("Paquete de espectaculos latinos");
        boolean descuento = result.getDescuento()==15;
        assertTrue(nombre && descr && descuento);

    }
//
//    /**
//     * Test of listarEspectaculosIncluidos method, of class CtrlPaquetes.
//     */
    @Test
    public void testListarEspectaculosIncluidos() {
        System.out.println("listarEspectaculosIncluidos");
        String nombrePaquete = "Paquete Latino";
        CtrlPaquetes instance = CtrlPaquetes.getInstance();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Bien de Familia");
        expResult.add("30 anios");
        List<String> result = instance.listarEspectaculosIncluidos(nombrePaquete);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of mostarInfoEspectaculo method, of class CtrlPaquetes.
//     */
    @Test
    public void testMostarInfoEspectaculo() {
        System.out.println("mostarInfoEspectaculo");
        String nombreEspectaculo = "Bien de Familia";
        CtrlPaquetes instance = CtrlPaquetes.getInstance();
        DtEspectaculo result = instance.mostarInfoEspectaculo(nombreEspectaculo);
        boolean nombre = result.getNombre().equals("Bien de Familia");
        boolean costo = result.getCosto() == 500;
        boolean duracion = result.getDuracion() == 150;
        boolean url = result.getUrl().equals("https://twitter.com/PimpinelaNet");
        assertTrue(nombre && costo && duracion && url);
    }
    
    @Test
    public void testagregarImagenPaquete() {
        System.out.println("mostarInfoEspectaculo");
        String nombrePaq = "Paquete Latino";
        CtrlPaquetes instance = CtrlPaquetes.getInstance();
        String imgPath = "home/img";
        instance.agregarImagenPaquete(nombrePaq, imgPath);
        instance.agregarImagenPaquete(nombrePaq, null);

    }   
     
//    
}

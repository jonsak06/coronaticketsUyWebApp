/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package serviciosWeb;

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
import root.datatypes.DtArtista;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtEspectador;
import root.datatypes.DtFuncion;
import root.datatypes.DtPaqueteDeEspectaculos;
import root.datatypes.DtPlataforma;
import root.datatypes.DtRegistro;
import root.datatypes.DtUsuario;
import root.entidades.Artista;
import root.entidades.Compra;
import root.entidades.Espectador;
import root.entidades.Registro;

/**
 *
 * @author julio
 */
public class crlUsuariosTest {

    public crlUsuariosTest() {
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
     * Test of getEspectadores method, of class crlUsuarios.
     */
    @Test
    public void testGetEspectadores() {

        crlUsuarios instance = new crlUsuarios();

        Espectador el = new Espectador("eleven11", "Eleven", "Ten", "eleven11@gmail.com", 31, 12, 1971);
        Espectador co = new Espectador("costas", "Gerardo", "Costas", "gcostas@gmail.com", 15, 11, 1983);
        Espectador ew = new Espectador("waston", "Emma", "Watson", "e.watson@gmail.com", 15, 4, 1990);
        Espectador gh = new Espectador("house", "Gregory", "House", "greghouse@gmail.com", 15, 5, 1959);
        Espectador sp = new Espectador("sergiop", "Sergio", "Puglia", "puglia@alpanpan.com.uy", 28, 1, 1959);
        Espectador ar = new Espectador("chino", "Alvaro", "Recoba", "chino@trico.org.uy", 17, 3, 1976);
        Espectador ap = new Espectador("tonyp", "Antonio", "Pacheco", "eltony@manya.org.uy", 14, 2, 1955);
        Espectador ml = new Espectador("lachiqui", "Mirtha", "Legrand", "lachiqui@hotmail.com.ar", 23, 2, 1927);
        Espectador cb = new Espectador("cbochinche", "Cacho", "Bochinche", "cbochinche@vera.com.uy", 8, 5, 1937);
        el.setPasswd("lkj34df");
        el.setImagen("silueta.jpg");
        co.setPasswd("poke579");
        co.setImagen("silueta.jpg");
        ew.setPasswd("mkji648");
        ew.setImagen(ew.getNickname() + ".jpg");
        gh.setPasswd("fcku0123");
        gh.setImagen(gh.getNickname() + ".jpg");
        sp.setPasswd("vbmn4r");
        sp.setImagen(sp.getNickname() + ".jpg");
        ar.setPasswd("ncnl123");
        ar.setImagen(ar.getNickname() + ".jpg");
        ap.setPasswd("mny101");
        ap.setImagen(ap.getNickname() + ".jpg");
        ml.setPasswd("1o1vbm");
        ml.setImagen("silueta.jpg");
        cb.setPasswd("ultraton01");
        cb.setImagen("silueta.jpg");
//        
        List<String> resultadoEsperado = new ArrayList<String>();
        resultadoEsperado.add(el.getNickname());
        resultadoEsperado.add(co.getNickname());
        resultadoEsperado.add(ew.getNickname());
        resultadoEsperado.add(gh.getNickname());
        resultadoEsperado.add(sp.getNickname());
        resultadoEsperado.add(ar.getNickname());
        resultadoEsperado.add(ap.getNickname());
        resultadoEsperado.add(ml.getNickname());
        resultadoEsperado.add(cb.getNickname());
        List<String> resultado = new ArrayList<String>();
        List<DtEspectador> res = instance.getEspectadores();
        for (DtEspectador i : res) {
            resultado.add(i.getNickname());
        }
        assertEquals(resultadoEsperado, resultado);
    }

    /**
     * Test of getArtistas method, of class crlUsuarios.
     */
    @Test
    public void testGetArtistas() {
        System.out.println("getArtistas");

        crlUsuarios instance = new crlUsuarios();
        Artista vp = new Artista();
        vp.setApellido("People");
        vp.setBiografia("Grupo   americano   del   disco   creado por   Jacques   Morali   y   Henry   Belolo en   1977.   Según   Marjorie   Burgess, todo   comenzó   cuando   Morali   fue   a un bar gay de Nueva York una noche y notó al bailarín Felipe Rose vestido como un nativo americano.");
        vp.setCorreo("vpeople@tuta.io");
        vp.setDescripcion("Village   People   es   una   innovadora   formación   musical de   estilo   disco   de   finales   de   los   anios   70.   Fue   famosa tanto   por   sus   peculiares   disfraces,   como   por   sus canciones pegadizas, con letras sugerentes y llenas dedobles sentidos.");
        java.sql.Date fvp = new java.sql.Date(1977 - 1899, 1 - 12, 1 - 31);
        vp.setFechaNacimiento(fvp);
        vp.setImagen("vpeople.jpg");
        vp.setLinkWeb("www.officialvillagepeople.com");
        vp.setNickname("vpeople");
        vp.setNombre("Village");
        Artista dm = new Artista();
        dm.setApellido("Mode");
        dm.setBiografia(" ");
        dm.setCorreo("dmode@tuta.io");
        dm.setDescripcion("Depeche   Mode   es   un   grupo   inglés   de   música electrónica   formado   en   Basildon,   Essex,   en   1980   por Vicent   Clarke   y   Andrew   John   Fletcher,   a   los   que   se unieron Martin Lee Gore y poco después David Gahan. Actualmente   se   le   considera   como   grupo   de   música alternativa.");
        java.sql.Date fdm = new java.sql.Date(1980 - 1899, 6 - 12, 14 - 31);
        dm.setFechaNacimiento(fdm);
        dm.setImagen("dmode.jpg");
        dm.setLinkWeb("www.depechemode.com");
        dm.setNickname("dmode");
        dm.setNombre("Depeche");
        Artista cl = new Artista();
        cl.setApellido("Lauper");
        cl.setBiografia("Cynthia   Ann   Stephanie   Lauper\n"
                + "(Brooklyn,   Nueva  York;   22   de   junio\n"
                + "de 1953).");
        cl.setCorreo("clauper@hotmail.com");
        cl.setDescripcion("Cynthia Ann Stephanie Lauper, conocida simplemente\n"
                + "como   Cyndi   Lauper,   es   una   cantautora,   actriz   y\n"
                + "empresaria   estadounidense.   Después   de   participar   en\n"
                + "el   grupo   musical,   Blue   Angel,   en   1983   firmó   con\n"
                + "Portrait   Records   (filial   de   Epic   Records)   y   lanzó   su\n"
                + "exitoso álbum debut She's So Unusual a finales de ese\n"
                + "mismo anio. Siguió  lanzando una serie de álbumes en\n"
                + "los que encontró una inmensa popularidad, superando\n"
                + "los límites de contenido de las letras de sus canciones");
        java.sql.Date fcl = new java.sql.Date(1953 - 1899, 6 - 12, 22 - 31);
        cl.setFechaNacimiento(fcl);
        cl.setImagen("clouper.jpg");
        cl.setLinkWeb("cyndilauper.com");
        cl.setNickname("clouper");
        cl.setNombre("Cyndi");
        Artista bs = new Artista();
        bs.setApellido("Springsteen");
        bs.setBiografia(" ");
        bs.setCorreo("bruceTheBoss@gmail.com");
        bs.setDescripcion("Bruce   Frederick   Joseph   Springsteen   (Long   Branch,\n"
                + "Nueva Jersey, 23 de septiembre de 1949), más conocido\n"
                + "como   Bruce   Springsteen,   es   un   cantante,   músico   y\n"
                + "compositor estadounidense.");
        java.sql.Date fbs = new java.sql.Date(1949 - 1899, 9 - 12, 23 - 31);
        bs.setFechaNacimiento(fbs);
        bs.setImagen("bruceTheBoss.jpg");
        bs.setLinkWeb("brucespringsteen.net");
        bs.setNickname("bruceTheBoss");
        bs.setNombre("Bruce");
        Artista tn = new Artista();
        tn.setApellido("Nelson");
        tn.setBiografia(" ");
        tn.setCorreo("tripleNelson@tuta.io");
        tn.setDescripcion("La   Triple   Nelson   es   un   grupo   de   rock   uruguayo\n"
                + "formado en enero de 1998 e integrado inicialmente por\n"
                + "Christian Cary (guitarra y voz), Fernando \"Paco\" Pintos\n"
                + "(bajo y coros) y Rubén Otonello (actualmente su nuevo\n"
                + "baterista es Rafael Ugo).");
        java.sql.Date ftn = new java.sql.Date(1998 - 1899, 1 - 12, 1 - 31);
        tn.setFechaNacimiento(ftn);
        tn.setImagen("tripleNelson.jpg");
        tn.setLinkWeb("www.latriplenelson.uy");
        tn.setNickname("tripleNelson");
        tn.setNombre("La Triple");
        Artista ll = new Artista();
        ll.setApellido("Ley");
        ll.setBiografia(" ");
        ll.setCorreo("la_ley@tuta.io");
        ll.setDescripcion("La Ley fue una banda chilena de rock formada en 1987\n"
                + "por   iniciativa   del   tecladista   y   guitarrista.   En   un\n"
                + "principio, La Ley tenía la aspiración de ser un grupo de\n"
                + "música tecno. Este disco resulta ser un éxito de ventas\n"
                + "y   reciben   una   invitación   al   Festival   Internacional   de\n"
                + "Vinia del Mar de febrero de 1994.");
        java.sql.Date fll = new java.sql.Date(1987 - 1899, 2 - 12, 14 - 31);
        ll.setFechaNacimiento(fll);
        ll.setImagen("la_ley.jpg");
        ll.setLinkWeb("www.lasleyesdenewton.com");
        ll.setNickname("la_ley");
        ll.setNombre("La");
        Artista pi = new Artista();
        pi.setApellido("Pimpinela");
        pi.setBiografia(" ");
        pi.setCorreo("lospimpi@gmail.com");
        pi.setDescripcion("Pimpinela es un dúo musical argentino compuesto por\n"
                + "los hermanos Lucía Galán y Joaquín Galán. Pimpinela\n"
                + "ha editado veinticuatro discos");
        java.sql.Date fpi = new java.sql.Date(1981 - 1899, 8 - 12, 13 - 31);
        pi.setFechaNacimiento(fpi);
        pi.setImagen("lospimpi.jpg");
        pi.setLinkWeb("www.pimpinela.net");
        pi.setNickname("lospimpi");
        pi.setNombre("Pimpinela");
        Artista dy = new Artista();
        dy.setApellido("Ango");
        dy.setBiografia(" ");
        dy.setCorreo("dyangounchained@gmail.com");
        dy.setDescripcion("José   Gómez   Romero,   conocido   artísticamente   como\n"
                + "Dyango es un cantante espaniol de música romántica.");
        java.sql.Date fdy = new java.sql.Date(1981 - 1899, 8 - 12, 13 - 31);
        dy.setFechaNacimiento(fdy);
        dy.setImagen("dyangounchained.jpg");
        dy.setLinkWeb(" ");
        dy.setNickname("dyangounchained");
        dy.setNombre("Dyango");
        Artista al = new Artista();
        al.setApellido("Violeta");
        al.setBiografia(" ");
        al.setCorreo("alcides@tuta.io");
        al.setDescripcion("Su   carrera   comienza   en   1976   cuando   forma   la   banda\n"
                + "Los   Playeros   junto   a   su   hermano   Víctor.   Al   poco\n"
                + "tiempo   se   mudan   a   San   Luis   donde   comienzan   a\n"
                + "hacerse conocidos en la escena musical. Su éxito a nivel\n"
                + "nacional   llega   a   comienzos   de   los   anios   1990   cuando\n"
                + "desembarca en Buenos Aires y graba el éxito \"Violeta\",\n"
                + "originalmente compuesta e interpretada en 1985 por el\n"
                + "músico brasilenio Luiz Caldas bajo el título «Fricote»");
        java.sql.Date fal = new java.sql.Date(1952 - 1899, 7 - 12, 17 - 31);
        al.setFechaNacimiento(fal);
        al.setImagen("alcides.jpg");
        al.setLinkWeb(" ");
        al.setNickname("alcides");
        al.setNombre("Alcides");
        vp.setPasswd("asdfg456");
        dm.setPasswd("123rtgfdv");
        cl.setPasswd("poiuy086");
        bs.setPasswd("GTO468");
        tn.setPasswd("HGF135");
        ll.setPasswd("lkj65D");
        pi.setPasswd("jhvf395");
        dy.setPasswd("ijngr024");
        al.setPasswd("987mnbgh");
        List<String> expResult = new ArrayList<String>();
        expResult.add(vp.getNickname());
        expResult.add(dm.getNickname());
        expResult.add(cl.getNickname());
        expResult.add(bs.getNickname());
        expResult.add(tn.getNickname());
        expResult.add(ll.getNickname());
        expResult.add(pi.getNickname());
        expResult.add(dy.getNickname());
        expResult.add(al.getNickname());
        List<String> nickResult = new ArrayList<String>();
        List<DtArtista> result = instance.getArtistas();
        for (DtArtista i : result) {
            nickResult.add(i.getNickname());
        }
        assertEquals(expResult, nickResult);
        // TODO review the generated test code and remove the default call to fail.

    }

    /**
     * Test of existeUsuario method, of class crlUsuarios.
     */
    @Test
    public void testExisteUsuario() {
        System.out.println("existeUsuario");
        String nickname = "vpeople";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = true;
        boolean result = instance.existeUsuario(nickname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

        @Test
    public void testExisteUsuario2() {
        System.out.println("existeUsuario");
        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = true;
        boolean result = instance.existeUsuario(nickname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
    
    @Test
    public void testExisteUsuario3() {
        System.out.println("existeUsuario");
        String nickname = "    ";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = false;
        boolean result = instance.existeUsuario(nickname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
    /**
     * // * Test of existeArtista method, of class crlUsuarios. //
     */
    @Test
    public void testExisteArtista() {
        System.out.println("existeArtista");
        String nickname = "dmode";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = true;
        boolean result = instance.existeArtista(nickname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
    
    @Test
    public void testExisteArtista2() {
        System.out.println("existeArtista");
        String nickname = "    ";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = false;
        boolean result = instance.existeArtista(nickname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of existeEspectador method, of class crlUsuarios.
//     */
//    @Test

    public void testExisteEspectador() {
        System.out.println("existeEspectador");
        String nickname = "chino";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = true;
        boolean result = instance.existeEspectador(nickname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
    
        public void testExisteEspectador2() {
        System.out.println("existeEspectador");
        String nickname = "   ";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = false;
        boolean result = instance.existeEspectador(nickname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

    /**
     * Test of altaArtista method, of class crlUsuarios.
     */
    @Test
    public void testAltaArtista() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtArtista modelo = em.createNamedQuery("ArtistaporNick",Artista.class).setParameter("nickname", "vpeople").getSingleResult().getMyDt();
        em.close();
        emf.close();
        DtArtista nuevo = new DtArtista(modelo.getLinkWeb(),modelo.getBiografia(),modelo.getDescripcion(),modelo.getId(),modelo.getNombre(),modelo.getApellido(),modelo.getCorreo(),"test",modelo.getImagen(),modelo.getFechaNacimiento(),modelo.getPass());
        crlUsuarios cu = new crlUsuarios();
        cu.altaArtista(nuevo);
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        em2.getTransaction().begin();
        Artista a = em2.createNamedQuery("ArtistaporNick",Artista.class).setParameter("nickname", "test").getSingleResult();
        String result = a.getNickname();
        em2.remove(a);
        em2.getTransaction().commit();
        em2.close();
        emf2.close();
        assertEquals("test", result);
    }

    /**
     * Test of altaEspectador method, of class crlUsuarios.
     */
    @Test
    public void testAltaEspectador() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtEspectador modelo = em.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "costas").getSingleResult().getMyDt();
        em.close();
        emf.close();
        DtEspectador nuevo = new DtEspectador(modelo.getCanjeables(),modelo.getId(),modelo.getNombre(),modelo.getApellido(),modelo.getCorreo(),"test",modelo.getImagen(),modelo.getFechaNacimiento(),modelo.getPass());
        crlUsuarios cu = new crlUsuarios();
        cu.altaEspectador(nuevo);
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        em2.getTransaction().begin();
        Espectador a = em2.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "test").getSingleResult();
        String result = a.getNickname();
        em2.remove(a);
        em2.getTransaction().commit();
        em2.close();
        emf2.close();
        assertEquals("test", result);
    }
//
//    /**
//     * Test of modificarArtista method, of class crlUsuarios.
//     */
    @Test
    public void testModificarArtista() {
        System.out.println("modificarArtista");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtArtista modelo = em.createNamedQuery("ArtistaporNick",Artista.class).setParameter("nickname", "vpeople").getSingleResult().getMyDt();
        em.close();
        emf.close();
        DtArtista nuevo = new DtArtista(modelo.getLinkWeb(),modelo.getBiografia(),modelo.getDescripcion(),modelo.getId(),modelo.getNombre(),modelo.getApellido(),modelo.getCorreo(),"test",modelo.getImagen(),modelo.getFechaNacimiento(),modelo.getPass());
        crlUsuarios cu = new crlUsuarios();
        cu.altaArtista(nuevo);//ingreso artista para modificaciones 
        DtArtista modificado = new DtArtista("www.test.com","test bio","test desc",modelo.getId(),modelo.getNombre(),modelo.getApellido(),"test corr","test","path",modelo.getFechaNacimiento(),"pass");
        cu.modificarArtista(modificado);
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        em2.getTransaction().begin();
        Artista a = em2.createNamedQuery("ArtistaporNick",Artista.class).setParameter("nickname", "test").getSingleResult();
        em2.remove(a);
        em2.getTransaction().commit();
        em2.close();
        emf2.close();
    }
//
//    /**
//     * Test of modificarEspectador method, of class crlUsuarios.
//     */
    @Test
    public void testModificarEspectador() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtEspectador modelo = em.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "costas").getSingleResult().getMyDt();
        em.close();
        emf.close();
        DtEspectador nuevo = new DtEspectador(modelo.getCanjeables(),modelo.getId(),modelo.getNombre(),modelo.getApellido(),modelo.getCorreo(),"test",modelo.getImagen(),modelo.getFechaNacimiento(),modelo.getPass());
        crlUsuarios cu = new crlUsuarios();
        cu.altaEspectador(nuevo);//ingreso espectador para modificaciones 
        DtEspectador modificado = new DtEspectador(modelo.getCanjeables(),modelo.getId(),"testNombre","testApell","testCorr","test","testImg",modelo.getFechaNacimiento(),"testPass");
        cu.modificarEspectador(modificado);
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        em2.getTransaction().begin();
        Espectador a = em2.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "test").getSingleResult();
        em2.remove(a);
        em2.getTransaction().commit();
        em2.close();
        emf2.close();
    }
//
//    /**
//     * Test of getNoRegistrados method, of class crlUsuarios.
//     */
    @Test
    public void testGetNoRegistrados() {
        System.out.println("getNoRegistrados");
        String nombreFuncion = "Bien de Familia - B";
        Espectador co = new Espectador("costas", "Gerardo", "Costas", "gcostas@gmail.com", 15, 11, 1983);
        Espectador ew = new Espectador("waston", "Emma", "Watson", "e.watson@gmail.com", 15, 4, 1990);
        Espectador gh = new Espectador("house", "Gregory", "House", "greghouse@gmail.com", 15, 5, 1959);
        Espectador sp = new Espectador("sergiop", "Sergio", "Puglia", "puglia@alpanpan.com.uy", 28, 1, 1959);
        Espectador ar = new Espectador("chino", "Alvaro", "Recoba", "chino@trico.org.uy", 17, 3, 1976);
        Espectador ap = new Espectador("tonyp", "Antonio", "Pacheco", "eltony@manya.org.uy", 14, 2, 1955);
        Espectador ml = new Espectador("lachiqui", "Mirtha", "Legrand", "lachiqui@hotmail.com.ar", 23, 2, 1927);
        co.setPasswd("poke579");
        co.setImagen("silueta.jpg");
        ew.setPasswd("mkji648");
        ew.setImagen(ew.getNickname() + ".jpg");
        gh.setPasswd("fcku0123");
        gh.setImagen(gh.getNickname() + ".jpg");
        sp.setPasswd("vbmn4r");
        sp.setImagen(sp.getNickname() + ".jpg");
        ar.setPasswd("ncnl123");
        ar.setImagen(ar.getNickname() + ".jpg");
        ap.setPasswd("mny101");
        ap.setImagen(ap.getNickname() + ".jpg");
        ml.setPasswd("1o1vbm");
        ml.setImagen("silueta.jpg");

        List<String> expResult = new ArrayList<String>();

        expResult.add(co.getNickname());
        expResult.add(ew.getNickname());
        expResult.add(gh.getNickname());
        expResult.add(sp.getNickname());
        expResult.add(ar.getNickname());
        expResult.add(ap.getNickname());
        expResult.add(ml.getNickname());

        crlUsuarios instance = new crlUsuarios();
        List<DtEspectador> result = instance.getNoRegistrados(nombreFuncion);

        List<String> resultado = new ArrayList<String>();
        for (DtEspectador i : result) {
            resultado.add(i.getNickname());
        }
        assertEquals(expResult, resultado);
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of getCanjeables method, of class crlUsuarios.
//     */

    @Test
    public void testGetCanjeables() {
        System.out.println("getCanjeables");
        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();
        int expResult = 2;
        int result = instance.getCanjeables(nickname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of listarCanjeables method, of class crlUsuarios.
//     */

    @Test
    public void testListarCanjeables() {
        System.out.println("listarCanjeables");
        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Springsteen on Broadway - iii");
        expResult.add("Bien de Familia - C");
        List<DtRegistro> result = instance.listarCanjeables(nickname);
        List<String> nameResult = new ArrayList<String>();
        for (DtRegistro i : result) {
            nameResult.add(i.getNombreFuncion());
        }
        assertEquals(expResult, nameResult);
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of canjearRegistros method, of class crlUsuarios.
//     */
    @Test
    public void testCanjearRegistros() {
        System.out.println("canjearRegistros");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtEspectador modelo = em.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "costas").getSingleResult().getMyDt();
        em.close();
        emf.close();
        DtEspectador nuevo = new DtEspectador(modelo.getCanjeables(),modelo.getId(),modelo.getNombre(),modelo.getApellido(),modelo.getCorreo(),"test",modelo.getImagen(),modelo.getFechaNacimiento(),modelo.getPass());
        crlUsuarios cu = new crlUsuarios();
        cu.altaEspectador(nuevo);
        cu.registrarUsuario("test", "Bien de Familia - B", 500, 8, 10, 2021);
        cu.registrarUsuario("test", "Bien de Familia - C", 500, 8, 10, 2021);
        cu.registrarUsuario("test", "30 anios - 3", 450, 8, 10, 2021);
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        Espectador e = em2.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "test").getSingleResult();
        em2.close();
        emf2.close();
        List<String> canjeables = new ArrayList<String>();
        for(Registro i : e.getRegistros()){
            canjeables.add(i.getFuncion().getNombre());
        }
        cu.canjearRegistros(canjeables, "test", 0, "Springsteen on Broadway - iii", 8, 10, 2021);
        EntityManagerFactory emf3 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em3 = emf3.createEntityManager();
        Espectador e2 = em3.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "test").getSingleResult();
        em3.getTransaction().begin();
        for(Registro r:e2.getRegistros()){
            em3.remove(r);
        }
        em3.remove(e2);
        em3.getTransaction().commit();
        em3.close();
        emf3.close();
    }
//
//    /**
//     * Test of registrarUsuario method, of class crlUsuarios.
//     */
    @Test
    public void testRegistrarUsuario() {
        System.out.println("registrarUsuario");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        DtEspectador modelo = em.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "costas").getSingleResult().getMyDt();
        em.close();
        emf.close();
        DtEspectador nuevo = new DtEspectador(modelo.getCanjeables(),modelo.getId(),modelo.getNombre(),modelo.getApellido(),modelo.getCorreo(),"test",modelo.getImagen(),modelo.getFechaNacimiento(),modelo.getPass());
        crlUsuarios cu = new crlUsuarios();
        cu.altaEspectador(nuevo);
        cu.registrarUsuario("test", "Bien de Familia - B", 500, 8, 10, 2021);
        EntityManagerFactory emf2 = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em2 = emf2.createEntityManager();
        em2.getTransaction().begin();
        Espectador e = em2.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", "test").getSingleResult();
        em2.remove(e.getRegistros().get(0));
        em2.remove(e);
        em2.getTransaction().commit();
        em2.close();
        emf2.close();
        
    }
//
//    /**
//     * Test of getDatosEspectador method, of class crlUsuarios.
//     */

    @Test
    public void testGetDatosEspectador() {
        System.out.println("getDatosEspectador");
        Espectador co = new Espectador("costas", "Gerardo", "Costas", "gcostas@gmail.com", 15, 11, 1983);
        co.setPasswd("poke579");
        co.setImagen("silueta.jpg");

        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();

        DtEspectador result = instance.getDatosEspectador(nickname);
        assertEquals(co.getCorreo(), result.getCorreo());
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of getDatosArtista method, of class crlUsuarios.
//     */

    @Test
    public void testGetDatosArtista() {
        System.out.println("getDatosArtista");
        String nickname = "vpeople";
        crlUsuarios instance = new crlUsuarios();

        String expResult = "vpeople@tuta.io";
        DtArtista result = instance.getDatosArtista(nickname);
        assertEquals(expResult, result.getCorreo());
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of getRegistros method, of class crlUsuarios.
//     */

    @Test
    public void testGetRegistros() {
        System.out.println("getRegistros");
        String nickname = "house";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Global Spirit (II)");
        expResult.add("Memphis Blues World - B");
        expResult.add("Springsteen on Broadway - ii");
        expResult.add("Bien de Familia - A");
        List<DtRegistro> result = instance.getRegistros(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtRegistro i : result) {
            namesResult.add(i.getNombreFuncion());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of getFuncionesRegistros method, of class crlUsuarios.
//     */

    @Test
    public void testGetFuncionesRegistros() {
        System.out.println("getFuncionesRegistros");
        String nickname = "house";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Global Spirit (II)");
        expResult.add("Memphis Blues World - B");
        expResult.add("Springsteen on Broadway - ii");
        expResult.add("Bien de Familia - A");
        List<DtFuncion> result = instance.getFuncionesRegistros(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtFuncion i : result) {
            namesResult.add(i.getNombre());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.

    }

//    /**
//     * Test of listarEspectaculosDeArtista method, of class crlUsuarios.
//     */
    @Test
    public void testListarEspectaculosDeArtista() {
        System.out.println("listarEspectaculosDeArtista");
        String nickname = "vpeople";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Los Village Volvieron");
        List<DtEspectaculo> result = instance.listarEspectaculosDeArtista(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtEspectaculo i : result) {
            namesResult.add(i.getNombre());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.

    }
//

    /**
     * Test of plataformaEspectaculosDeArtista method, of class crlUsuarios.
     */
    @Test
    public void testPlataformaEspectaculosDeArtista() {
        System.out.println("plataformaEspectaculosDeArtista");
        String nickname = "vpeople";
        String nombre = "Los Village Volvieron";
        crlUsuarios instance = new crlUsuarios();
        String expResult = "Instagram Live";
        DtPlataforma result = instance.plataformaEspectaculosDeArtista(nickname, nombre);
        assertEquals(expResult, result.getNombre());
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of listarFuncionesEspectaculosDeArtista method, of class crlUsuarios.
    //*/

    @Test
    public void testListarFuncionesEspectaculosDeArtista() {
        System.out.println("listarFuncionesEspectaculosDeArtista");
        String nickname = "vpeople";
        String nombre = "Los Village Volvieron";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        List<DtFuncion> result = instance.listarFuncionesEspectaculosDeArtista(nickname, nombre);
        List<String> namesResult = new ArrayList<String>();
        for (DtFuncion i : result) {
            namesResult.add(i.getNombre());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of listarPaquetesEspectaculosDeArtista method, of class crlUsuarios.
//     */

    @Test
    public void testListarPaquetesEspectaculosDeArtista() {
        System.out.println("listarPaquetesEspectaculosDeArtista");
        String nickname = "vpeople";
        String nombre = "Los Village Volvieron";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Paquete de Bandas");
        List<DtPaqueteDeEspectaculos> result = instance.listarPaquetesEspectaculosDeArtista(nickname, nombre);
        List<String> namesResult = new ArrayList<String>();
        for (DtPaqueteDeEspectaculos i : result) {
            namesResult.add(i.getNombre());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of existeCorreo method, of class crlUsuarios.
//     */

    @Test
    public void testExisteCorreo() {
        System.out.println("existeCorreo");
        String correo = "vpeople@tuta.io";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = true;
        boolean result = instance.existeCorreo(correo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
    
    @Test
    public void testExisteCorreo2() {
        System.out.println("existeCorreo");
        String correo = "gcostas@gmail.com";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = true;
        boolean result = instance.existeCorreo(correo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
//
//    /**
//     * Test of actualizarRegistros method, of class crlUsuarios.
//     */
    @Test
    public void testActualizarRegistros() {
        System.out.println("actualizarRegistros");
        crlUsuarios instance = new crlUsuarios();
        instance.actualizarRegistros();
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of getFuncionesNoRegistradas method, of class crlUsuarios.
//     */

    @Test
    public void testGetFuncionesNoRegistradas() {
        System.out.println("getFuncionesNoRegistradas");
        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Springsteen on Broadway - iii");
        expResult.add("Bien de Familia - C");
        List<DtFuncion> result = instance.getFuncionesNoRegistradas(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtFuncion i : result) {
            namesResult.add(i.getNombre());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of tienePaquetesParaEspectaculo method, of class crlUsuarios.
//     */
    @Test
    public void testTienePaquetesParaEspectaculo() {
        System.out.println("tienePaquetesParaEspectaculo");
         String nickname = "costas";
        String nombreEspectaculo = "Los Village Volvieron";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = false;
        boolean result = instance.tienePaquetesParaEspectaculo(nickname, nombreEspectaculo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
    @Test
    public void testTienePaquetesParaEspectaculo2() {
        System.out.println("tienePaquetesParaEspectaculo");
         String nickname = "costas";
        String nombreEspectaculo = "Bien de Familia";
        crlUsuarios instance = new crlUsuarios();
        boolean expResult = true;
        boolean result = instance.tienePaquetesParaEspectaculo(nickname, nombreEspectaculo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

//    /**
//     * Test of listarPaquetesParaEsp method, of class crlUsuarios.
//     */
    @Test
    public void testListarPaquetesParaEsp() {
        System.out.println("listarPaquetesParaEsp");
        String nickname = "costas";
        String nombreEspectaculo = "Los Village Volvieron";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        List<String> result = instance.listarPaquetesParaEsp(nickname, nombreEspectaculo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
    
    @Test
    public void testListarPaquetesParaEsp2() {
        System.out.println("listarPaquetesParaEsp");
        String nickname = "costas";
        String nombreEspectaculo = "Bien de Familia";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Paquete Latino");
        List<String> result = instance.listarPaquetesParaEsp(nickname, nombreEspectaculo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }
//
//    /**
//     * Test of getFuncionesRegistrosNoUsados method, of class crlUsuarios.
//     */
    @Test
    public void testGetFuncionesRegistrosNoUsados() {
        System.out.println("getFuncionesRegistrosNoUsados");
        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Springsteen on Broadway - iii");
        expResult.add("Bien de Familia - C");
        List<DtFuncion> result = instance.getFuncionesRegistrosNoUsados(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtFuncion i : result) {
            namesResult.add(i.getNombre());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
        @Test
    public void testGetFuncionesRegistrosNoUsados2() {
        System.out.println("getFuncionesRegistrosNoUsados");
        String nickname = "costas";
        List<String> expResult = new ArrayList<String>();
        expResult.add("Springsteen on Broadway - iii");
        expResult.add("Bien de Familia - C");
        List<DtFuncion> result = ManejadorUsuarios.getFuncionesRegistrosNoUsados(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtFuncion i : result) {
            namesResult.add(i.getNombre());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
//
//    /**
//     * Test of getUsuariosQueNoSiguesAr method, of class crlUsuarios.
//     */
    @Test
    public void testGetUsuariosQueNoSiguesAr() {
        System.out.println("getUsuariosQueNoSiguesAr");
        String nickname = "vpeople";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("dmode");
        expResult.add("clouper");
        expResult.add("tripleNelson");
        expResult.add("la_ley");
        expResult.add("lospimpi");
        expResult.add("dyangounchained");
        expResult.add("alcides");
        expResult.add("eleven11");
        expResult.add("costas");
        expResult.add("waston");
        expResult.add("house");
        expResult.add("sergiop");
        expResult.add("chino");
        expResult.add("tonyp");
        expResult.add("lachiqui");
        expResult.add("cbochinche");
        List<DtUsuario> result = instance.getUsuariosQueNoSiguesAr(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtUsuario i : result) {
            namesResult.add(i.getNickname());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
       
    }
//
//    /**
//     * Test of getUsuariosQueSiguesAr method, of class crlUsuarios.
//     */
    @Test
    public void testGetUsuariosQueSiguesAr() {
        System.out.println("getUsuariosQueSiguesAr");
        String nickname = "vpeople";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("bruceTheBoss");
        List<DtUsuario> result = instance.getUsuariosQueSiguesAr(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtUsuario i : result) {
            namesResult.add(i.getNickname());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
    @Test
    public void testGetUsuariosQueSiguesAr2() {
        System.out.println("getUsuariosQueSiguesAr");
        String nickname = "bruceTheBoss";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("vpeople");
        expResult.add("dmode");
        expResult.add("clouper");
        expResult.add("house");
        List<DtUsuario> result = instance.getUsuariosQueSiguesAr(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtUsuario i : result) {
            namesResult.add(i.getNickname());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
        
    }
//
//    /**
//     * Test of getUsuariosQueSiguesEs method, of class crlUsuarios.
//     */
    @Test
    public void testGetUsuariosQueSiguesEs() {
        System.out.println("getUsuariosQueSiguesEs");
        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("vpeople");
        expResult.add("dmode");
        expResult.add("clouper");
        expResult.add("bruceTheBoss");
        expResult.add("tripleNelson");
        expResult.add("la_ley");
        expResult.add("lospimpi");
        expResult.add("dyangounchained");
        expResult.add("alcides");
        
        
        List<DtUsuario> result = instance.getUsuariosQueSiguesEs(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtUsuario i : result) {
            namesResult.add(i.getNickname());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
    @Test
    public void testGetUsuariosQueSiguesEs2() {
        System.out.println("getUsuariosQueSiguesEs");
        String nickname = "waston";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("dmode");
        expResult.add("clouper");
        expResult.add("bruceTheBoss");
        expResult.add("house");      
        List<DtUsuario> result = instance.getUsuariosQueSiguesEs(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtUsuario i : result) {
            namesResult.add(i.getNickname());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
        
    }
//
//    /**
//     * Test of getUsuariosQueNoSiguesEs method, of class crlUsuarios.
//     */
    @Test
    public void testGetUsuariosQueNoSiguesEs() {
        System.out.println("getUsuariosQueNoSiguesEs");
        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("eleven11");        
        expResult.add("waston");
        expResult.add("house");
        expResult.add("sergiop");
        expResult.add("chino");
        expResult.add("tonyp");
        expResult.add("lachiqui");
        expResult.add("cbochinche");
        List<DtUsuario> result = instance.getUsuariosQueNoSiguesEs(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtUsuario i : result) {
            namesResult.add(i.getNickname());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    @Test
    public void testGetUsuariosQueNoSiguesEs2() {
        System.out.println("getUsuariosQueNoSiguesEs");
        String nickname = "sergiop";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("dmode");
        expResult.add("clouper");
        expResult.add("bruceTheBoss");
        expResult.add("tripleNelson");
        expResult.add("dyangounchained");
        expResult.add("alcides");
        expResult.add("eleven11"); 
        expResult.add("costas");
        expResult.add("waston");
        expResult.add("house");
        expResult.add("cbochinche");
        List<DtUsuario> result = instance.getUsuariosQueNoSiguesEs(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtUsuario i : result) {
            namesResult.add(i.getNickname());
        }
        assertEquals(expResult, namesResult);
        // TODO review the generated test code and remove the default call to fail.
        
    }
//
//    /**
//     * Test of seguirUsuarioEs method, of class crlUsuarios.
//     */
    @Test
    public void testSeguirUsuarioEs() {
        System.out.println("seguirUsuarioEs");
        String nickname = "costas";
        String seguido = "waston";
        crlUsuarios instance = new crlUsuarios();
        instance.seguirUsuarioEs(nickname, seguido);
        instance.dejarDeSeguirUsuarioEs(nickname, seguido);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of seguirUsuarioAr method, of class crlUsuarios.
//     */
    @Test
    public void testSeguirUsuarioAr() {
        System.out.println("seguirUsuarioAr");
        String nickname = "vpeople";
        String seguido = "dmode";
        crlUsuarios instance = new crlUsuarios();
        instance.seguirUsuarioAr(nickname, seguido);
        instance.dejarDeSeguirUsuarioAr(nickname, seguido);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testSeguirUsuarioAr2() {
        System.out.println("seguirUsuarioAr");
        String nickname = "vpeople";
        String seguido = "costas";
        crlUsuarios instance = new crlUsuarios();
        instance.seguirUsuarioAr(nickname, seguido);
        instance.dejarDeSeguirUsuarioAr(nickname, seguido);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of dejarDeSeguirUsuarioEs method, of class crlUsuarios.
//     */
    @Test
    public void testDejarDeSeguirUsuarioEs() {
        System.out.println("dejarDeSeguirUsuarioEs");
        String nickname = "costas";
        String seguido = "vpeople";
        crlUsuarios instance = new crlUsuarios();
        instance.dejarDeSeguirUsuarioEs(nickname, seguido);
        instance.seguirUsuarioEs(nickname, seguido);
        // TODO review the generated test code and remove the default call to fail.
    }
//
//    /**
//     * Test of dejarDeSeguirUsuarioAr method, of class crlUsuarios.
//     */
    @Test
    public void testDejarDeSeguirUsuarioAr() {
        System.out.println("dejarDeSeguirUsuarioAr");
        String nickname = "vpeople";
        String seguido = "bruceTheBoss";
        crlUsuarios instance = new crlUsuarios();
        instance.dejarDeSeguirUsuarioAr(nickname, seguido);
        instance.seguirUsuarioAr(nickname, seguido);
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testDejarDeSeguirUsuarioAr2() {
        System.out.println("dejarDeSeguirUsuarioAr");
        String nickname = "vpeople";
        String seguido = "costas";
        crlUsuarios instance = new crlUsuarios();
        instance.seguirUsuarioAr(nickname, seguido);
        instance.dejarDeSeguirUsuarioAr(nickname, seguido);
        // TODO review the generated test code and remove the default call to fail.
    }
//
    /**
     * Test of getPaquetesDelUsuario method, of class crlUsuarios.
     */
    @Test
    public void testGetPaquetesDelUsuario() {
        System.out.println("getPaquetesDelUsuario");
        String nickname = "costas";
        crlUsuarios instance = new crlUsuarios();
        List<String> expResult = new ArrayList<String>();
        expResult.add("Paquete Latino");
        List<DtPaqueteDeEspectaculos> result = instance.getPaquetesDelUsuario(nickname);
        List<String> namesResult = new ArrayList<String>();
        for (DtPaqueteDeEspectaculos i : result) {
            namesResult.add(i.getNombre());
        }
        assertEquals(expResult, namesResult);
        
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
//    /**
//     * Test of comprarPaquete method, of class crlUsuarios.
//     */
    @Test
    public void testComprarPaquete() {
        System.out.println("comprarPaquete");
        String nickname = "cbochinche";
        String nombrePaq = "Paquete Latino";
        crlUsuarios instance = new crlUsuarios();
        instance.comprarPaquete(nickname, nombrePaq);
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Espectador e = em.createNamedQuery("EspectadorporNick",Espectador.class).setParameter("nickname", nickname).getSingleResult();
        for (Compra i: e.getCompras()){
            em.remove(i);
        }
        em.getTransaction().commit();
        em.close();
        emf.close();
        
        // TODO review the generated test code and remove the default call to fail.
    }
    
    @Test
    public void testgetUsuariosQueTeSiguenEs(){
        String nickname = "house";
        List<String> resEsp = new ArrayList<String>();
        resEsp.add("bruceTheBoss");
        resEsp.add("waston");
        crlUsuarios cu = new crlUsuarios();
        List<DtUsuario> res = cu.getUsuariosQueTeSiguenEs(nickname);
        List<String> resultado = new ArrayList<String>();
        for(DtUsuario u: res){
            resultado.add(u.getNickname());
        }
        assertEquals(resEsp, resultado);
    }
    
    @Test
    public void testgetUsuariosQueTeSiguenAr(){
        String nickname = "vpeople";
        List<String> resEsp = new ArrayList<String>();
        resEsp.add("clouper");
        resEsp.add("bruceTheBoss");
        resEsp.add("costas");
        resEsp.add("sergiop");
        crlUsuarios cu = new crlUsuarios();
        List<DtUsuario> res = cu.getUsuariosQueTeSiguenAr(nickname);
        List<String> resultado = new ArrayList<String>();
        for(DtUsuario u: res){
            resultado.add(u.getNickname());
        }
        assertEquals(resEsp, resultado);
    }

//    
}

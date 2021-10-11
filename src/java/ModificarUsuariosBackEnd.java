
import java.awt.Image;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import root.datatypes.DtArtista;
import root.datatypes.DtEspectador;
import root.fabrica.Fabrica;
import root.interfaces.iUsuarios;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author tecnologo
 */
@WebServlet(urlPatterns = {"/ModificarUsuariosBackEnd"})
@MultipartConfig()
public class ModificarUsuariosBackEnd extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        iUsuarios iu = Fabrica.getCrlUsuarios();
        ServletContext contexto = getServletContext();

        if ("Espectador".equals(contexto.getAttribute("tipoUsuario").toString())) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String pass = request.getParameter("contrasenia");
            String nickname = contexto.getAttribute("nickname").toString();

//            String ruta=request.getParameter("imagen");
//            Path origen = Paths.get(request.getParameter("imagen"));
//            Path destino = Paths.get(request.getParameter("nickname")+".jpg");
//            try {
//                Files.copy(origen, destino, StandardCopyOption.REPLACE_EXISTING);
//            } catch (IOException ex){
//                Logger.getLogger(request.getParameter("nickname")).log(Level.SEVERE, null, ex);
//            }
//            ruta = destino.toString();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsed = null;
            try {
                parsed = sdf.parse(request.getParameter("fecha"));
            } catch (ParseException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            java.sql.Date fecha = new java.sql.Date(parsed.getTime());
            // Date fecha = new Date(1,1,1);
            String imagen = "silueta.jpg";
            if (request.getParameter("subir") != null) {
                Part archivo = request.getPart("imagen"); //llamada al parámetro foto de mi formulario.
                String context = "/home/" + System.getProperty("user.name") + "/coronaticketsUyWebApp/web/IMAGENES_USUARIOS"; //img es la carpeta que he creado en mi proyecto, dentro de la carpeta Web Content.

                String foto = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();

                archivo.write(context + File.separator + nickname.replaceAll("\\s+", "") + foto); // Escribimos el archivo al disco duro del servidor.

                imagen = "IMAGENES_USUARIOS" + File.separator + nickname.replaceAll("\\s+", "") + foto;
                //AQUI SE DEBERIA HABER SUBIDO LA IMAGEN
            }
            long id = 0;
            int canjeables = 0;
            DtEspectador es = null;
            DtEspectador esNew = null;
            List<DtEspectador> le = iu.getEspectadores();
            
            for (DtEspectador i : le) {
                if (i.getNickname().equals(nickname)) {
                    es = i;
                }
            }

                esNew = new DtEspectador(es.getCanjeables(), es.getId(), nombre, apellido, es.getCorreo(), es.getNickname(), imagen, fecha, pass);
                
            
            iu.modificarEspectador(esNew);

        } else if ("Artista".equals(contexto.getAttribute("tipoUsuario").toString())) {

            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String pass = request.getParameter("contrasenia");
            String nickname = contexto.getAttribute("nickname").toString();
            String descripcion = request.getParameter("descripcion");
            String biografia = request.getParameter("biografia");
            String linkWeb = request.getParameter("link");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsed = null;
            try {
                parsed = sdf.parse(request.getParameter("fecha"));
            } catch (ParseException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            java.sql.Date fecha = new java.sql.Date(parsed.getTime());

            //  Date fecha = new Date(1,1,1);
            String imagen = "silueta.jpg";
            if (request.getParameter("subir") != null) {
                Part archivo = request.getPart("imagen"); //llamada al parámetro foto de mi formulario.
                String context = "/home/" + System.getProperty("user.name") + "/coronaticketsUyWebApp/web/IMAGENES_USUARIOS"; //img es la carpeta que he creado en mi proyecto, dentro de la carpeta Web Content.

                String foto = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();

                archivo.write(context + File.separator + nickname.replaceAll("\\s+", "") + foto); // Escribimos el archivo al disco duro del servidor.

                imagen = "IMAGENES_USUARIOS" + File.separator + nickname.replaceAll("\\s+", "") + foto;
                //AQUI SE DEBERIA HABER SUBIDO LA IMAGEN
            }
            long id = 0;
            DtArtista ar = iu.getDatosArtista(nickname);
            DtArtista arNew = null;

                arNew = new DtArtista(linkWeb, biografia, descripcion, ar.getId(), nombre, apellido, ar.getCorreo(), ar.getNickname(), imagen, fecha, pass);

            
            iu.modificarArtista(arNew);
        }
        
        request.setAttribute("modificadoUs", true);
        RequestDispatcher dispatcher = contexto.getRequestDispatcher("/modificarUsuario.jsp");
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tecnologo
 */
import java.awt.Image;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
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

/**
 *
 * @author Tecnologo
 */
@WebServlet(urlPatterns = {"/AltaUsuariosBackEnd"})
@MultipartConfig()
public class AltaUsuariosBackEnd extends HttpServlet {

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
        if ("e".equals(request.getParameter("us"))) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String pass = request.getParameter("contrasenia");
            String nickname = request.getParameter("nickname");

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
            long id = 0;
            int canjeables = 0;
            DtEspectador es = null;

            if (request.getParameter("subir") != null) {
                Part archivo = request.getPart("upfile"); //llamada al parámetro foto de mi formulario.
                String context = "/home/" + System.getProperty("user.name") + "/coronaticketsUyWebApp/web/IMAGENES_USUARIOS"; //img es la carpeta que he creado en mi proyecto, dentro de la carpeta Web Content.

                String foto = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();

                archivo.write(context + File.separator + nickname.replaceAll("\\s+", "") + foto); // Escribimos el archivo al disco duro del servidor.

                imagen = "IMAGENES_ESPECTACULOS" + File.separator + nickname.replaceAll("\\s+", "") + foto;
                //AQUI SE DEBERIA HABER SUBIDO LA IMAGEN
            }
            es = new DtEspectador(canjeables, id, nombre, apellido, correo, nickname, imagen, fecha, pass);

            iu.altaEspectador(es);

        } else if ("a".equals(request.getParameter("us"))) {

            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String pass = request.getParameter("contrasenia");
            String nickname = request.getParameter("nickname");
            String fechaS = request.getParameter("fecha");
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
            long id = 0;
            DtArtista ar = null;
            if (request.getParameter("subir") != null) {
                Part archivo = request.getPart("upfile"); //llamada al parámetro foto de mi formulario.
                String context = "/home/" + System.getProperty("user.name") + "/coronaticketsUyWebApp/web/IMAGENES_USUARIOS"; //img es la carpeta que he creado en mi proyecto, dentro de la carpeta Web Content.

                String foto = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();

                archivo.write(context + File.separator + nickname.replaceAll("\\s+", "") + foto); // Escribimos el archivo al disco duro del servidor.

                imagen = "IMAGENES_ESPECTACULOS" + File.separator + nickname.replaceAll("\\s+", "") + foto;
                //AQUI SE DEBERIA HABER SUBIDO LA IMAGEN
            }
            ar = new DtArtista(linkWeb, biografia, descripcion, id, nombre, apellido, correo, nickname, imagen, fecha, pass);

            iu.altaArtista(ar);
        }

        ServletContext contexto = getServletContext();
        request.setAttribute("creadoUs", true);
        RequestDispatcher dispatcher = contexto.getRequestDispatcher("/altaUsuario.jsp");
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

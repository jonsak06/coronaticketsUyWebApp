/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import root.datatypes.DtArtista;
import root.datatypes.DtFuncion;
import root.fabrica.Fabrica;
import root.interfaces.IEspectaculos;
import root.interfaces.iUsuarios;

/**
 *
 * @author osiris
 */
@WebServlet(urlPatterns = {"/AltaFuncionBackEnd"})
@MultipartConfig()
public class AltaFuncionBackEnd extends HttpServlet {

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

        ServletContext contexto = getServletContext();

        String nombreEspec = request.getParameter("espectaculos");
        String nombre = request.getParameter("nombre");
        long id = 0;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsed = null;
        try {
            parsed = sdf.parse(request.getParameter("fecha"));
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
        java.sql.Date fecha = new java.sql.Date(parsed.getTime());

        SimpleDateFormat sdfH = new SimpleDateFormat("HH:mm");
        parsed = null;
        try {
            parsed = sdfH.parse(request.getParameter("hora"));
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
        Timestamp time = new Timestamp(parsed.getTime());

        List<DtArtista> listaArt = Fabrica.getCrlUsuarios().getArtistas();
        List<String> listaCon = new ArrayList();
        for (DtArtista i : listaArt) {
            if ((!i.getNickname().equals(contexto.getAttribute("nickname").toString()))
                    && (request.getParameter(i.getNickname()) != null)) {
                listaCon.add(i.getNickname());
            }
        }
        parsed = null;
        try {
            parsed = sdf.parse(request.getParameter("fechaA"));
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
        java.sql.Date fechaA = new java.sql.Date(parsed.getTime());
        String imagen = "silueta.jpg";
        if (request.getParameter("subir") != null) {
            Part archivo = request.getPart("Imagen"); //llamada al parámetro foto de mi formulario.
            String context = "/home/" + System.getProperty("user.name") + "/coronaticketsUyWebApp/web/IMAGENES_FUNCIONES"; //img es la carpeta que he creado en mi proyecto, dentro de la carpeta Web Content.

            String foto = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();

            archivo.write((context + File.separator + nombre + foto).replaceAll("\\s+", "")); // Escribimos el archivo al disco duro del servidor.

            imagen = (("IMAGENES_FUNCIONES" + File.separator + nombre + foto).replaceAll("\\s+", ""));
            //AQUI SE DEBERIA HABER SUBIDO LA IMAGEN
        }

        DtFuncion fun = new DtFuncion(Long.valueOf(id), nombre, time, fecha, fechaA);
        fun.setImagen(imagen);
        Fabrica.getCtrlEspectaculos().crearFuncion(nombreEspec, fun, listaCon);

        
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

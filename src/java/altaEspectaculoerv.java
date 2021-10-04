/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import root.datatypes.DtEspectaculo;
import root.fabrica.Fabrica;
import root.interfaces.IEspectaculos;

/**
 *
 * @author julio
 */
@WebServlet(urlPatterns = {"/altaEspectaculoerv"})
@MultipartConfig
public class altaEspectaculoerv extends HttpServlet {

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
            IEspectaculos ie = Fabrica.getCtrlEspectaculos();
            if(ie.existeEspectaculo(request.getParameter("nombreEsp"))){
            ServletContext contexto = getServletContext();
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/yaExisteEspectaculo.jsp");
            dispatcher.forward(request, response);
            }else{
            ServletContext contexto = getServletContext();
            List<String> categorias = ie.listarCategorias();
            List<String> catDelEsp = new ArrayList<String>();
            int i = 1;
            while(i<categorias.size()){
                if(request.getParameter(i+"")!=null){
                    catDelEsp.add(categorias.get(i-1));
                }
                i++;
            }
            java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());

            long o = 0;
                DtEspectaculo esp = new DtEspectaculo(o,request.getParameter("nombreEsp"),request.getParameter("descripcion"),Integer.parseInt(request.getParameter("duracion")),Integer.parseInt(request.getParameter("cantMax")),Integer.parseInt(request.getParameter("cantMin")),request.getParameter("url"),Float.parseFloat(request.getParameter("costo")), (java.sql.Date) date);
                //  AQUI LOS PASOS PARA SUBIR LA IMAGEN DESDE LA MAQUINA DEL USUARIO
                String fotoName ="";
                if(request.getParameter("upfile")!=null){
                Part archivo = request.getPart("upfile"); //llamada al parámetro foto de mi formulario.
                String context = request.getServletContext().getRealPath("/IMAGENES_ESPECTACULOS"); //img es la carpeta que he creado en mi proyecto, dentro de la carpeta Web Content.

                String foto = Paths.get(archivo.getSubmittedFileName()).getFileName().toString(); 


                archivo.write(context + File.separator + foto); // Escribimos el archivo al disco duro del servidor.

                fotoName = "IMAGENES_ESPECTACULOS" + File.separator + foto;
                //AQUI SE DEBERIA HABER SUBIDO LA IMAGEN
                }
                ie.altaEspectaculo(request.getParameter("plataforma"), contexto.getAttribute("nickname").toString(), catDelEsp, esp, fotoName);

                RequestDispatcher dispatcher = contexto.getRequestDispatcher("/espectaculoIngresado.jsp");
            dispatcher.forward(request, response);
            }
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

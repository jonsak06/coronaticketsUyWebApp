/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtPaqueteDeEspectaculos;
import root.fabrica.Fabrica;
import root.interfaces.IEspectaculos;

/**
 *
 * @author julio
 */
@WebServlet(urlPatterns = {"/filtrarBusqueda"})
public class filtrarBusqueda extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            ServletContext contexto = getServletContext();
            String filtro = request.getParameter("filtro");
            List<DtEspectaculo> dvEsps = (List<DtEspectaculo>) contexto.getAttribute("dvEsps");
            List<DtEspectaculo> dvEspsFiltrados = new ArrayList();
            List<String> espsFiltrados = new ArrayList();
            
            List<DtPaqueteDeEspectaculos> dvPaqs = (List<DtPaqueteDeEspectaculos>) contexto.getAttribute("dvPaqs");
            List<DtPaqueteDeEspectaculos> dvPaqsFiltrados = new ArrayList();
            List<String> paqsFiltrados = new ArrayList();
            
            
            if (filtro.equals("Anio (descendente)")) {

                dvEsps.sort(new Comparator<DtEspectaculo>() {

                    @Override
                    public int compare(DtEspectaculo a, DtEspectaculo b) {
                        if (a.getFechaDeRegistro().getTime() <= b.getFechaDeRegistro().getTime()) {
                            return 1;
                        } else {
                            return -1;
                        }
                    }

                });
                for (DtEspectaculo e : dvEsps) {
                    espsFiltrados.add(e.getNombre());
                }

                dvPaqs.sort(new Comparator<DtPaqueteDeEspectaculos>() {

                    @Override
                    public int compare(DtPaqueteDeEspectaculos a, DtPaqueteDeEspectaculos b) {
                        if (a.getFechaAlta().getTime() <= b.getFechaAlta().getTime()) {
                            return 1;
                        } else {
                            return -1;
                        }
                    }

                });
                for (DtPaqueteDeEspectaculos e : dvPaqs) {
                    paqsFiltrados.add(e.getNombre());
                }
                contexto.setAttribute("espectaculos", espsFiltrados);
                contexto.setAttribute("paquetes", paqsFiltrados);
                
                contexto.getRequestDispatcher("/busquedaEspYPaq.jsp").forward(request, response);
            } else if(filtro.equals("Plataforma")) {
                List<String> instagram = new ArrayList();
                List<String> facebook = new ArrayList();
                List<String> twitter = new ArrayList();
                List<String> youtube = new ArrayList();
                
                for(DtEspectaculo e : dvEsps) {
                    if(e.getPlataforma().equals("Instagram Live")) {
                        instagram.add(e.getNombre());
                    } else if(e.getPlataforma().equals("Facebook Watch")) {
                        facebook.add(e.getNombre());
                    } else if(e.getPlataforma().equals("Twitter Live")) {
                        twitter.add(e.getNombre());
                    } else if(e.getPlataforma().equals("Youtube")) {
                        youtube.add(e.getNombre());
                    }
                }
                
                contexto.setAttribute("instagram", instagram);
                contexto.setAttribute("facebook", facebook);
                contexto.setAttribute("twitter", twitter);
                contexto.setAttribute("youtube", youtube);
                
                contexto.getRequestDispatcher("/filtradosPlataforma.jsp").forward(request, response);
            } else if(filtro.equals("Categoria")) {
                List<String> latinas = new ArrayList();
                List<String> solistas = new ArrayList();
                List<String> rockIngles = new ArrayList();
                List<String> tropical = new ArrayList();
                
                for(DtEspectaculo e : dvEsps) {
                    if(e.getCategorias().contains("Bandas Latinas")) {
                        latinas.add(e.getNombre());
                    } 
                    if(e.getCategorias().contains("Solistas")) {
                        solistas.add(e.getNombre());
                    } 
                    if(e.getCategorias().contains("Rock en Ingles")) {
                        rockIngles.add(e.getNombre());
                    } 
                    if(e.getCategorias().contains("Musica Tropical")) {
                        tropical.add(e.getNombre());
                    } 
                }
                
                contexto.setAttribute("latinas", latinas);
                contexto.setAttribute("solistas", solistas);
                contexto.setAttribute("rockIngles", rockIngles);
                contexto.setAttribute("tropical", tropical);
                
                contexto.getRequestDispatcher("/filtradosCategoria.jsp").forward(request, response);
            }
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

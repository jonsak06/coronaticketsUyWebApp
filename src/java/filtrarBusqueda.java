/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtPaqueteDeEspectaculos;

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
            
//            List<DtPaqueteDeEspectaculos> dvPaqs = (List<DtPaqueteDeEspectaculos>) contexto.getAttribute("dvPaqs");
            List<DtPaqueteDeEspectaculos> dvPaqsFiltrados = new ArrayList();
            List<String> paqsFiltrados = new ArrayList();
            
            if(filtro.equals("Anio (descendente)")) {
//                Boolean agregado = false;
//                for(DtEspectaculo e : dvEsps) {
//                    agregado = false;
//                    if(dvEspsFiltrados.isEmpty()) {
//                        dvEspsFiltrados.add(e);
//                    } else {
//                        for(int i=0; i<dvEspsFiltrados.size();++i) {
//                            if(e.getFechaDeRegistro().getTime() > dvEspsFiltrados.get(i).getFechaDeRegistro().getTime()) {
//                                dvEspsFiltrados.add(i-1,e);
//                                agregado = true;
//                            }
//                        } 
//                        if(agregado == false) {
//                            dvEspsFiltrados.add(e);
//                        }
//                    }       
//                }
//                for(DtEspectaculo e : dvEspsFiltrados) {
//                    espsFiltrados.add(e.getNombre());
//                }
                contexto.setAttribute("espectaculos", espsFiltrados);
                
                contexto.getRequestDispatcher("/busquedaEspYPaq.jsp").forward(request, response);
            } else if(filtro.equals("Plataforma")) {
                
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

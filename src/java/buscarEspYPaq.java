/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import root.datatypes.DtEspectaculo;
import root.fabrica.Fabrica;
import root.interfaces.IEspectaculos;
import root.interfaces.iPaquetes;

/**
 *
 * @author dexion
 */
@WebServlet(urlPatterns = {"/buscarEspYPaq"})
public class buscarEspYPaq extends HttpServlet {

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
            String busqueda = request.getParameter("buscar");
            iPaquetes ip = Fabrica.getCtrlPaquetes();
            IEspectaculos ie = Fabrica.getCtrlEspectaculos();
            List<String> paqs = ip.listarPaquetes();
            List<String> paqsFiltrados = new ArrayList();
            for(String p : paqs) {
                if(p.toLowerCase().contains(busqueda.toLowerCase())) {
                    paqsFiltrados.add(p);
                }
            }
            List<DtEspectaculo> dvEsps = ie.listarTodosLosEspectaculos();
            List<String> esps = new ArrayList();
            List<String> espsFiltrados = new ArrayList();
            for(DtEspectaculo e : dvEsps) {
                esps.add(e.getNombre());
            }
            for(String e : esps) {
                if(e.toLowerCase().contains(busqueda.toLowerCase())) {
                    espsFiltrados.add(e);
                }
            }
            if(busqueda.equals("")) {
                request.setAttribute("espectaculos", esps);
                request.setAttribute("paquetes", paqs);
            } else {
                request.setAttribute("paquetes", paqsFiltrados);
                request.setAttribute("espectaculos", espsFiltrados);
            }
            request.getRequestDispatcher("/busquedaEspYPaq.jsp").forward(request, response);
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

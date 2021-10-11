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
@WebServlet(urlPatterns = {"/listarEspecaculosNoIncluidos"})
public class listarEspecaculosNoIncluidos extends HttpServlet {

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
            String paquete = request.getParameter("paquete");
            String plataforma = request.getParameter("plataforma");
            iPaquetes ip = Fabrica.getCtrlPaquetes();
            IEspectaculos ie = Fabrica.getCtrlEspectaculos();
//            List<DtEspectaculo> esp = ie.listarEspectaculos(plataforma);
//            List<String> esps = new ArrayList<String>();
//            for(DtEspectaculo i: esp ){
//            esps.add(i.getNombre());
//            }
            List<String> esps = ip.listarEspectaculosNoIncluidos(paquete, plataforma);
            List<String> espsAceptados = new ArrayList<String>();
            List<DtEspectaculo> aceptados = ie.listarAceptados();
            for(DtEspectaculo e : aceptados) {
                if(esps.contains(e.getNombre())) {
                    espsAceptados.add(e.getNombre());
                }
            }
            request.setAttribute("espectaculos", espsAceptados);
            request.getRequestDispatcher("/agregadoEspAPaq.jsp").forward(request, response);
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

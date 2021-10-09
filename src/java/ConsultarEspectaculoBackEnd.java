/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tecnologo
 */
@WebServlet(urlPatterns = {"/ConsultarEspectaculoBackEnd"})
public class ConsultarEspectaculoBackEnd extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
              ServletContext contexto = getServletContext();
            if (request.getParameter("paquete") != null) {
                if (!request.getParameter("paquete").equals("Paquetes...")) {
                    contexto.setAttribute("PaqueteSeleccionadoEnConsultarEspectaculo", request.getParameter("paquete"));
                }
            }else if (request.getParameter("funcion") != null) {
                if (!request.getParameter("funcion").equals("Funciones...")) {
                    contexto.setAttribute("FuncionSeleccionadaEnConsultarEspectaculo", request.getParameter("funcion"));
                }
            }else if (request.getParameter("espectaculo") != null) {
                if (!request.getParameter("espectaculo").equals("Espectaculos...")) {
                    contexto.setAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo", request.getParameter("espectaculo"));
                    contexto.setAttribute("PaqueteSeleccionadoEnConsultarEspectaculo", "Paquetes...");
                    contexto.setAttribute("FuncionSeleccionadaEnConsultarEspectaculo", "Funciones...");
                }
            }
            else if (request.getParameter("plataforma") != null) {
                if (!request.getParameter("plataforma").equals("Seleccione...")) {
                    contexto.setAttribute("PlataformaSeleccionadaEnConsultarEspectaculo", request.getParameter("plataforma"));
                    
                    contexto.setAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo", "Espectaculos...");
                    contexto.setAttribute("PaqueteSeleccionadoEnConsultarEspectaculo", "Paquetes...");
                    contexto.setAttribute("FuncionSeleccionadaEnConsultarEspectaculo", "Funciones...");
                }
            }
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/consultarEspectaculo.jsp");
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

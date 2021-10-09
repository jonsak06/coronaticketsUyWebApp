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
@WebServlet(urlPatterns = {"/consultarUsuariosBackEnd"})
public class consultarUsuariosBackEnd extends HttpServlet {

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
                    contexto.setAttribute("PaqueteSeleccionadoEnConsultarUsuario", request.getParameter("paquete"));
                }
            }else if (request.getParameter("funcion") != null) {
                if (!request.getParameter("funcion").equals("Funciones...")) {
                    contexto.setAttribute("FuncionSeleccionadaEnConsultarUsuario", request.getParameter("funcion"));
                }
            }else if (request.getParameter("registro") != null) {
                if (!request.getParameter("registro").equals("Seleccione...")) {
                    contexto.setAttribute("RegistroSeleccionadaEnConsultarUsuario", request.getParameter("registro"));
                }
            }else if (request.getParameter("espectaculo") != null) {
                if (!request.getParameter("espectaculo").equals("Seleccione...")) {
                    contexto.setAttribute("EspectaculoSeleccionadpEnConsultarUsuario", request.getParameter("espectaculo"));
                    contexto.setAttribute("FuncionSeleccionadaEnConsultarUsuario", "Funciones...");
                    contexto.setAttribute("PaqueteSeleccionadoEnConsultarUsuario","Paquetes...");
                }
            }else if (request.getParameter("usuQueSiges") != null) {
                if (!request.getParameter("usuQueSiges").equals("Seleccione...")) {
                    contexto.setAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario", request.getParameter("usuQueSiges"));
                    
                }
            }
            else if (request.getParameter("usuario") != null) {
                if (!request.getParameter("usuario").equals("Seleccione...")) {
                    contexto.setAttribute("UsuarioSeleccionadaEnConsultarUsuario", request.getParameter("usuario"));
                    
                    contexto.setAttribute("EspectaculoSeleccionadpEnConsultarUsuario", "Seleccione...");
                    contexto.setAttribute("FuncionSeleccionadaEnConsultarUsuario", "Funciones...");
                    contexto.setAttribute("PaqueteSeleccionadoEnConsultarUsuario","Paquetes...");
                    
                    contexto.setAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario", "Seleccione...");
                    
                    
                    contexto.setAttribute("RegistroSeleccionadaEnConsultarUsuario","Seleccione...");
                }
            }
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/ConsultarUsuario.jsp");
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

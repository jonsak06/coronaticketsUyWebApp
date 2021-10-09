/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
 * @author osiris
 */
@WebServlet(urlPatterns = {"/ConsultarFuncionBackEnd"})
public class ConsultarFuncionBackEnd extends HttpServlet {

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
            if (request.getParameter("artista") != null) {
                if (!request.getParameter("artista").equals("Seleccione...")) {
                    contexto.setAttribute("ArtistaSeleccionadoEnConsultarFuncion", request.getParameter("artista"));
                }
            }else if (request.getParameter("funcion") != null) {
                if (!request.getParameter("funcion").equals("Seleccione...")) {
                    contexto.setAttribute("FuncionSeleccionadaEnConsultarFuncion", request.getParameter("funcion"));
                }
            }else if (request.getParameter("espectaculo") != null) {
                if (!request.getParameter("espectaculo").equals("Seleccione...")) {
                    contexto.setAttribute("EspectaculoSeleccionadpEnConsultarFuncion", request.getParameter("espectaculo"));
                }
            }
            else if (request.getParameter("plataforma") != null) {
                if (!request.getParameter("plataforma").equals("Seleccione...")) {
                    contexto.setAttribute("PlataformaSeleccionadaEnConsultarFuncion", request.getParameter("plataforma"));
                }
            }
            
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/ConsultarFuncion.jsp");
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

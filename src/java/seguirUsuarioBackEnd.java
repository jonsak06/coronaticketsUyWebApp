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
import root.fabrica.Fabrica;

/**
 *
 * @author tecnologo
 */
@WebServlet(urlPatterns = {"/seguirUsuarioBackEnd"})
public class seguirUsuarioBackEnd extends HttpServlet {

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

        /* TODO output your page here. You may use following sample code. */
        ServletContext contexto = getServletContext();
        if (contexto.getAttribute("tipoUsuario").toString().equals("Espectador")) {
            String nickname = contexto.getAttribute("nickname").toString();
            String seguido = request.getParameter("seguido");
            Fabrica.getCrlUsuarios().seguirUsuarioEs(nickname, seguido);
        }
        if (contexto.getAttribute("tipoUsuario").toString().equals("Artista")) {
            String nickname = contexto.getAttribute("nickname").toString();
            String seguido = request.getParameter("seguido");
            Fabrica.getCrlUsuarios().seguirUsuarioAr(nickname, seguido);
        }
        request.setAttribute("seguidoUsu", true);
        RequestDispatcher dispatcher = contexto.getRequestDispatcher("/seguirUsuario.jsp");
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

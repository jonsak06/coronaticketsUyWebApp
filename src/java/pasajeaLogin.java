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
import root.interfaces.iUsuarios;

/**
 *
 * @author julio
 */
@WebServlet(urlPatterns = {"/pasajeaLogin"})
public class pasajeaLogin extends HttpServlet {

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
        iUsuarios iu = Fabrica.getCrlUsuarios();
        if (iu.existeUsuario(request.getParameter("nick")) == false) {
            ServletContext contexto = getServletContext();
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/WEB-INF/errorDeLogin.jsp");
            dispatcher.forward(request, response);
        } else if (iu.existeEspectador(request.getParameter("nick"))) {
            if (iu.getDatosEspectador(request.getParameter("nick")).getPass().equals(request.getParameter("pass"))) {

                ServletContext contexto = getServletContext();
                contexto.setAttribute("tipoUsuario", "Espectador");
                contexto.setAttribute("nickname", iu.getDatosEspectador(request.getParameter("nick")).getNickname());
                RequestDispatcher dispatcher = contexto.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);

            } else {
                ServletContext contexto = getServletContext();
                RequestDispatcher dispatcher = contexto.getRequestDispatcher("/WEB-INF/errorDeLogin.jsp");
                dispatcher.forward(request, response);
            }
        } else if (iu.existeArtista(request.getParameter("nick"))) {
            if (iu.getDatosArtista(request.getParameter("nick")).getPass().equals(request.getParameter("pass"))) {

                ServletContext contexto = getServletContext();
                contexto.setAttribute("tipoUsuario", "Artista");
                contexto.setAttribute("nickname", iu.getDatosArtista(request.getParameter("nick")).getNickname());
                RequestDispatcher dispatcher = contexto.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            } else {
                ServletContext contexto = getServletContext();
                RequestDispatcher dispatcher = contexto.getRequestDispatcher("/WEB-INF/errorDeLogin.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            ServletContext contexto = getServletContext();
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/WEB-INF/errorDeLogin.jsp");
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

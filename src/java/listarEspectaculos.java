/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import root.datatypes.DtEspectaculo;
import root.fabrica.Fabrica;
import root.interfaces.IEspectaculos;

/**
 *
 * @author julio
 */
@WebServlet(urlPatterns = {"/listarEspectaculos"})
public class listarEspectaculos extends HttpServlet {

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
            ServletContext contexto = getServletContext();
            IEspectaculos ie = Fabrica.getCtrlEspectaculos();
            if(ie.existePlataforma(request.getParameter("plataforma"))){
            request.setAttribute("plataforma", request.getParameter("plataforma"));
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/listadoPorPlat.jsp");
            dispatcher.forward(request, response);
            }else if(ie.existeCategoria(request.getParameter("plataforma"))){
            request.setAttribute("plataforma", request.getParameter("plataforma"));
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/listadoPorCat.jsp");
            dispatcher.forward(request, response);
            }else{
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/seleccionarPlatOCat.jsp");
            dispatcher.forward(request, response);
            }
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            ServletContext contexto = getServletContext();
//            RequestDispatcher dispatcher = contexto.getRequestDispatcher("listadoPorPlat.jsp");
//            dispatcher.forward(request, response);
//        }
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

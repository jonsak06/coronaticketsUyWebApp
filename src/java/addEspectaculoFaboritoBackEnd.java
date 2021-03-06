/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import root.datatypes.DtArtista;
import root.datatypes.DtEspectaculo;
import root.fabrica.Fabrica;

/**
 *
 * @author tecnologo
 */
@WebServlet(urlPatterns = {"/addEspectaculoFaboritoBackEnd"})
public class addEspectaculoFaboritoBackEnd extends HttpServlet {

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

            List<DtEspectaculo> listaEsp = Fabrica.getCrlUsuarios().getEspectaculosALosQueElEspectadorFueAUnaFuncion(contexto.getAttribute("nickname").toString());
            List<DtEspectaculo> listaEspFav = Fabrica.getCrlUsuarios().getEspectaculosFaboritos(contexto.getAttribute("nickname").toString());
            List<String> nombresEspNoFav = new ArrayList<String>();
            List<String> nombresEspFav = new ArrayList<String>();
            String nomEspec = request.getParameter("nombre");
            for (DtEspectaculo e : listaEspFav) {
                nombresEspFav.add(e.getNombre());
            }
            for (DtEspectaculo e : listaEsp) {
                if (!nombresEspFav.contains(e.getNombre())) {
                    nombresEspNoFav.add(e.getNombre());
                }
            }
            for(String e:nombresEspNoFav)
            {
                if(e.equals(nomEspec))
                {
                    Fabrica.getCrlUsuarios().addEspectaculoFavorito(contexto.getAttribute("nickname").toString(), e);
                }
            }
            for(String e:nombresEspFav)
            {
                if(e.equals(nomEspec))
                {
                    Fabrica.getCrlUsuarios().quitarEspectaculoFavorito(contexto.getAttribute("nickname").toString(), e);
                }
            }
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/addEspectaculoFaborito.jsp");
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

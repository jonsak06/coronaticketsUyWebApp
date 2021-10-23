/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
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
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

/**
 *
 * @author tecnologo
 */
@WebServlet(urlPatterns = {"/valorarEspectaculoBackEnd"})
public class valorarEspectaculoBackEnd extends HttpServlet {

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
            List<DtEspectaculo> listaEspVal = Fabrica.getCrlUsuarios().getEspectaculosValorados(contexto.getAttribute("nickname").toString());
            List<String> nombresEspNoVal = new ArrayList<String>();
            List<String> nombresEspVal = new ArrayList<String>();
            for (DtEspectaculo e : listaEspVal) {
                nombresEspVal.add(e.getNombre());
            }
            for (DtEspectaculo e : listaEsp) {
                if (!nombresEspVal.contains(e.getNombre())) {
                    nombresEspNoVal.add(e.getNombre());
                }
            }
            for (String e : nombresEspNoVal) {
                if ((request.getParameter(e) != null)) {
                    if (request.getParameter(e) != "") {
                        java.sql.Date fecha = new java.sql.Date(1, 1, 1);
                        int valor = parseInt(request.getParameter(e));
                        Fabrica.getCrlUsuarios().valorarEspectaculo(contexto.getAttribute("nickname").toString(), e, valor, fecha);
                        Fabrica.getCtrlEspectaculos().calcularValoracion(e);
                    }
                }
            }
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/valorarEspectaculo.jsp");
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

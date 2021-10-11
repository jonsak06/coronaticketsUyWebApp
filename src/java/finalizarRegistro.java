/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import root.datatypes.DtPaqueteDeEspectaculos;
import root.fabrica.Fabrica;
import root.interfaces.IEspectaculos;
import root.interfaces.iPaquetes;
import root.interfaces.iUsuarios;

/**
 *
 * @author julio
 */
@WebServlet(urlPatterns = {"/finalizarRegistro"})
public class finalizarRegistro extends HttpServlet {

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
        if(request.getParameter("confirmacionSi")!=null){
            iPaquetes ip = Fabrica.getCtrlPaquetes();
            IEspectaculos ie = Fabrica.getCtrlEspectaculos();
            int dia,mes,anio;

            Date date = new Date();
            LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            int year  = localDate.getYear();
            int month = localDate.getMonthValue();
            int day   = localDate.getDayOfMonth();

//            dia = fecha.getDate()-31;
//            mes = fecha.getMonth()-12;
//            anio = fecha.getYear()-1899;
            iUsuarios iu = Fabrica.getCrlUsuarios();
            float costo = 0;
            if(contexto.getAttribute("costo")!=null){
            costo = (float)contexto.getAttribute("costo");
            }else{
            costo = (float)ie.getCosto(contexto.getAttribute("funcion").toString());
            contexto.setAttribute("costo", ie.getCosto(contexto.getAttribute("funcion").toString()));
            }
            iu.registrarUsuario(contexto.getAttribute("nickname").toString(), contexto.getAttribute("funcion").toString(), costo, day, month, year);
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/registroRealizado.jsp");
            dispatcher.forward(request, response);
        }else{
        RequestDispatcher dispatcher = contexto.getRequestDispatcher("/index.jsp");
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

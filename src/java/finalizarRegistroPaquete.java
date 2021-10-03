/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import root.datatypes.DtEspectaculo;
import root.datatypes.DtPaqueteDeEspectaculos;
import root.fabrica.Fabrica;
import root.interfaces.IEspectaculos;
import root.interfaces.iPaquetes;
import root.interfaces.iUsuarios;

/**
 *
 * @author julio
 */
@WebServlet(urlPatterns = {"/finalizarRegistroPaquete"})
public class finalizarRegistroPaquete extends HttpServlet {

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
            iPaquetes ip = Fabrica.getCtrlPaquetes();
            DtPaqueteDeEspectaculos dtp = ip.mostrarInfoPaquete(request.getParameter("paquete"));
            IEspectaculos ie = Fabrica.getCtrlEspectaculos();
            float descuento = dtp.getDescuento();
//            int dia,mes,anio;
//            Date fecha = new Date();
//            dia = fecha.getDate()-31;
//            mes = fecha.getMonth()-12;
//            anio = fecha.getYear()-1899;
            Date date = new Date();
            LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            int year  = localDate.getYear();
            int month = localDate.getMonthValue();
            int day   = localDate.getDayOfMonth();
            iUsuarios iu = Fabrica.getCrlUsuarios();
            iu.registrarUsuario(contexto.getAttribute("nickname").toString(), contexto.getAttribute("funcion").toString(), (float) (ie.getCosto(contexto.getAttribute("funcion").toString())*(100-descuento)*0.01), day, month, year);
            contexto.setAttribute("costo", (float) (ie.getCosto(contexto.getAttribute("funcion").toString())*(100-descuento)*0.01));
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/registroRealizado.jsp");
            dispatcher.forward(request, response);
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet finalizarRegistroPaquete</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet finalizarRegistroPaquete at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
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

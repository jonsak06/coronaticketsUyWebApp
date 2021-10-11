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
import root.datatypes.DtRegistro;
import root.fabrica.Fabrica;
import root.interfaces.iUsuarios;

/**
 *
 * @author julio
 */
@WebServlet(urlPatterns = {"/finalizarRegistroCanje"})
public class finalizarRegistroCanje extends HttpServlet {

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
        iUsuarios iu = Fabrica.getCrlUsuarios();
        if(request.getParameter("confirmacionSi")!=null){
            List<String> canje = (ArrayList<String>) contexto.getAttribute("canje");
//            int dia,mes,anio;
//            Date fecha = new Date();
////            dia = fecha.getDate()-1899;
////            mes = fecha.getMonth()-12;
////            anio = fecha.getYear()-31;
            Date date = new Date();
            LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            int year  = localDate.getYear();
            int month = localDate.getMonthValue();
            int day   = localDate.getDayOfMonth();
            iu.canjearRegistros(canje, contexto.getAttribute("nickname").toString(),0,contexto.getAttribute("funcion").toString(), day, month, year);
            contexto.setAttribute("costo", 0);
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/registroRealizado.jsp");
            dispatcher.forward(request, response);
        }else /*if(request.getParameter("confirmacionNo")!=null)*/{
            contexto.removeAttribute("espectaculo");
            contexto.removeAttribute("funcion");
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
////            List<String> canje = new ArrayList<>();
////            int cantCanjeables = Integer.parseInt(contexto.getAttribute("cantCanjeables").toString());            
////            iUsuarios iu = Fabrica.getCrlUsuarios();
////            List<DtRegistro> canjeables = iu.listarCanjeables(contexto.getAttribute("nickname").toString());
////            int i = 1;
////            while(i<cantCanjeables+1){
////                if(request.getParameter(i+"")!=null){
////                    //out.println("<li>"+canjeables.get(i-1).getNombreFuncion()+"</li>");
////                    canje.add(canjeables.get(i-1).getNombreFuncion());
////                }
////                i++;
////            }
//            List<String> canje = (ArrayList<String>) contexto.getAttribute("canje");
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet finalizarRegistro</title>");            
//            out.println("</head>");
//            out.println("<body>");
//             out.println("<h1>Hola Putitos!!!</h1>");
//            for(String k : canje){
//            out.println("<p>Servlet finalizarRegistro at "+k+"</p>");
//            }
//            out.println("</body>");
//            out.println("</html>");
//        
//        }
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
import javax.servlet.http.HttpSession;
import root.datatypes.DtRegistro;
import root.fabrica.Fabrica;
import root.interfaces.iUsuarios;


/**
 *
 * @author julio
 */
@WebServlet(urlPatterns = {"/canjeyRegistro"})
public class canjeyRegistro extends HttpServlet {

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
        if(request.getParameter("continuar")!=null){
            iUsuarios iu = Fabrica.getCrlUsuarios();
            if(iu.tienePaquetesParaEspectaculo(contexto.getAttribute("nickname").toString(),contexto.getAttribute("espectaculo").toString())){
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/seleccionarPaquete.jsp");
            dispatcher.forward(request, response);
            }else{
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/confirmarRegistro.jsp");
            dispatcher.forward(request, response);
            }
        }else if(request.getParameter("realizarCanje")!=null){
        HttpSession sesion = request.getSession(false);
            int i = 0;
            int j = 0;
            while (i<= Integer.parseInt(contexto.getAttribute("cantCanjeables").toString()))
            {
                if(request.getParameter(i+"")!=null){
                j++;
                }
                i++;
            }
            if(j!=3){
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/cantidadDeCanjesInvalida.jsp");
            dispatcher.forward(request, response);
            }else{
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/confirmacionDeCanje.jsp");
            dispatcher.forward(request, response);
            }
        }else{
            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/confirmarRegistro.jsp");
            dispatcher.forward(request, response);
        }
//            RequestDispatcher dispatcher = contexto.getRequestDispatcher("/confirmacionDeCanje.jsp");
//            dispatcher.forward(request, response);
//        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            ServletContext contexto = getServletContext();
//            int cantCanjeables = Integer.parseInt(contexto.getAttribute("cantCanjeables").toString());
//            iUsuarios iu = Fabrica.getCrlUsuarios();
//            List<DtRegistro> canjeables = iu.listarCanjeables(contexto.getAttribute("nickname").toString());
//            int i = 1;
//            while(i<cantCanjeables+1){
//                if(request.getParameter(i+"")!=null){
//
//                    out.println("<li>"+canjeables.get(i-1).getNombreFuncion()+"</li>");
//                }
//                i++;
//            }
//            }
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

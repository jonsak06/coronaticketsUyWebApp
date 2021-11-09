/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.*;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.BaseColor;
import java.awt.Desktop;

/**
 *
 * @author tecnologo
 */
@WebServlet(urlPatterns = {"/ComprobatePDFBackEnd"})
public class ComprobatePDFBackEnd extends HttpServlet {

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
            throws ServletException, IOException, DocumentException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Se crea el documento
            String nombrePremio = request.getParameter("nombrePremio");
            String descripcion = request.getParameter("descripcion");
            String nombreEspectaculo = request.getParameter("nombreEspectaculo");
            String NombreFuncion = request.getParameter("NombreFuncion");
            String fecha = request.getParameter("fecha");

            Document documento = new Document();

// Se crea el OutputStream para el fichero donde queremos dejar el pdf.
            FileOutputStream ficheroPdf = new FileOutputStream("/home/tecnologo/coronaticketsUyWebApp/web/"+nombrePremio.replaceAll("\\s+", "")+".pdf");

// Se asocia el documento al OutputStream y se indica que el espaciado entre
// lineas sera de 20. Esta llamada debe hacerse antes de abrir el documento
            PdfWriter.getInstance(documento, ficheroPdf).setInitialLeading(20);

// Se abre el documento.
            documento.open();

            documento.add(new Paragraph("Comprobante del premio " + nombrePremio + " que es:" + descripcion + " y se sorteo de la funcion" + NombreFuncion + " del espectaculo " + nombreEspectaculo + " en la fecha" + fecha + ""));

            documento.close();
            
        }catch(IOException ex){
            
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
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(ComprobatePDFBackEnd.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(ComprobatePDFBackEnd.class.getName()).log(Level.SEVERE, null, ex);
        }
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

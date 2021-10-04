<%-- 
    Document   : consultaPaquetes
    Created on : Oct 1, 2021, 7:48:40 PM
    Author     : dexion
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.*"%>
<%@page import="root.datatypes.*"%>
<%@page import="root.fabrica.Fabrica"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de paquetes</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

        <style>
            .input-group {
                margin-top: 20px;
                width: 100%;
            }
            .custom-select {
                width: 90%;
            }
            .infoPaquete {
                margin-top: 20px;
                width: 25%;
            }
            .selectEsp{
                width: 100%;
                height: 100%;
            }
        </style>
    </head>
    <body>
    <%@include file="header.jsp" %>
    
    <form action="consultarPaquete" class="container">
        <div class="input-group">
            <select name="paquete" class="custom-select" id="inputGroupSelect04">
                <option selected>Seleccione...</option>
                <%
                    iPaquetes ip = Fabrica.getCtrlPaquetes();
                    List<String> paqs = ip.listarPaquetes();

                    for(String p : paqs){
                        out.println("<option>"+p+"</option>");
                    }
                %>
            </select>
            <div class="input-group-append">
                 <button class="btn btn-outline-secondary" type="submit" disabled>Consultar</button>
            </div>
        </div>
    </form>
    
    <div class="container infoPaquete">
        
        <% 
            String paq = request.getParameter("paquete");
            if(paq != "Seleccione..." && paq != null)
            {
                DtPaqueteDeEspectaculos dvPaq = ip.mostrarInfoPaquete(paq);
                List<String> esps = ip.listarEspectaculosIncluidos(paq);
                out.print("<div class='card' style='width: 18rem;'>");
                    out.print("<img src='"+dvPaq.getImagen()+"' class='card-img-top' alt='imagen del paquete'>");
                    out.print("<div class='card-body'>");
                    out.print("<h5 class='card-title'>"+paq+"</h5>");
                    out.print("<p class='card-text'>"+dvPaq.getDescripcion()+"</p>");
                    out.print("</div>");
                    out.print("<ul class='list-group list-group-flush'>");
                    out.print("<li class='list-group-item'>Fecha de inicio: "+dvPaq.getFechaInicio().toString()+"</li>");
                    out.print("<li class='list-group-item'>Fecha de fin: "+dvPaq.getFechaFin().toString()+"</li>");
                    out.print("<li class='list-group-item'>");
                    
                    out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04'>");
                    out.print("<option selected>Espectaculos...</option>");
                    for(String e : esps) {
                        out.println("<option>"+e+"</option>");
                    }
                    out.print("</select>");
                    
                    out.print("</li>");
                    out.print("</ul>");
                    out.print("<div class='card-body'>");
                      out.print("<button class='btn btn-outline-secondary' type='submit' disabled>Consultar</button>");
                    out.print("</div>");
                out.print("</div>");
            }
        %>
    </div>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <script>
        const paqs = document.getElementById("inputGroupSelect04");
        const botonConsultarPaq = document.querySelector(".btn-outline-secondary");
        paqs.addEventListener("change", e => {
            if(e.target.value == "Seleccione...") {
                botonConsultarPaq.disabled = true;
            } else {
                botonConsultarPaq.disabled = false;
            }
        });
        const esps = document.querySelector(".selectEsp");
        const botonConsultarEsp = Array.from(document.querySelectorAll(".btn")).pop();
        if(esps != null) {
            esps.addEventListener("change", e => {
                if(e.target.value == "Espectaculos...") {
                    botonConsultarEsp.disabled = true;
                } else {
                    botonConsultarEsp.disabled = false;
                }
            })
        }
    </script>
  </body>
</html>
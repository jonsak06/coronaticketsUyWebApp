<%-- 
    Document   : agregadoEspAPaq
    Created on : Oct 7, 2021, 3:06:23 PM
    Author     : dexion
--%>

<%@page import="java.util.List"%>
<%@page import="root.interfaces.iPaquetes"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        iRegistrosAcceso ir = Fabrica.getCtrlRegistrosAcceso();
        long moment = new java.util.Date().getTime();
        DtRegistroAcceso r = new DtRegistroAcceso(0,java.net.InetAddress.getLocalHost().getHostAddress(),request.getHeader("User-Agent"),request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"+request.getServletPath().substring(request.getServletPath().lastIndexOf("/") +1),moment);
        ir.ingresarRegistro(r);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar espectaculo a paquete</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <style>
            .input-group {
                margin-top: 30px;
            }
            .custom-select {
                width: 42%;
            }
            .containerEspectaculos {
                width: 100%;
                margin-top: 30px;
            }
            .hide {
                display: none;
            }
            h2 {
                text-align: center;
            }
            #inputGroupSelect03 {
                width: 90%;
            }
        </style>
        <link rel="stylesheet" href="headerStyles.css">
    </head>
    <body>
        <% 
            //usuarios que no sean artistas son redirigidos al inicio
//            try {
//                ServletContext contexto = getServletContext();
//                String tipoUsuario = contexto.getAttribute("tipoUsuario").toString();
//                if(!tipoUsuario.equals("Artista")) {
//                    response.sendRedirect("index.jsp");
//                }
//            } catch(Exception e) {
//                response.sendRedirect("index.jsp");
//            }
        %>
        <%@include file="header.jsp"%>
        <form action="listarEspecaculosNoIncluidos" class="container">
            <div class="input-group">
                <select name="paquete" class="custom-select" id="inputGroupSelect04">
                    <option selected>Seleccione...</option>
                    <%
                        iPaquetes ip = Fabrica.getCtrlPaquetes();
                        List<String> paqs = ip.listarPaquetes();

                        for(String p : paqs) {
                            out.println("<option>"+p+"</option>");
                        }
                    %>
                </select>
                <select name='plataforma' class='custom-select' id="inputGroupSelect05">
                    <option selected>Seleccione...</option>
                    <%
                        List<String> plats = ip.listarPlataformas();
                        for(String pl : plats) {
                            out.println("<option>"+pl+"</option>");
                        }
                    %>
                </select>
                <div class="input-group-append">
                     <button class="btn btn-outline-secondary" type="submit" disabled>Listar espectaculos</button>
                </div>
            </div>
        </form>
                
        <div class="container containerEspectaculos hide">
            <%
                List<String> esps = (List<String>) request.getAttribute("espectaculos");
                Boolean espsSolicitados = false;
                if(esps != null) {
                    String nomEsp = request.getParameter("paquete");
                    espsSolicitados = true;
                    out.println("<h2>");
                    out.println(nomEsp); 
                    out.println(" | ");
                    out.println(request.getParameter("plataforma"));
                    out.println("</h2>");
                    
                    out.println("<form method='post' action='agregarEspAPaq' class='container'>");
                    out.println("<div class='input-group'>");
                    out.println("<select name='espectaculo' class='custom-select' id='inputGroupSelect03'>");
                    out.println("<option selected>Seleccione...</option>");

                    for(String e : esps) {
                        out.println("<option>"+e+"</option>");
                    }

                    out.println("</select>");
                    out.println("<div class='input-group-append'>");
                        out.println("<button class='btn btn-outline-secondary btnAgregar' type='submit' disabled>Agregar</button>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("<input type='hidden' name='nomPaq' value='"+nomEsp+"'/>");
                    out.println("</form>");
                }
                
            %>
            
            
        </div>
        
        <%@include file="headerScript.jsp"%>
        <script>
            if(${agregado == true}) {
                alert("Espectaculo agregado al paquete");
            }
            const containerEsps = document.querySelector(".containerEspectaculos");
            if(<%=espsSolicitados%>) {
                containerEsps.classList.remove("hide");
            }
            const paqs = document.getElementById("inputGroupSelect04");
            const plats = document.getElementById("inputGroupSelect05");
            const botonlistarEsps = document.querySelector(".btn-outline-secondary");
            paqs.addEventListener("change", e => {
                if(e.target.value === "Seleccione..." || plats.value === "Seleccione...") {
                    botonlistarEsps.disabled = true;
                } else {
                    botonlistarEsps.disabled = false;
                }
            });
            plats.addEventListener("change", e => {
                if(e.target.value === "Seleccione..." || paqs.value === "Seleccione...") {
                    botonlistarEsps.disabled = true;
                } else {
                    botonlistarEsps.disabled = false;
                }
            });
            const botonAgregar = document.querySelector(".btnAgregar");
            const esps = document.getElementById("inputGroupSelect03");
            if(esps !== null) {
                esps.addEventListener("change", e => {
                    if(e.target.value === "Seleccione...") {
                        botonAgregar.disabled = true;
                    } else {
                        botonAgregar.disabled = false;
                    }
                });
            }
            
        </script>
    </body>
</html>

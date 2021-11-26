<%-- 
    Document   : busquedaEspYPaq
    Created on : Oct 8, 2021, 8:34:04 PM
    Author     : dexion
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
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
        <title>Busqueda de espectaculos y paquetes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="headerStyles.css">
        <style>
            h2 {
                margin-top: 30px;
                margin-bottom: 20px;
            }
            form {
                display: block;
                float: right;
            }
            .list-group-item {
                height: 60px;
            }
            .containerFiltrado {
                margin-top: 30px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container containerFiltrado">
            <form action="filtrarBusqueda">
                <div class="input-group">
                    <select name="filtro" class="custom-select" id="inputGroupSelect04">
                        <option selected>Seleccione...</option>
                        <option>Alfabeticamente (A-Z)</option>
                        <option>Anio (descendente)</option>
                        <option>Plataforma</option>
                        <option>Categoria</option>
                    </select>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" id="btnFiltrar" type="submit" disabled>Filtrar</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="container">
            <h2>Espectaculos</h2>
                <ul class="list-group" id="ulEsps">
                    <%
                        ServletContext contexto = getServletContext();
                        List<String> esps = (List<String>) contexto.getAttribute("espectaculos");
                        for(String e : esps){
                            out.println("<li class='list-group-item'>"+e+"<form action='consultarEsp2'>"+"<input type='hidden' name='espectaculo' value='"+e+"'>"+"<button class='btn btn-outline-secondary' type='submit'>Consultar</button>"+"</form>"+"</li>");
                        }
                    %>
                </ul>
            <h2>Paquetes</h2>
            <ul class="list-group" id="ulPaqs">
                <%
                    List<String> paqs = (List<String>) contexto.getAttribute("paquetes");
                    for(String p : paqs){
                        out.println("<li class='list-group-item'>"+p+"<form action='consultarPaquete'>"+"<input type='hidden' name='paquete' value='"+p+"'>"+"<button class='btn btn-outline-secondary' type='submit'>Consultar</button>"+"</form>"+"</li>");
                    }
                %>
            </ul>
        </div>
            <script>
                const botonFiltrar = document.getElementById("btnFiltrar");
                const opcionFiltrado = document.getElementById("inputGroupSelect04");
                
                opcionFiltrado.addEventListener("change", e => {
                    if(e.target.value === "Seleccione...") {
                        botonFiltrar.disabled = true;
                    } else {
                        botonFiltrar.disabled = false;
                    }
                });
                
                botonFiltrar.addEventListener("click", e => {
                    if(opcionFiltrado.value === "Alfabeticamente (A-Z)") {
                        e.preventDefault();
                        sortList("ulEsps");
                        sortList("ulPaqs"); 
                    }
                    
                });
                
                function sortList(ul) {
                var ul = document.getElementById(ul);

                Array.from(ul.getElementsByTagName("LI"))
                  .sort((a, b) => a.textContent.localeCompare(b.textContent))
                  .forEach(li => ul.appendChild(li));
                }
                
            </script>
        <%@include file="headerScript.jsp"%>
    </body>
</html>

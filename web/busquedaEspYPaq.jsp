<%-- 
    Document   : busquedaEspYPaq
    Created on : Oct 8, 2021, 8:34:04 PM
    Author     : dexion
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <h2>Espectaculos</h2>
                <ul class="list-group">
                    <%
                        List<String> esps = (List<String>) request.getAttribute("espectaculos");
                        for(String e : esps){
                            out.println("<li class='list-group-item'>"+e+"<form action='#'>"+"<input type='hidden' name='#' value='"+e+"'>"+"<button class='btn btn-outline-secondary' type='submit'>Consultar</button>"+"</form>"+"</li>");
                        }
                    %>
                </ul>
            <h2>Paquetes</h2>
            <ul class="list-group">
                <%
                    List<String> paqs = (List<String>) request.getAttribute("paquetes");
                    for(String p : paqs){
                        out.println("<li class='list-group-item'>"+p+"<form action='consultarPaquete'>"+"<input type='hidden' name='paquete' value='"+p+"'>"+"<button class='btn btn-outline-secondary' type='submit'>Consultar</button>"+"</form>"+"</li>");
                    }
                %>
            </ul>
        </div>
        
        <%@include file="headerScript.jsp"%>
    </body>
</html>

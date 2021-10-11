<%-- 
    Document   : filtradosPlataforma
    Created on : Oct 10, 2021, 8:41:07 PM
    Author     : dexion
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filtrado por plataforma</title>
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
            h3 {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <h2>Espectaculos</h2>
            <h3>Instagram</h3>
                <ul class="list-group">
                    <%
                        ServletContext contexto = getServletContext();
                        List<String> instagram = (List<String>) contexto.getAttribute("instagram");
                        for(String e : instagram){
                            out.println("<li class='list-group-item'>"+e+"<form action='consultarEsp2'>"+"<input type='hidden' name='espectaculo' value='"+e+"'>"+"<button class='btn btn-outline-secondary' type='submit'>Consultar</button>"+"</form>"+"</li>");
                        }
                    %>
                </ul>
            <h3>Facebook</h3>
                <ul class="list-group">
                    <%
                        List<String> facebook = (List<String>) contexto.getAttribute("facebook");
                        for(String e : facebook){
                            out.println("<li class='list-group-item'>"+e+"<form action='consultarEsp2'>"+"<input type='hidden' name='espectaculo' value='"+e+"'>"+"<button class='btn btn-outline-secondary' type='submit'>Consultar</button>"+"</form>"+"</li>");
                        }
                    %>
                </ul>
            <h3>Twitter</h3>
                <ul class="list-group">
                    <%
                        List<String> twitter = (List<String>) contexto.getAttribute("twitter");
                        for(String e : twitter){
                            out.println("<li class='list-group-item'>"+e+"<form action='consultarEsp2'>"+"<input type='hidden' name='espectaculo' value='"+e+"'>"+"<button class='btn btn-outline-secondary' type='submit'>Consultar</button>"+"</form>"+"</li>");
                        }
                    %>
                </ul>
            <h3>YouTube</h3>
                <ul class="list-group">
                    <%
                        List<String> youtube = (List<String>) contexto.getAttribute("youtube");
                        for(String e : youtube){
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
            
        <%@include file="headerScript.jsp"%>
    </body>
</html>

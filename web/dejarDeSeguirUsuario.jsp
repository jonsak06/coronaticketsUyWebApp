<%-- 
    Document   : seguirUsuario
    Created on : 4 oct. 2021, 11:57:12
    Author     : tecnologo
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
        <title>JSP Page</title>
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
        <form action="dejarDeSeguirUsuarioBackEnd">
            <select name="seguido">
                <%
                    ServletContext contexto = getServletContext();
                    if (contexto.getAttribute("tipoUsuario") != null) {

                        if (contexto.getAttribute("tipoUsuario").equals("Espectador")) {

                            List<DtUsuario> noS = Fabrica.getCrlUsuarios().getUsuariosQueSiguesEs(contexto.getAttribute("nickname").toString());

                            for (DtUsuario i : noS) {
                                out.println("<option>" + i.getNickname() + "</option>");
                            }

                        } else if (contexto.getAttribute("tipoUsuario").equals("Artista")) {

                            List<DtUsuario> noS = Fabrica.getCrlUsuarios().getUsuariosQueSiguesAr(contexto.getAttribute("nickname").toString());

                            for (DtUsuario i : noS) {
                                out.println("<option>" + i.getNickname() + "</option>");
                            }

                        }
                    }
                %>
            </select>
            <input type="submit" name="" value="Dejar de seguir"> 
        </form>
    </body>
</html>

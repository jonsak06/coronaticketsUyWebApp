<%-- 
    Document   : altaUsuario
    Created on : 24 set. 2021, 16:55:39
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
        <%
            ServletContext contexto = getServletContext();
            if (contexto.getAttribute("tipoUsuario") != null) {

                if (contexto.getAttribute("tipoUsuario").equals("Espectador")) {

                    DtEspectador es = Fabrica.getCrlUsuarios().getDatosEspectador(contexto.getAttribute("nickname").toString());
        %>   
        <form action="ModificarUsuariosBackEnd"  name="fModificarUsuario" id="fAltaUsuario" method="POST">

            <%
                out.print("<p name=\"/Tipo\"/>Espectador</p>");
                out.print("<p>Nombre:<input type=\"/text\"/ name=\"nombre\"/ value=\"" + es.getNombre() + "\"/ id=\"/nombre\"/ size=\"/30\"/  /></p>");
                out.print("<p>Apellido:<input type=\"/text\"/ name=\"apellido\"/ value=\"" + es.getApellido() + "\"/ id=\"/apellido\"/ size=\"/30\"/ /></p>");
                out.print("<p>Nickname:<input type=\"/text\"/ name=\"nickname\"/ value=\"" + es.getNickname() + "\"/ id=\"/nickname\"/ size=\"/30\"/ disabled /></p>");
                out.print("<p>Correo:<input type=\"/text\"/ name=\"correo\"/ value=\"" + es.getCorreo() + "\"/ id=\"/correo\"/ size=\"/30\"/ disabled /></p>");
                out.print("<p>Contraseña:<input type=\"/password\"name=\"/contrasenia\"/ id=\"/contrasenia\"/ value=\"" + es.getPass() + "\"/ size=\"/30\"/ /></p>");
                out.print("<p>Fecha: <input type=\"/date\"/ name=\"fecha\"/ value=\"" + es.getFechaNacimiento().toString() + "\"/ id=\"/fecha\"/></p>");
                out.print("<input type=\"/file\"/ accept=\"/image/*\"/ name=\"Imagen\"/ size=\"/150\"//>");
            %>
            <input type="submit" name="" value="crear">
            <%
            %>
        </form>
        <%                } else if (contexto.getAttribute("tipoUsuario").equals("Artista")) {
            DtArtista ar = Fabrica.getCrlUsuarios().getDatosArtista(contexto.getAttribute("nickname").toString());

        %>   
        <form action="ModificarUsuariosBackEnd"  name="fModificarUsuario" id="fAltaUsuario" method="POST">

            <%                out.print("<p>Nombre:<input type=\"/text\"/ name=\"nombre\"/ value=\"" + ar.getNombre() + "\"/ id=\"/nombre\"/ size=\"/30\"/  /></p>");
                out.print("<p>Apellido:<input type=\"/text\"/ name=\"apellido\"/ value=\"" + ar.getApellido() + "\"/ id=\"/apellido\"/ size=\"/30\"/ /></p>");
                out.print("<p>Nickname:<input type=\"/text\"/ name=\"nickname\"/ value=\"" + ar.getNickname() + "\"/ id=\"/nickname\"/ size=\"/30\"/ disabled /></p>");
                out.print("<p>Correo:<input type=\"/text\"/ name=\"correo\"/ value=\"" + ar.getCorreo() + "\"/ id=\"/correo\"/ size=\"/30\"/ disabled /></p>");
                out.print("<p>Contraseña:<input type=\"/password\"/ name=\"contrasenia\"/ id=\"/contrasenia\"/ value=\"" + ar.getPass() + "\"/ size=\"/30\"/ /></p>");
                out.print("<p>Fecha: <input type=\"/date\"/ name=\"fecha\"/ value=\"" + ar.getFechaNacimiento().toString() + "\"/ id=\"/fecha\"/></p>");

                out.print("<p>Link web:<input type=\"/password\"/ name=\"link\"/ value=\"" + ar.getLinkWeb() + "\"/ size=\"/30\"/ /></p>");
                out.print("<p>Biografia:</p>"
                        + "<textarea name=\"biografia\"/ value=\"" + ar.getBiografia() + " rows=\"/4\"/ cols=\"/30\"/> "
                        + "</textarea>");
                out.print("<p>Descripcion:</p>"
                        + "<textarea name=\"descripcion\"/ placeholder=\"" + ar.getDescripcion() + " rows=\"/4\"/ cols=\"/30\"/>"
                        + "</textarea>");
                out.print("<input type=\"/file\"/ accept=\"image/*\"/ name=\"/Imagen\"/ size=\"/150\"//>");
            %>
            <input type="submit" name="" value="crear">
            <%
            %>
        </form>
        <%                        }
            }
        %>


    </body>
</html>

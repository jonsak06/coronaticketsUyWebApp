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
    </head>
    <body>
        <link rel="stylesheet" href="./miestilo.css" type="text/css">
        <%@include file="header.jsp" %>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <%
                        ServletContext contexto = getServletContext();
                        if (contexto.getAttribute("tipoUsuario") != null) {

                            if (contexto.getAttribute("tipoUsuario").equals("Espectador")) {

                                DtEspectador es = Fabrica.getCrlUsuarios().getDatosEspectador(contexto.getAttribute("nickname").toString());
                    %>   
                    <form action="ModificarUsuariosBackEnd"  name="fModificarUsuario" class="box" id="fAltaUsuario" method="POST">

                        <%
                            out.print("<p name=\"/Tipo\"/>Espectador</p>");
                            out.print("<p class=\"text-muted\">Nombre:</p>");
                            out.print("<input type=\"text\" name=\"nombre\" value=\"" + es.getNombre() + "\" id=\"nombre\">");
                            out.print("<p class=\"text-muted\">Apellido:</p>");
                           out.print("<input type=\"text\" name=\"apellido\" value=\"" + es.getApellido() + "\" id=\"apellido\" />");
                           
                            out.print("<p class=\"text-muted\">Correo:</p>");
                            out.print("<input type=\"text\" name=\"correo\" value=\"" + es.getCorreo() + "\"/ id=\"correo\" disabled />");
                            out.print("<p class=\"text-muted\">Contraseña:</p>");
                            out.print("<input type=\"password\" name=\"contrasenia\" id=\"contrasenia\" value=\"" + es.getPass() + "\" />");
                            out.print("<p class=\"text-muted\">Fecha: </p>");
                                 out.print("<input type=\"date\" name=\"fecha\" value=\"" + es.getFechaNacimiento().toString() + "\" id=\"fecha\">");
                            out.print("<p class=\"text-muted\">Link web:</p>");
                            out.print("<input type=\"file\" accept=\"image*\" name=\"Imagen\"/>");
                        %>
                        <input type="submit" name="" value="crear">
                        <%
                        %>
                    </form>
                    <%                } else if (contexto.getAttribute("tipoUsuario").equals("Artista")) {
                        DtArtista ar = Fabrica.getCrlUsuarios().getDatosArtista(contexto.getAttribute("nickname").toString());

                    %>   
                    <form action="ModificarUsuariosBackEnd" class="box"  name="fModificarUsuario" id="fAltaUsuario" method="POST">

                        <%                
                            out.print("<p class=\"text-muted\">Nombre:</p>");
                            out.print("<input type=\"text\" name=\"nombre\" value=\"" + ar.getNombre() + "\" id=\"nombre\">");
                            out.print("<p class=\"text-muted\">Apellido:</p>");
                           out.print("<input type=\"text\" name=\"apellido\" value=\"" + ar.getApellido() + "\" id=\"apellido\" />");
                           
                            out.print("<p class=\"text-muted\">Correo:</p>");
                            out.print("<input type=\"text\" name=\"correo\" value=\"" + ar.getCorreo() + "\"/ id=\"correo\" disabled />");
                            out.print("<p class=\"text-muted\">Contraseña:</p>");
                            out.print("<input type=\"password\" name=\"contrasenia\" id=\"contrasenia\" value=\"" + ar.getPass() + "\" />");
                            out.print("<p class=\"text-muted\">Fecha: </p>");
                                 out.print("<input type=\"date\" name=\"fecha\" value=\"" + ar.getFechaNacimiento().toString() + "\" id=\"fecha\">");
                            out.print("<p class=\"text-muted\">Link web:</p>");
                            out.print("<input type=\"text\" name=\"link\" value=\"" + ar.getLinkWeb() + "\" />");
                            
                            out.print("<p class=\"text-muted\">Biografia:</p>");
                             out.print("<textarea name=\"biografia\"/ placeholder=\"" + ar.getBiografia() + "\" /></textarea>");
                           
                            out.print("<p class=\"text-muted\">Descripcion:</p>");
                            out.print("<textarea name=\"descripcion\"/ placeholder=\"" + ar.getDescripcion() + "\" /> </textarea>");
                            out.print("<input type=\"file\" accept=\"image*\" name=\"Imagen\"/>");
                        %>
                        <input type="submit" name="" value="crear">
                        <%
                        %>
                    </form>
                    <%                        }
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>

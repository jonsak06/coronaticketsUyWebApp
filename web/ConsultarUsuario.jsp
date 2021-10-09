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


        <link rel="stylesheet" href="headerStyles.css">

    </head>

    <body>

        <%@include file="header.jsp" %>
        <%ServletContext contexto = getServletContext();
        %>
        <form action="consultarUsuariosBackEnd" class="container">
            <div class="input-group">
                <select name="usuario" class="custom-select" id="inputGroupSelect04">

                    <%
                        List<DtArtista> lArt = Fabrica.getCrlUsuarios().getArtistas();
                        List<DtEspectador> lEsp = Fabrica.getCrlUsuarios().getEspectadores();

                        if (contexto.getAttribute("UsuarioSeleccionadaEnConsultarUsuario") != null) {
                            String selUsu = contexto.getAttribute("UsuarioSeleccionadaEnConsultarUsuario").toString();
                            if (selUsu != "Seleccione...") {
                                out.println("<option selected>" + selUsu + "</option>");
                                for (DtArtista a : lArt) {
                                    if (!a.getNickname().equals(selUsu)) {

                                        out.println("<option>" + a.getNickname() + "</option>");
                                    }
                                }
                                for (DtEspectador e : lEsp) {
                                    if (!e.getNickname().equals(selUsu)) {

                                        out.println("<option>" + e.getNickname() + "</option>");
                                    }
                                }
                            } else {
                                out.println("<option selected>Seleccione...</option>");
                                for (DtArtista a : lArt) {
                                    out.println("<option>" + a.getNickname() + "</option>");
                                }
                                for (DtEspectador e : lEsp) {
                                    out.println("<option>" + e.getNickname() + "</option>");
                                }
                            }

                        } else {
                            out.println("<option selected>Seleccione...</option>");
                            for (DtArtista a : lArt) {
                                out.println("<option>" + a.getNickname() + "</option>");
                            }
                            for (DtEspectador e : lEsp) {
                                out.println("<option>" + e.getNickname() + "</option>");
                            }

                        }
                    %>
                </select>
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit" disabled>Consultar</button>
                </div>
            </div>
        </form> 
        <div class="container infoUsuario">

            <%
                if (contexto.getAttribute("UsuarioSeleccionadaEnConsultarUsuario") != null) {
                    String selUsu = contexto.getAttribute("UsuarioSeleccionadaEnConsultarUsuario").toString();
                    if (selUsu != "Seleccione..." && selUsu != null) {
///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                        for (DtArtista a : lArt) {
                            if (selUsu.equals(a.getNickname())) {
                                out.print("<div class='card' style='width: 18rem;'>");
                                out.print("<img src='" + a.getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
                                out.print("<div class='card-body'>");
                                out.print("<h5 class='card-title'>" + a.getNickname() + "</h5>");
                                out.print("<p class='card-text'>" + a.getNombre() + "</p>");
                                out.print("<p class='card-text'>" + a.getApellido() + "</p>");
                                out.print("<p class='card-text'>" + a.getCorreo() + "</p>");
                                out.print("<p class='card-text'>" + a.getFechaNacimiento().toString() + "</p>");
                                out.print("</div>");
                                out.print("</div>");
                            }
                        }
                        
///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////                        
                        
                        for (DtEspectador e : lEsp) {
                            if (selUsu.equals(e.getNickname())) {
                                out.print("<div class='card' style='width: 18rem;'>");
                                out.print("<img src='" + e.getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
                                out.print("<div class='card-body'>");
                                out.print("<h5 class='card-title'>" + e.getNickname() + "</h5>");
                                out.print("<p class='card-text'>" + e.getNombre() + "</p>");
                                out.print("<p class='card-text'>" + e.getApellido() + "</p>");
                                out.print("<p class='card-text'>" + e.getCorreo() + "</p>");
                                out.print("<p class='card-text'>" + e.getFechaNacimiento().toString() + "</p>");
                                out.print("</div>");
                                out.print("</div>");
                                
                                List<DtRegistro> lRegistr = Fabrica.getCrlUsuarios().getRegistros(e.getNickname());

                                out.print("<form action=\"ConsultarFuncionBackEnd\">");

                                out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
                                if (contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario") == null) {
                                    out.print("<option selected>Seleccione...</option>");

                                    for (DtRegistro reg : lRegistr) {
                                        out.print("<option >" + reg.getNombreFuncion() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario") != "Espectaculos...") {
                                        out.print("<option selected>" + contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario").toString() + "</option>");

                                        for (DtRegistro reg : lRegistr) {
                                            if (!contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario").toString().equals(e.getNombre())) {
                                                out.print("<option >" + reg.getNombreFuncion() + "</option>");

                                            }

                                        }
                                    } else {
                                        out.print("<option selected>Seleccione...</option>");

                                        for (DtRegistro reg : lRegistr) {
                                            out.print("<option >" + reg.getNombreFuncion() + "</option>");

                                        }
                                    }

                                }

                                out.print("</select>");
                                //aaaa

                                out.print("</li>");
                                out.print("</ul>");
                                out.print("<div class='card-body'>");
                                out.print("<button class='btn btn-outline-secondarye' type='submit' disabled>Consultar</button>");
                                out.print("</form>");
                                out.print("</div>");

                            }
                        }
///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////                          
                    }
                }


            %>
        </div>  


        <script>
            const paqs = document.getElementById("inputGroupSelect04");
            const botonConsultarPaq = document.querySelector(".btn-outline-secondary");
            paqs.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarPaq.disabled = true;
                } else {
                    botonConsultarPaq.disabled = false;
                }
            });

        </script>
        <%@include file="headerScript.jsp"%>
    </body>

</html>


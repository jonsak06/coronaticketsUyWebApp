<%-- 
    Document   : ConsultarFuncion
    Created on : Oct 8, 2021, 9:18:52 PM
    Author     : osiris
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
        <%@include file="header.jsp"%>
        <%ServletContext contexto = getServletContext();
        %>

        <form action="ConsultarFuncionBackEnd" class="container">
            <div class="input-group">
                <%
                    out.println("<select name=\"plataforma\" class=\"custom-select\" id=\"inputGroupSelect04\">");

                    List<DtPlataforma> listaDePlat = Fabrica.getCtrlEspectaculos().listarPlataformas();
                    if (contexto.getAttribute("PlataformaSeleccionadaEnConsultarFuncion") != null) {
                        String plat = contexto.getAttribute("PlataformaSeleccionadaEnConsultarFuncion").toString();
                        if (plat != "Seleccione...") {
                            out.println("<option selected>" + plat + "</option>");
                            for (DtPlataforma p : listaDePlat) {
                                if (!plat.equals(p.getNombre())) {
                                    out.println("<option>" + p.getNombre() + "</option>");
                                }
                            }
                        } else {
                            out.println("<option selected>Seleccione...</option>");

                            for (DtPlataforma p : listaDePlat) {
                                out.println("<option>" + p.getNombre() + "</option>");
                            }
                        }

                    } else {
                        out.println("<option selected>Seleccione...</option>");

                        for (DtPlataforma p : listaDePlat) {
                            out.println("<option>" + p.getNombre() + "</option>");
                        }

                    }
                    out.println("</select>");
                %>
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit" disabled>Consultar</button>
                </div>
            </div>
        </form>           
        <div class="container infoDeFunciones">

            <%
                if (contexto.getAttribute("PlataformaSeleccionadaEnConsultarFuncion") != null) {
                    String plat = contexto.getAttribute("PlataformaSeleccionadaEnConsultarFuncion").toString();
                    if (plat != "Seleccione..." && plat != null) {
                        for (DtPlataforma p : listaDePlat) {
                            if (plat.equals(p.getNombre())) {
                                out.print("<div class='card' style='width: 18rem;'>");
                                out.print("<p class='card-text'>" + p.getNombre() + "</p>");
                                out.print("<p class='card-text'>" + p.getUrl() + "</p>");
                                out.print("<p class='card-text'>" + p.getDescripcion() + "</p>");
                                out.print("</div>");

                                List<DtEspectaculo> esps = Fabrica.getCtrlEspectaculos().listarEspectaculos(p.getNombre());

                                out.print("<form action=\"ConsultarFuncionBackEnd\">");

                                out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
                                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion") == null) {
                                    out.print("<option selected>Espectaculos...</option>");

                                    for (DtEspectaculo e : esps) {
                                        out.print("<option >" + e.getNombre() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString() != "Espectaculos...") {
                                        out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString() + "</option>");

                                        for (DtEspectaculo e : esps) {
                                            if (!contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString().equals(e.getNombre())) {
                                                out.print("<option >" + e.getNombre() + "</option>");

                                            }

                                        }
                                    } else {
                                        out.print("<option selected>Espectaculos...</option>");

                                        for (DtEspectaculo e : esps) {
                                            out.print("<option >" + e.getNombre() + "</option>");

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

                                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion") != null) {
                                    String esp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString();

                                    if (esp != "Espectaculos..." && esp != null) {
                                        for (DtEspectaculo e : esps) {
                                            if (esp.equals(e.getNombre())) {
                                                out.print("<div class='card' style='width: 18rem;'>");
                                                out.print("<p class='card-text'>" + e.getNombre() + "</p>");
                                                out.print("<p class='card-text'>" + e.getDescripcion() + "</p>");
                                                out.print("<p class='card-text'>" + e.getDuracion() + "</p>");
                                                out.print("<p class='card-text'>" + e.getCantidadMaximaEspectadores() + "</p>");
                                                out.print("<p class='card-text'>" + e.getCantidadMinimaEspectadores() + "</p>");
                                                out.print("<p class='card-text'>" + e.getUrl() + "</p>");
                                                out.print("<p class='card-text'>" + e.getCosto() + "</p>");
                                                out.print("<p class='card-text'>" + e.getFechaDeRegistro() + "</p>");
//////////////////////////////////////////////////
                                                out.print("</div>");

                                                List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString());
                                                out.print("<form action=\"ConsultarFuncionBackEnd\">");

                                                out.print("<select name='funcion' class='custom-select selectEsp' id='inputGroupSelect04f'>");
                                                out.print("<option selected>Funciones...</option>");
                                                if (contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo") == null) {
                                                    out.print("<option selected>Funciones...</option>");

                                                    for (DtFuncion f : fun) {
                                                        out.print("<option >" + f.getNombre() + "</option>");

                                                    }
                                                } else {
                                                    if (contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo").toString() != "Funciones...") {
                                                        out.print("<option selected>" + contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo").toString() + "</option>");

                                                        for (DtFuncion f : fun) {
                                                            if (!contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo").toString().equals(f.getNombre())) {
                                                                out.print("<option >" + f.getNombre() + "</option>");

                                                            }

                                                        }
                                                    } else {
                                                        out.print("<option selected>Funciones...</option>");

                                                        for (DtFuncion f : fun) {
                                                            out.print("<option >" + f.getNombre() + "</option>");

                                                        }
                                                    }

                                                }
                                                out.print("</select>");

                                                out.print("</li>");
                                                out.print("</ul>");
                                                out.print("<div class='card-body'>");
                                                out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");
                                                out.print("</div>");
                                                out.print("</form>");
                                                out.print("</div>");
                                                if (contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion") != null) {
                                                    String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion").toString();

                                                    if (sfun != "Funciones..." && sfun != null) {
                                                        for (DtFuncion f : fun) {
                                                            if (sfun.equals(f.getNombre())) {
                                                                out.print("<div class='card' style='width: 18rem;'>");
                                                                out.print("<p class='card-text'>" + f.getNombre() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getFecha().toString() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getFechaDeRegistro().toString() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getHoraInicio().toString() + "</p>");

                                                                out.print("</div>");

                                                                List<DtArtista> ars = Fabrica.getCtrlEspectaculos().getInvitados(contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion").toString());
                                                                out.print("<form action=\"ConsultarFuncionBackEnd\">");

                                                                out.print("<select name='artista' class='custom-select selectEsp' id='inputGroupSelect04a'>");

                                                                if (contexto.getAttribute("ArtistaSeleccionadoEnConsultarFuncion") != null) {
                                                                    String selUsu = contexto.getAttribute("ArtistaSeleccionadoEnConsultarFuncion").toString();
                                                                    if (selUsu != "Seleccione...") {
                                                                        out.println("<option selected>" + selUsu + "</option>");
                                                                        for (DtArtista a : ars) {
                                                                            if (!a.getNickname().equals(selUsu)) {

                                                                                out.println("<option>" + a.getNickname() + "</option>");
                                                                            }
                                                                        }

                                                                    } else {
                                                                        out.println("<option selected>Seleccione...</option>");
                                                                        for (DtArtista a : ars) {
                                                                            out.println("<option>" + a.getNickname() + "</option>");
                                                                        }

                                                                    }

                                                                } else {
                                                                    out.println("<option selected>Seleccione...</option>");
                                                                    for (DtArtista a : ars) {
                                                                        out.println("<option>" + a.getNickname() + "</option>");
                                                                    }

                                                                }

                                                                out.print("</select>");

                                                                out.print("</li>");
                                                                out.print("</ul>");
                                                                out.print("<div class='card-body'>");
                                                                out.print("<button class='btn btn-outline-secondarya' type='submit' disabled>Consultar</button>");
                                                                out.print("</form>");

                                                                out.print("</div>");
                                                                ///////////////////////////////////////////////////////////////////////////////////////////
                                                                if (contexto.getAttribute("ArtistaSeleccionadoEnConsultarFuncion") != null) {
                                                                    String sar = contexto.getAttribute("ArtistaSeleccionadoEnConsultarFuncion").toString();

                                                                    if (sar != "Seleccione..." && sar != null) {
                                                                        for (DtArtista a : ars) {
                                                                            if (sar.equals(a.getNickname())) {
                                                                                out.print("<div class='card' style='width: 18rem;'>");
                                                                                out.print("<p class='card-text'>" + a.getNickname() + "</p>");
                                                                                out.print("<p class='card-text'>" + a.getCorreo() + "</p>");
                                                                                out.print("<p class='card-text'>" + a.getNombre() + "</p>");
                                                                                out.print("<p class='card-text'>" + a.getApellido() + "</p>");
                                                                                out.print("<p class='card-text'>" + a.getFechaNacimiento().toString() + "</p>");
                                                                                out.print("<p class='card-text'>" + a.getLinkWeb() + "</p>");
                                                                                out.print("<p class='card-text'>" + a.getBiografia() + "</p>");
                                                                                out.print("<p class='card-text'>" + a.getDescripcion() + "</p>");

                                                                                out.print("</div>");

                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                                ////////////////////////////////
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                            }
                        }

                    }
                }


            %>
        </div>

        <script>   const paqs = document.getElementById("inputGroupSelect04");
            const botonConsultarPaq = document.querySelector(".btn-outline-secondary");
            paqs.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarPaq.disabled = true;
                } else {
                    botonConsultarPaq.disabled = false;
                }
            });

        </script>        
        <script>   const esps = document.getElementById("inputGroupSelect04e");
            const botonConsultarEsps = document.querySelector(".btn-outline-secondarye");
            esps.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarEsps.disabled = true;
                } else {
                    botonConsultarEsps.disabled = false;
                }
            });

        </script>   
        <script>
            const funs = document.getElementById("inputGroupSelect04f");
            const botonConsultarFuns = document.querySelector(".btn-outline-secondaryf");
            funs.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarFuns.disabled = true;
                } else {
                    botonConsultarFuns.disabled = false;
                }
            });

        </script>  
        <script>
            const ars = document.getElementById("inputGroupSelect04a");
            const botonConsultarArs = document.querySelector(".btn-outline-secondarya");
            ars.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarArs.disabled = true;
                } else {
                    botonConsultarArs.disabled = false;
                }
            });

        </script> 
        <%@include file="headerScript.jsp"%>
    </body>


</html>

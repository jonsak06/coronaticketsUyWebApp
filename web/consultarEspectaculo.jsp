<%-- 
    Document   : consultarEspectaculo
    Created on : 9 oct. 2021, 02:39:23
    Author     : tecnologo
--%>

<
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
            out.println("<h1> " + contexto.getAttribute("nickname").toString() + " </h1> ");
        %>

        <form action="ConsultarEspectaculoBackEnd" class="container">
            <div class="input-group">
                <%
                    out.println("<select name=\"plataforma\" class=\"custom-select\" id=\"inputGroupSelect04\">");

                    List<DtPlataforma> listaDePlat = Fabrica.getCtrlEspectaculos().listarPlataformas();
                    if (contexto.getAttribute("PlataformaSeleccionadaEnConsultarEspectaculo") != null) {
                        String plat = contexto.getAttribute("PlataformaSeleccionadaEnConsultarEspectaculo").toString();
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
                if (contexto.getAttribute("PlataformaSeleccionadaEnConsultarEspectaculo") != null) {
                    String plat = contexto.getAttribute("PlataformaSeleccionadaEnConsultarEspectaculo").toString();
                    if (plat != "Seleccione..." && plat != null) {
                        for (DtPlataforma p : listaDePlat) {
                            if (plat.equals(p.getNombre())) {
                                out.print("<div class='card' style='width: 18rem;'>");
                                out.print("<p class='card-text'>" + p.getNombre() + "</p>");
                                out.print("<p class='card-text'>" + p.getUrl() + "</p>");
                                out.print("<p class='card-text'>" + p.getDescripcion() + "</p>");
                                out.print("</div>");

                                List<DtEspectaculo> esps = Fabrica.getCtrlEspectaculos().listarEspectaculos(p.getNombre());

                                out.print("<form action=\"ConsultarEspectaculoBackEnd\">");

                                out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
                                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo") == null) {
                                    out.print("<option selected>Espectaculos...</option>");

                                    for (DtEspectaculo e : esps) {
                                        out.print("<option >" + e.getNombre() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo") != "Espectaculos...") {
                                        out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString() + "</option>");

                                        for (DtEspectaculo e : esps) {
                                            if (!contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString().equals(e.getNombre())) {
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

                                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo") != null) {
                                    String esp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString();

                                    if (esp != "Seleccione..." && esp != null) {
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

                                                List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString());
                                                out.print("<form action=\"ConsultarEspectaculoBackEnd\">");

                                                out.print("<select name='funcion' class='custom-select selectEsp' id='inputGroupSelect04f'>");
                                                out.print("<option selected>Funciones...</option>");
                                                for (DtFuncion f : fun) {
                                                    out.print("<option >" + f.getNombre() + "</option>");

                                                }
                                                out.print("</select>");

                                                out.print("</li>");
                                                out.print("</ul>");
                                                out.print("<div class='card-body'>");
                                                out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");
                                                out.print("</div>");
                                                out.print("</form>");
                                                out.print("</div>");

                                                if (contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo") != null) {
                                                    String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo").toString();

                                                    if (sfun != "Funciones..." && sfun != null) {
                                                        for (DtFuncion f : fun) {
                                                            if (sfun.equals(f.getNombre())) {
                                                                out.print("<div class='card' style='width: 18rem;'>");
                                                                out.print("<p class='card-text'>" + f.getNombre() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getFecha().toString() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getFechaDeRegistro().toString() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getHoraInicio().toString() + "</p>");

                                                                out.print("</div>");

                                                            }
                                                        }
                                                    }
                                                }

                                                List<String> paqs = Fabrica.getCtrlPaquetes().listarPaquetes();

                                                out.print("<form action=\"ConsultarEspectaculoBackEnd\">");

                                                out.print("<select name='paquete' class='custom-select selectEsp' id='inputGroupSelect04p'>");
                                                out.print("<option selected>Paquetes...</option>");
                                                for (String i : paqs) {
                                                    if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(i).contains(e.getNombre())) {
                                                        out.print("<option >" + i + "</option>");
                                                    }

                                                }
                                                out.print("</select>");

                                                out.print("</li>");
                                                out.print("</ul>");
                                                out.print("<div class='card-body'>");
                                                out.print("<button class='btn btn-outline-secondaryp' type='submit' disabled>Consultar</button>");
                                                out.print("</div>");
                                                out.print("</form>");
                                                out.print("</div>");

//                                                
                                                ///////////////////////////////////////////////////////////////////////////////////////
                                                if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo") != null) {
                                                    String spaq = contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString();

                                                    if (spaq != "Paquetes..." && spaq != null) {
                                                        for (String paq : paqs) {
                                                            if (spaq.equals(paq)) {
                                                                DtPaqueteDeEspectaculos instanciaP = Fabrica.getCtrlPaquetes().mostrarInfoPaquete(paq);
                                                                out.print("<div class='card' style='width: 18rem;'>");
                                                                out.print("<p class='card-text'>" + instanciaP.getNombre() + "</p>");
                                                                out.print("<p class='card-text'>" + instanciaP.getDescripcion() + "</p>");
                                                                out.print("<p class='card-text'>" + instanciaP.getDescuento() + "</p>");

                                                                out.print("<p class='card-text'>" + instanciaP.getFechaInicio().toString() + "</p>");
                                                                out.print("<p class='card-text'>" + instanciaP.getFechaFin().toString() + "</p>");
                                                                out.print("<p class='card-text'>" + instanciaP.getFechaAlta().toString() + "</p>");

                                                                out.print("</div>");

                                                            }
                                                        }
                                                    }
                                                }
                                                //////////////////////////
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

        <script>   const plats = document.getElementById("inputGroupSelect04");
            const botonConsultarPlat = document.querySelector(".btn-outline-secondary");
            plats.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarPlat.disabled = true;
                } else {
                    botonConsultarPlat.disabled = false;
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
        <script>
            const paqs = document.getElementById("inputGroupSelect04p");
            const botonConsultarPaqs = document.querySelector(".btn-outline-secondaryp");
            paqs.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarPaqs.disabled = true;
                } else {
                    botonConsultarPaqs.disabled = false;
                }
            });

        </script> 
    </body>


</html>
<%-- 
    Document   : FinalizarEspectaculo
    Created on : 27 oct. 2021, 11:29:45
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
    </head>
    <body>
        <%ServletContext contexto = getServletContext();%>
        <%

            List<DtEspectaculo> esps = Fabrica.getCrlUsuarios().listarEspectaculosDeArtista(contexto.getAttribute("nickname").toString());

            out.print("<form action=\"FinalizarEspectaculoBackEnd\">");
            out.print("</br>");
            out.print("</br>");
            out.print("<h6>Seleccione Espectaculo:</h6>");
            out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
            if (contexto.getAttribute("EspectaculoSeleccionadoEnFinalizarEspectaculo") == null) {
                out.print("<option selected>Espectaculos...</option>");

                for (DtEspectaculo e : esps) {
                    out.print("<option >" + e.getNombre() + "</option>");

                }
            } else {
                if (contexto.getAttribute("EspectaculoSeleccionadoEnFinalizarEspectaculo").toString() != "Espectaculos...") {
                    out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadoEnFinalizarEspectaculo").toString() + "</option>");

                    for (DtEspectaculo e : esps) {
                        if (!contexto.getAttribute("EspectaculoSeleccionadoEnFinalizarEspectaculo").toString().equals(e.getNombre())) {
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
            out.print("<button class='btn btn-outline-secondarye' type='submit' disabled>Consultar</button>");
            out.print("</form>");

            //
            if (contexto.getAttribute("EspectaculoSeleccionadoEnFinalizarEspectaculo") != null) {
                String esp = contexto.getAttribute("EspectaculoSeleccionadoEnFinalizarEspectaculo").toString();

                if (esp != "Seleccione..." && esp != null) {
                    for (DtEspectaculo e : esps) {
                        if (esp.equals(e.getNombre())) {
                            out.print("<img src='" + e.getImagen() + "' alt='imagen del espectaculo'>");

                            if (e.getVideo() != null) {
                                if (e.getVideo() != "" && e.getVideo() != "NOVIDEO" && e.getVideo().contains(" ")) {
                                    out.print("pene");
//                                    String[] parts = e.getVideo().split("v=");
//                                    out.print("<iframe width=\"400\" height=\"225\" src=\"https://www.youtube.com/embed/" + parts[1] + "\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>" + "</iframe>");
                                }
                            }

                            out.print("<h4> Nombre: " + e.getNombre() + "</h4>");
                            out.print("<p> Descripcion: " + e.getDescripcion() + "</p>");
                            out.print("<p> Duracion: " + e.getDuracion() + "</p>");
                            out.print("<p> Cantidad Maxima de Espectadores: " + e.getCantidadMaximaEspectadores() + "</p>");
                            out.print("<p> Cantidad Minima de Espectadores: " + e.getCantidadMinimaEspectadores() + "</p>");
                            out.print("<p> URL: " + e.getUrl() + "</p>");
                            out.print("<p> Costo: " + e.getCosto() + "</p>");
                            out.print("<p> Fecha de registro: " + e.getFechaDeRegistro() + "</p>");
                            //////////////////////////////////////////////////

                            out.print("<form action=\"FinalizarEspectaculoBackEnd\">");
                            out.print("<button class='btn btn-outline-secondaryf' type='submit' >Finalizar</button>");

                            out.print("</form>");
                        }
                    }
                }
            }
            
        %>
    </body>
    
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

</html>

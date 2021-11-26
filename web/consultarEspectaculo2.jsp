<%-- 
    Document   : consultarEspectaculo2
    Created on : Oct 10, 2021, 2:19:41 PM
    Author     : dexion
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.datatypes.DtEspectaculo"%>
<%@page import="root.interfaces.iPaquetes"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="java.util.List"%>
<%@page import="root.datatypes.DtPaqueteDeEspectaculos"%>
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
        <title>CoronaTicketsUy</title>
        <style>
            .infoEspectaculo {
                margin-top: 30px;
            }
        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="headerStyles.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container infoEspectaculo">
            <%                DtEspectaculo dvEsp = (DtEspectaculo) request.getAttribute("dvEsp");
                out.print("<div class='card' style='width: 18rem;'>");
                out.print("<img src='" + dvEsp.getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
//                if (dvEsp.getVideo() != null) {
//                    String[] parts = dvEsp.getVideo().split("v=");
//                    out.print("<iframe width=\"280\" height=\"158\" src=\"https://www.youtube.com/embed/" + parts[1] + "\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>" + "</iframe>");
//                }
                                                            if (dvEsp.getVideo() != null) {
                                                            if(dvEsp.getVideo().contains("v=")){
                                                            if (!dvEsp.getVideo().contains(" ")) {
                                                                if (dvEsp.getVideo() != "") {
                                                                    if (dvEsp.getVideo() != "NOVIDEO") {
                                                                        String[] parts = dvEsp.getVideo().split("v=");
                                                                        out.print("<iframe width=\"280\" height=\"158\" src=\"https://www.youtube.com/embed/" + parts[1] + "\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>" + "</iframe>");
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        }
                out.print("<div class='card-body'>");
                out.print("<h5 class='card-title'>" + dvEsp.getNombre() + "</h5>");
                out.print("<p class='card-text'>" + dvEsp.getDescripcion() + "</p>");
                out.print("</div>");
                out.print("<ul class='list-group list-group-flush'>");
                out.print("<li class='list-group-item'>Duracion: " + dvEsp.getDuracion() + "</li>");
                out.print("<li class='list-group-item'>Minimo espectadores: " + dvEsp.getCantidadMinimaEspectadores() + "</li>");
                out.print("<li class='list-group-item'>Maximo espectadores: " + dvEsp.getCantidadMaximaEspectadores() + "</li>");
                out.print("<li class='list-group-item'>URL: " + dvEsp.getUrl() + "</li>");
                out.print("<li class='list-group-item'>Artista: " + dvEsp.getNombreArtista() + "</li>");
                out.print("<li class='list-group-item'>Costo: " + dvEsp.getCosto() + "</li>");
                out.print("</div>");
            %>
        </div>

        <%@include file="headerScript.jsp"%>
    </body>
</html>

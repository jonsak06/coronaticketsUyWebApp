<%-- 
    Document   : valorarEspectaculo.jsp
    Created on : 9 oct. 2021, 02:39:23
    Author     : tecnologo
--%>


<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.*"%>
<%@page import="root.datatypes.*"%>
<%@page import="root.fabrica.Fabrica"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            iRegistrosAcceso ir = Fabrica.getCtrlRegistrosAcceso();
            long moment = new java.util.Date().getTime();
            DtRegistroAcceso r = new DtRegistroAcceso(0, java.net.InetAddress.getLocalHost().getHostAddress(), request.getHeader("User-Agent"), request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" + request.getServletPath().substring(request.getServletPath().lastIndexOf("/") + 1), moment);
            ir.ingresarRegistro(r);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="headerStyles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link href="http://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">


        <style>
            @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

            body {
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                background: linear-gradient(to right, #b92b27, #1565c0)
            }

            .card {
                margin-bottom: 10px;
                border: none
            }

            .box {
                width: 500px;
                padding: 40px;
                position: absolute;
                top: 25%;
                left: 25%;
                background: #191919;
                ;
                text-align: center;
                transition: 0.25s;
                margin-top: 100px
            }

            .box input[type="text"],
            .box input[type="password"] {
                border: 0;
                background: none;
                display: block;
                margin: 20px auto;
                text-align: center;
                border: 2px solid #3498db;
                padding: 10px 10px;
                width: 250px;
                outline: none;
                color: white;
                border-radius: 24px;
                transition: 0.25s
            }


            .box h1 {
                color: white;
                text-transform: uppercase;
            }

            .box h3 {
                color: white;
                text-transform: uppercase;
                font-size: 40px;

            }
            .box h4 {
                color: white;
                text-transform: uppercase;
                font-size: 30px;

            }

            .box h5 {
                color: white;
                text-transform: uppercase;
                font-size: 22px;

            }
            .box h6 {
                color: white;
                text-transform: uppercase;

            }

            .box input[type="text"]:focus,
            .box input[type="password"]:focus {
                width: 200px;
                border-color: #2ecc71
            }

            .box select:focus {
                width: 200px;
                border-color: #2ecc71
            }

            .grafica{
                width: 130px;
                margin: auto;
                text-align: left;
            }

            .grafica img{
                margin: 0px;
            }

            .box select {
                border: 0;
                background: none;
                display: block;
                margin: 20px auto;
                text-align: center;
                border: 2px solid #3498db;
                padding: 10px 10px;
                width: 250px;
                outline: none;
                color: white;
                border-radius: 24px;
                transition: 0.25s
            }

            .box li {
                color: white;
                font-weight: 250
            }

            .box p{
                color: white;
                font-weight: 250
            }


            .box input[type="submit"] {
                border: 0;
                background: none;
                display: block;
                margin: 20px auto;
                text-align: center;
                border: 2px solid #2ecc71;
                padding: 14px 40px;
                outline: none;
                color: white;
                border-radius: 24px;
                transition: 0.25s;
                cursor: pointer
            }

            .box button {
                border: 0;
                background: none;
                display: block;
                margin: 20px auto;
                text-align: center;
                border: 2px solid #2ecc71;
                padding: 14px 40px;
                outline: none;
                color: white;
                border-radius: 24px;
                transition: 0.25s;
                cursor: pointer
            }

            .box option {
                background: black;
                color: white;
            }

            .box input[type="submit"]:hover {
                background: #2ecc71
            }

            .imgPrincipal{
                height: 300px;
                width: 300px;
                margin: 20px auto;
            }
            .forgot {
                text-decoration: underline
            }

            /*@import url(http://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400);*/





            .cont {
                width: 93%;
                max-width: 350px;

            }


            div.title { font-size: 2em; }


            div.stars {
                width: 270px;
                display: inline-block;
            }

            input.star { display: none; }

            label.star {
                float: right;
                padding: 10px;
                font-size: 36px;
                color: #444;
                transition: all .2s;
            }

            input.star:checked ~ label.star:before {
                content: '\f005';
                color: #FD4;
                transition: all .25s;
            }

            input.star-5:checked ~ label.star:before {
                color: #FE7;
                text-shadow: 0 0 20px #952;
            }

            input.star-1:checked ~ label.star:before { color: #F62; }

            label.star:hover { transform: rotate(-15deg) scale(1.3); }

            label.star:before {
                content: '\f006';
                font-family: FontAwesome;
            }


        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%ServletContext contexto = getServletContext();%>
        <div class="box">

            <%
                int unaEstrella = 0;
                int dosEstrellas = 0;
                int tresEstrellas = 0;
                int cuatroEstrellas = 0;
                int cincoEstrellas = 0;

                List<DtEspectaculo> esps = Fabrica.getCrlUsuarios().getEspectaculosALosQueElEspectadorFueAUnaFuncion(contexto.getAttribute("nickname").toString());
                List<DtEspectaculo> espsVal = Fabrica.getCrlUsuarios().getEspectaculosValorados(contexto.getAttribute("nickname").toString());
                List<DtValoracion> valoraciones = Fabrica.getCrlUsuarios().getValoracionesAEspectaculos(contexto.getAttribute("nickname").toString());
                List<String> nombresEspsVal = new ArrayList<String>();
                List<String> nombresEspsNoVal = new ArrayList<String>();
                for (DtEspectaculo e : espsVal) {
                    nombresEspsVal.add(e.getNombre());
                }
                for (DtEspectaculo e : esps) {
                    if (!nombresEspsVal.contains(e.getNombre())) {

                        nombresEspsNoVal.add(e.getNombre());
                    }
                }

                out.print("<form action=\"valorarEspectaculoBackEnd\">");
                out.print("</br>");
                out.print("</br>");
                out.print("<h6>Seleccione Espectaculo:</h6>");
                out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarValorar") == null) {
                    out.print("<option selected>Espectaculos...</option>");

                    for (DtEspectaculo e : esps) {
                        out.print("<option >" + e.getNombre() + "</option>");

                    }
                } else {
                    if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarValorar").toString() != "Espectaculos...") {
                        out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadpEnConsultarValorar").toString() + "</option>");

                        for (DtEspectaculo e : esps) {
                            if (!contexto.getAttribute("EspectaculoSeleccionadpEnConsultarValorar").toString().equals(e.getNombre())) {
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
                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarValorar") != null) {
                    String esp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarValorar").toString();

                    if (esp != "Seleccione..." && esp != null) {
                        for (DtEspectaculo e : esps) {
                            if (esp.equals(e.getNombre())) {
                                out.print("<img class=\"imgPrincipal\" src='" + e.getImagen() + "' alt='imagen del espectaculo'>");

                                if (e.getVideo() != null) {
                                    if (!e.getVideo().contains(" ")) {
                                        if (e.getVideo() != "") {
                                            if (e.getVideo() != "NOVIDEO") {
                                                String[] parts = e.getVideo().split("v=");
                                                out.print("<iframe width=\"400\" height=\"225\" src=\"https://www.youtube.com/embed/" + parts[1] + "\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>" + "</iframe>");
                                            }
                                        }
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

                                List<DtValoracion> val = Fabrica.getCtrlEspectaculos().getValoraciones(e.getNombre());
                                if (val.size() > 0) {
                                    for (DtValoracion v : val) {
                                        if (v.getValor() == 1) {
                                            unaEstrella++;
                                        }
                                        if (v.getValor() == 2) {
                                            dosEstrellas++;
                                        }
                                        if (v.getValor() == 3) {
                                            tresEstrellas++;
                                        }
                                        if (v.getValor() == 4) {
                                            cuatroEstrellas++;
                                        }
                                        if (v.getValor() == 5) {
                                            cincoEstrellas++;
                                        }
                                    }

                                    out.print("<div class=\"grafica\">");
                                    if (100 / val.size() * unaEstrella < 6) {
                                        out.print("<img src=\"GRAFICAS/1Estrella0p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 16) {
                                        out.print("<img src=\"GRAFICAS/1Estrella10p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 26) {
                                        out.print("<img src=\"GRAFICAS/1Estrella20p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 36) {
                                        out.print("<img src=\"GRAFICAS/1Estrella30p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 46) {
                                        out.print("<img src=\"GRAFICAS/1Estrella40p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 56) {
                                        out.print("<img src=\"GRAFICAS/1Estrella50p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 66) {
                                        out.print("<img src=\"GRAFICAS/1Estrella60p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 76) {
                                        out.print("<img src=\"GRAFICAS/1Estrella70p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 86) {
                                        out.print("<img src=\"GRAFICAS/1Estrella80p.png\">");
                                    } else if (100 / val.size() * unaEstrella < 96) {
                                        out.print("<img src=\"GRAFICAS/1Estrella90p.png\">");
                                    } else {
                                        out.print("<img src=\"GRAFICAS/1Estrella100p.png\">");
                                    }
                                    out.print("</br>");

                                    if (100 / val.size() * dosEstrellas < 6) {
                                        out.print("<img src=\"GRAFICAS/2Estrella0p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 16) {
                                        out.print("<img src=\"GRAFICAS/2Estrella10p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 26) {
                                        out.print("<img src=\"GRAFICAS/2Estrella20p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 36) {
                                        out.print("<img src=\"GRAFICAS/2Estrella30p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 46) {
                                        out.print("<img src=\"GRAFICAS/2Estrella40p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 56) {
                                        out.print("<img src=\"GRAFICAS/2Estrella50p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 66) {
                                        out.print("<img src=\"GRAFICAS/2Estrella60p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 76) {
                                        out.print("<img src=\"GRAFICAS/2Estrella70p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 86) {
                                        out.print("<img src=\"GRAFICAS/2Estrella80p.png\">");
                                    } else if (100 / val.size() * dosEstrellas < 96) {
                                        out.print("<img src=\"GRAFICAS/2Estrella90p.png\">");
                                    } else {
                                        out.print("<img src=\"GRAFICAS/2Estrella100p.png\">");
                                    }
                                    out.print("</br>");
                                    if (100 / val.size() * tresEstrellas < 6) {
                                        out.print("<img src=\"GRAFICAS/3Estrella0p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 16) {
                                        out.print("<img src=\"GRAFICAS/3Estrella10p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 26) {
                                        out.print("<img src=\"GRAFICAS/3Estrella20p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 36) {
                                        out.print("<img src=\"GRAFICAS/3Estrella30p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 46) {
                                        out.print("<img src=\"GRAFICAS/3Estrella40p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 56) {
                                        out.print("<img src=\"GRAFICAS/3Estrella50p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 66) {
                                        out.print("<img src=\"GRAFICAS/3Estrella60p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 76) {
                                        out.print("<img src=\"GRAFICAS/3Estrella70p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 86) {
                                        out.print("<img src=\"GRAFICAS/3Estrella80p.png\">");
                                    } else if (100 / val.size() * tresEstrellas < 96) {
                                        out.print("<img src=\"GRAFICAS/3Estrella90p.png\">");
                                    } else {
                                        out.print("<img src=\"GRAFICAS/3Estrella100p.png\">");
                                    }
                                    out.print("</br>");
                                    if (100 / val.size() * cuatroEstrellas < 6) {
                                        out.print("<img src=\"GRAFICAS/4Estrella0p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 16) {
                                        out.print("<img src=\"GRAFICAS/4Estrella10p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 26) {
                                        out.print("<img src=\"GRAFICAS/4Estrella20p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 36) {
                                        out.print("<img src=\"GRAFICAS/4Estrella30p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 46) {
                                        out.print("<img src=\"GRAFICAS/4Estrella40p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 56) {
                                        out.print("<img src=\"GRAFICAS/4Estrella50p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 66) {
                                        out.print("<img src=\"GRAFICAS/4Estrella60p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 76) {
                                        out.print("<img src=\"GRAFICAS/4Estrella70p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 86) {
                                        out.print("<img src=\"GRAFICAS/4Estrella80p.png\">");
                                    } else if (100 / val.size() * cuatroEstrellas < 96) {
                                        out.print("<img src=\"GRAFICAS/4Estrella90p.png\">");
                                    } else {
                                        out.print("<img src=\"GRAFICAS/4Estrella100p.png\">");
                                    }

                                    out.print("</br>");
                                    if (100 / val.size() * cincoEstrellas < 6) {
                                        out.print("<img src=\"GRAFICAS/5Estrella0p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 16) {
                                        out.print("<img src=\"GRAFICAS/5Estrella10p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 26) {
                                        out.print("<img src=\"GRAFICAS/5Estrella20p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 36) {
                                        out.print("<img src=\"GRAFICAS/5Estrella30p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 46) {
                                        out.print("<img src=\"GRAFICAS/5Estrella40p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 56) {
                                        out.print("<img src=\"GRAFICAS/5Estrella50p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 66) {
                                        out.print("<img src=\"GRAFICAS/5Estrella60p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 76) {
                                        out.print("<img src=\"GRAFICAS/5Estrella70p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 86) {
                                        out.print("<img src=\"GRAFICAS/5Estrella80p.png\">");
                                    } else if (100 / val.size() * cincoEstrellas < 96) {
                                        out.print("<img src=\"GRAFICAS/5Estrella90p.png\">");
                                    } else {
                                        out.print("<img src=\"GRAFICAS/5Estrella100p.png\">");
                                    }
                                

                                out.print("</div>");
                                }

                                if (nombresEspsVal.contains(e.getNombre())) {

                                    DtValoracion estaVal = null;
                                    for (DtValoracion v : val) {
                                        if (v.getNombreEspectaculo().equals(e.getNombre())) {
                                            estaVal = v;
                                        }
                                    }
                                    out.print("<div class=\"stars\">");
                                    out.print(" <form action=\"\">");
                                    if (estaVal.getValor() == 5) {
                                        out.print("<input class=\"star star-5\" id=\"star-5\" type=\"radio\" name=\"star\" checked disabled/> ");
                                        out.print("<label class=\"star star-5\" for=\"star-5\"></label>");
                                        out.print(" <input class=\"star star-4\"  id=\"star-4\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-4\" for=\"star-4\"></label>");
                                        out.print(" <input class=\"star star-3\"   id=\"star-3\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-3\" for=\"star-3\"></label>");
                                        out.print("<input class=\"star star-2\"  id=\"star-2\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-2\" for=\"star-2\"></label>");
                                        out.print("<input class=\"star star-1\" id=\"star-1\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-1\" for=\"star-1\"></label>");
                                    } else if (estaVal.getValor() == 4) {
                                        out.print("<input class=\"star star-5\" id=\"star-5\" type=\"radio\" name=\"star\" disabled/> ");
                                        out.print("<label class=\"star star-5\" for=\"star-5\"></label>");
                                        out.print(" <input class=\"star star-4\"  id=\"star-4\" type=\"radio\" name=\"star\" checked disabled/>");
                                        out.print("<label class=\"star star-4\" for=\"star-4\"></label>");
                                        out.print(" <input class=\"star star-3\"   id=\"star-3\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-3\" for=\"star-3\"></label>");
                                        out.print("<input class=\"star star-2\"  id=\"star-2\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-2\" for=\"star-2\"></label>");
                                        out.print("<input class=\"star star-1\" id=\"star-1\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-1\" for=\"star-1\"></label>");
                                    } else if (estaVal.getValor() == 3) {
                                        out.print("<input class=\"star star-5\" id=\"star-5\" type=\"radio\" name=\"star\" disabled/> ");
                                        out.print("<label class=\"star star-5\" for=\"star-5\"></label>");
                                        out.print(" <input class=\"star star-4\"  id=\"star-4\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-4\" for=\"star-4\"></label>");
                                        out.print(" <input class=\"star star-3\"   id=\"star-3\" type=\"radio\" name=\"star\" checked disabled/>");
                                        out.print("<label class=\"star star-3\" for=\"star-3\"></label>");
                                        out.print("<input class=\"star star-2\"  id=\"star-2\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-2\" for=\"star-2\"></label>");
                                        out.print("<input class=\"star star-1\" id=\"star-1\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-1\" for=\"star-1\"></label>");
                                    } else if (estaVal.getValor() == 2) {
                                        out.print("<input class=\"star star-5\" id=\"star-5\" type=\"radio\" name=\"star\" disabled/> ");
                                        out.print("<label class=\"star star-5\" for=\"star-5\"></label>");
                                        out.print(" <input class=\"star star-4\"  id=\"star-4\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-4\" for=\"star-4\"></label>");
                                        out.print(" <input class=\"star star-3\"   id=\"star-3\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-3\" for=\"star-3\"></label>");
                                        out.print("<input class=\"star star-2\"  id=\"star-2\" type=\"radio\" name=\"star\" checked disabled/>");
                                        out.print("<label class=\"star star-2\" for=\"star-2\"></label>");
                                        out.print("<input class=\"star star-1\" id=\"star-1\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-1\" for=\"star-1\"></label>");
                                    } else if (estaVal.getValor() == 1) {
                                        out.print("<input class=\"star star-5\" id=\"star-5\" type=\"radio\" name=\"star\" disabled/> ");
                                        out.print("<label class=\"star star-5\" for=\"star-5\"></label>");
                                        out.print(" <input class=\"star star-4\"  id=\"star-4\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-4\" for=\"star-4\"></label>");
                                        out.print(" <input class=\"star star-3\"   id=\"star-3\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-3\" for=\"star-3\"></label>");
                                        out.print("<input class=\"star star-2\"  id=\"star-2\" type=\"radio\" name=\"star\" disabled/>");
                                        out.print("<label class=\"star star-2\" for=\"star-2\"></label>");
                                        out.print("<input class=\"star star-1\" id=\"star-1\" type=\"radio\" name=\"star\" checked disabled/>");
                                        out.print("<label class=\"star star-1\" for=\"star-1\"></label>");
                                    }
                                    out.print("</form>");
                                    out.print("</div>");

                                } else {
                                    out.print("<div class=\"cont\">");
                                    out.print("<div class=\"stars\">");
                                    out.print("<form action=\"\">");
                                    out.print("<input class=\"star star-5\" onclick=\"myFunction(this.value)\" value=\"5o1o1o1" + e.getNombre() + "\" id=\"star-5-2\" type=\"radio\" name=\"star\"/>");
                                    out.print("<label class=\"star star-5\" for=\"star-5-2\"></label>");
                                    out.print("<input class=\"star star-4\" onclick=\"myFunction(this.value)\" value=\"4o1o1o1" + e.getNombre() + "\" id=\"star-4-2\" type=\"radio\" name=\"star\"/>");
                                    out.print("<label class=\"star star-4\" for=\"star-4-2\"></label>");
                                    out.print(" <input class=\"star star-3\" onclick=\"myFunction(this.value)\" value=\"3o1o1o1" + e.getNombre() + "\" id=\"star-3-2\" type=\"radio\" name=\"star\"/>");
                                    out.print(" <label class=\"star star-3\" for=\"star-3-2\"></label>");
                                    out.print("<input class=\"star star-2\" onclick=\"myFunction(this.value)\" value=\"2o1o1o1" + e.getNombre() + "\" id=\"star-2-2\" type=\"radio\" name=\"star\"/>");
                                    out.print("<label class=\"star star-2\" for=\"star-2-2\"></label>");
                                    out.print("<input class=\"star star-1\" onclick=\"myFunction(this.value)\" value=\"1o1o1o1" + e.getNombre() + "\" id=\"star-1-2\" type=\"radio\" name=\"star\"/>");
                                    out.print("<label class=\"star star-1\" for=\"star-1-2\"></label>");
                                    out.print("</form>");
                                    out.print("</div>");

                                }
                            }
                        }
                    }
                }


            %>
        </div>
        <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
        <script>
            function myFunction(valor) {

                const myArray = valor.split("o1o1o1");
                const val = myArray[0];
                const texto = myArray[1];
                alert(val + " " + texto);
                $.post('valorarEspectaculoBackEnd', {
                    nombre: texto,
                    val: val
                });
            }


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

        <%@include file="headerScript.jsp"%>
    </body>


</html>
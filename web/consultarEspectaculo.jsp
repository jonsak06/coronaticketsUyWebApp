<%-- 
    Document   : consultarEspectaculo
    Created on : 9 oct. 2021, 02:39:23
    Author     : tecnologo
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.*"%>
<%@page import="root.datatypes.*"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-core.min.js"></script>
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
        <style>


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
            
            .grafica{
                width: 130px;
                margin: auto;
                text-align: left;
            }
            
            .grafica img{
                margin: 0px;
            }
            
            
            
            
            .imgPrincipal{
                height: 300px;
                width: 300px;
                margin: 20px auto;
            }
            .forgot {
                text-decoration: underline
            }

            #headerMovil {
                display: none;
            }

            @media (max-width: 1000px) {
                #headerDesktop {
                    display: none;
                }
                #headerMovil {
                    display: block;
                }
                .box {
                    position:relative;
                    top: 0;
                    left: 0;
                    width: auto;
                    margin-top: 0;
                    padding: 20px;
                    background: #2d2d2d;
                    color: gray !important;
                }
                body {
                    background: #2d2d2d;
                }
                .box h3,
                .box h4 {
                    font-size: 22px;
                }
            }


        </style>
    </head>
    <body>
        <div id="headerDesktop">
            <%@include file="header.jsp"%>
        </div>
        <div id="headerMovil">
            <%@include file="headerMovil.jsp"%>
        </div>
        <%ServletContext contexto = getServletContext();%>
        <div class="box">

            <%
                int unaEstrella = 0;
                int dosEstrellas = 0;
                int tresEstrellas = 0;
                int cuatroEstrellas = 0;
                int cincoEstrellas = 0;
                Gson gson = new Gson();
                String jsonUnaEstrella = gson.toJson(unaEstrella);
                String jsonDosEstrellas = gson.toJson(dosEstrellas);
                String jsonTresEstrellas = gson.toJson(tresEstrellas);
                String jsonCuatroEstrellas = gson.toJson(cuatroEstrellas);
                String jsonCincoEstrellas = gson.toJson(cincoEstrellas);

                out.println("<form action=\"ConsultarEspectaculoBackEnd\">");
                out.println("</br>");
                out.println("<h1>Consultar Espectaculos</h1>");
                out.println("<h6>Seleccione tipo de cosulta</h6>");
                out.println("<select name=\"tipoConsulta\">");
                out.println("<option>Seleccione...</option>");
                out.println("<option value=\"Plataforma\">Plataforma</option>");
                out.println("<option value=\"Categorias\">Categorias</option>");
                out.println("</select>");
                out.println("<button type=\"submit\">Consultar</button>");
                out.println("</form>");

                if (contexto.getAttribute("tipoDeConsultaEspectaculos") != null) {

                    if (contexto.getAttribute("tipoDeConsultaEspectaculos").toString().equals("Plataforma")) {
                        out.print("<form action=\"ConsultarEspectaculoBackEnd\">");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("<h6>Seleccione Plataforma:</h6>");

                        out.println("<select name=\"plataforma\" id=\"inputGroupSelect04\">");

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
                        out.println("<button class=\"btn btn-outline-secondary\" type=\"submit\" disabled>Consultar</button>");
                        out.println("</form>");

                        if (contexto.getAttribute("PlataformaSeleccionadaEnConsultarEspectaculo") != null) {
                            String plat = contexto.getAttribute("PlataformaSeleccionadaEnConsultarEspectaculo").toString();
                            if (plat != "Seleccione..." && plat != null) {
                                for (DtPlataforma p : listaDePlat) {
                                    if (plat.equals(p.getNombre())) {
                                        out.print("<h3> Nombre:" + p.getNombre() + "</h3>");
                                        out.print("<p> URL:" + p.getUrl() + "</p>");
                                        out.print("<p> Descripcion:" + p.getDescripcion() + "</p>");

                                        List<DtEspectaculo> esps = Fabrica.getCtrlEspectaculos().listarEspectaculos(p.getNombre());

                                        out.print("<form action=\"ConsultarEspectaculoBackEnd\">");
                                        out.print("</br>");
                                        out.print("</br>");
                                        out.print("<h6>Seleccione Espectaculo:</h6>");
                                        out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
                                        if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo") == null) {
                                            out.print("<option selected>Espectaculos...</option>");

                                            for (DtEspectaculo e : esps) {
                                                out.print("<option >" + e.getNombre() + "</option>");

                                            }
                                        } else {
                                            if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString() != "Espectaculos...") {
                                                out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString() + "</option>");

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
                                        out.print("<button class='btn btn-outline-secondarye' type='submit' disabled>Consultar</button>");
                                        out.print("</form>");
                                        //
                                        if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo") != null) {
                                            String esp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString();

                                            if (esp != "Seleccione..." && esp != null) {
                                                for (DtEspectaculo e : esps) {
                                                    if (esp.equals(e.getNombre())) {
                                                        out.print("<img class=\"imgPrincipal\" src='" + e.getImagen() + "' alt='imagen del espectaculo'>");

                                                        if (e.getVideo() != null) {
                                                            String[] parts = e.getVideo().split("v=");
                                                            out.print("pene");
                                                            out.print("<iframe width=\"400\" height=\"225\" src=\"https://www.youtube.com/embed/" + parts[1] + "\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>" + "</iframe>");
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

                                                        jsonUnaEstrella = gson.toJson(unaEstrella);
                                                        jsonDosEstrellas = gson.toJson(dosEstrellas);
                                                        jsonTresEstrellas = gson.toJson(tresEstrellas);
                                                        jsonCuatroEstrellas = gson.toJson(cuatroEstrellas);
                                                        jsonCincoEstrellas = gson.toJson(cincoEstrellas);
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
                                                        
                                                        //////////////////////////////////////////////////
                                                        List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString());
                                                        out.print("<form action=\"ConsultarEspectaculoBackEnd\">");
                                                        out.print("</br>");
                                                        out.print("</br>");
                                                        out.print("<h6>Seleccione Funcion:</h6>");
                                                        out.print("<select name='funcion' class='custom-select selectEsp' id='inputGroupSelect04f'>");

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
                                                        out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");

                                                        out.print("</form>");

                                                        if (contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo") != null) {
                                                            String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo").toString();

                                                            if (sfun != "Funciones..." && sfun != null) {
                                                                for (DtFuncion f : fun) {
                                                                    if (sfun.equals(f.getNombre())) {
                                                                        out.print("<img class=\"imgPrincipal\" src='" + f.getImagen() + "' alt='imagen de la funcion'>");
                                                                        out.print("<h5> Nombre: " + f.getNombre() + "</h5>");
                                                                        out.print("<p> Fecha: " + f.getFecha().toString() + "</p>");
                                                                        out.print("<p> Fecha de registro: " + f.getFechaDeRegistro().toString() + "</p>");
                                                                        out.print("<p> Hora de inicio:" + f.getHoraInicio().toString() + "</p>");

                                                                    }
                                                                }
                                                            }
                                                        }
                                                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////777
                                                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                        List<String> paqs = Fabrica.getCtrlPaquetes().listarPaquetes();

                                                        out.print("<form action=\"ConsultarEspectaculoBackEnd\">");

                                                        out.print("</br>");
                                                        out.print("</br>");
                                                        out.print("<h6>Seleccione Paquete:</h6>");
                                                        out.print("<select name='paquete' class='custom-select selectEsp' id='inputGroupSelect04p'>");

                                                        if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo") == null) {
                                                            out.print("<option selected>Paquetes...</option>");

                                                            for (String i : paqs) {
                                                                if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(i).contains(e.getNombre())) {
                                                                    out.print("<option >" + i + "</option>");
                                                                }

                                                            }
                                                        } else {
                                                            if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString() != "Paquetes...") {
                                                                out.print("<option selected>" + contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString() + "</option>");
                                                                for (String i : paqs) {
                                                                    if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(i).contains(e.getNombre())) {
                                                                        if (!contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString().equals(i)) {
                                                                            out.print("<option >" + i + "</option>");
                                                                        }
                                                                    }
                                                                }
                                                            } else {
                                                                out.print("<option selected>Paquetes...</option>");

                                                                for (String i : paqs) {
                                                                    if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(i).contains(e.getNombre())) {
                                                                        out.print("<option >" + i + "</option>");
                                                                    }

                                                                }
                                                            }

                                                        }

                                                        out.print("</select>");

                                                        out.print("</li>");
                                                        out.print("</ul>");
                                                        out.print("<button class='btn btn-outline-secondaryp' type='submit' disabled>Consultar</button>");

                                                        out.print("</form>");

                                                        //                                                
                                                        ///////////////////////////////////////////////////////////////////////////////////////
                                                        if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo") != null) {
                                                            String spaq = contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString();

                                                            if (spaq != "Paquetes..." && spaq != null) {
                                                                for (String paq : paqs) {
                                                                    if (spaq.equals(paq)) {
                                                                        DtPaqueteDeEspectaculos instanciaP = Fabrica.getCtrlPaquetes().mostrarInfoPaquete(paq);
                                                                        out.print("<img class=\"imgPrincipal\" src='" + instanciaP.getImagen() + "' alt='imagen del paquete'>");

                                                                        out.print("<h5> Nombre: " + instanciaP.getNombre() + "</h5>");
                                                                        out.print("<p> Descripcion: " + instanciaP.getDescripcion() + "</p>");
                                                                        out.print("<p> Descuento: " + instanciaP.getDescuento() + "</p>");

                                                                        out.print("<p> Fecha de inicio: " + instanciaP.getFechaInicio().toString() + "</p>");
                                                                        out.print("<p> Fecha de fin: " + instanciaP.getFechaFin().toString() + "</p>");
                                                                        out.print("<p> Fecha de alta: " + instanciaP.getFechaAlta().toString() + "</p>");

                                                                    }
                                                                }
                                                            }
                                                        }
                                                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////777
                                                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                        //////////////////////////
                                                    }
                                                }
                                            }
                                        }

                                    }
                                }

                            }
                        }
                        //////////////////////////////////////////////////////////////////////////////
                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////
                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////
                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////

                    } else if (contexto.getAttribute("tipoDeConsultaEspectaculos").toString().equals("Categorias")) {
                        out.print("<form action=\"ConsultarEspectaculoBackEnd\">");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("<h6>Seleccione Categoria</h6>");

                        out.println("<select name=\"categoria\" id=\"inputGroupSelect04\">");

                        List<String> listaDeCat = Fabrica.getCtrlEspectaculos().listarCategorias();
                        if (contexto.getAttribute("CategoriaSeleccionadaEnConsultarEspectaculo") != null) {
                            String plat = contexto.getAttribute("CategoriaSeleccionadaEnConsultarEspectaculo").toString();
                            if (plat != "Seleccione...") {
                                out.println("<option selected>" + plat + "</option>");
                                for (String c : listaDeCat) {
                                    if (!plat.equals(c)) {
                                        out.println("<option>" + c + "</option>");
                                    }
                                }
                            } else {
                                out.println("<option selected>Seleccione...</option>");

                                for (String c : listaDeCat) {
                                    out.println("<option>" + c + "</option>");
                                }
                            }

                        } else {
                            out.println("<option selected>Seleccione...</option>");

                            for (String c : listaDeCat) {
                                out.println("<option>" + c + "</option>");
                            }

                        }
                        out.println("</select>");
                        out.println("<button class=\"btn btn-outline-secondary\" type=\"submit\" disabled>Consultar</button>");
                        out.println("</form>");

                        if (contexto.getAttribute("CategoriaSeleccionadaEnConsultarEspectaculo") != null) {
                            String plat = contexto.getAttribute("CategoriaSeleccionadaEnConsultarEspectaculo").toString();
                            if (plat != "Seleccione..." && plat != null) {
                                for (String c : listaDeCat) {
                                    if (plat.equals(c)) {
                                        out.print("<h3> nombre:" + c + "</h3>");

                                        List<DtEspectaculo> esps = Fabrica.getCtrlEspectaculos().listarEspPorCat(c);

                                        out.print("<form action=\"ConsultarEspectaculoBackEnd\">");
                                        out.print("</br>");
                                        out.print("</br>");
                                        out.print("<h6>Seleccione Espectaculo:</h6>");
                                        out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
                                        if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo") == null) {
                                            out.print("<option selected>Espectaculos...</option>");

                                            for (DtEspectaculo e : esps) {
                                                out.print("<option >" + e.getNombre() + "</option>");

                                            }
                                        } else {
                                            if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString() != "Espectaculos...") {
                                                out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString() + "</option>");

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
                                        out.print("<button class='btn btn-outline-secondarye' type='submit' disabled>Consultar</button>");
                                        out.print("</form>");
                                        //
                                        if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo") != null) {
                                            String esp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString();

                                            if (esp != "Seleccione..." && esp != null) {
                                                for (DtEspectaculo e : esps) {
                                                    if (esp.equals(e.getNombre())) {
                                                        out.print("<img class=\"imgPrincipal\" src='" + e.getImagen() + "' alt='imagen del espectaculo'>");
                                                        if (e.getVideo() != null) {
                                                            String[] parts = e.getVideo().split("v=");
                                                            out.print("<iframe width=\"400\" height=\"225\" src=\"https://www.youtube.com/embed/" + parts[1] + "\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>" + "</iframe>");
                                                        }
                                                        out.print("<h4> Nombre: " + e.getNombre() + "</h4>");
                                                        out.print("<p> Descripcion: " + e.getDescripcion() + "</p>");
                                                        out.print("<p> Duracion: " + e.getDuracion() + "</p>");
                                                        out.print("<p> Cantidad maxima de espectadores: " + e.getCantidadMaximaEspectadores() + "</p>");
                                                        out.print("<p> Cantidad minima de espectadores: " + e.getCantidadMinimaEspectadores() + "</p>");
                                                        out.print("<p> URL: " + e.getUrl() + "</p>");
                                                        out.print("<p> Costo: " + e.getCosto() + "</p>");
                                                        out.print("<p> Fecha de registro: " + e.getFechaDeRegistro() + "</p>");
                                                        //////////////////////////////////////////////////

                                                        List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarEspectaculo").toString());
                                                        out.print("<form action=\"ConsultarEspectaculoBackEnd\">");
                                                        out.print("</br>");
                                                        out.print("</br>");
                                                        out.print("<h6>Seleccione Funcion:</h6>");
                                                        out.print("<select name='funcion' class='custom-select selectEsp' id='inputGroupSelect04f'>");

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
                                                        out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");

                                                        out.print("</form>");

                                                        if (contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo") != null) {
                                                            String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarEspectaculo").toString();

                                                            if (sfun != "Funciones..." && sfun != null) {
                                                                for (DtFuncion f : fun) {
                                                                    if (sfun.equals(f.getNombre())) {
                                                                        out.print("<img class=\"imgPrincipal\" src='" + f.getImagen() + "' alt='imagen de la funcion'>");
                                                                        out.print("<h5> Nombre: " + f.getNombre() + "</h5>");
                                                                        out.print("<p> Fecha: " + f.getFecha().toString() + "</p>");
                                                                        out.print("<p> Fecha de registro: " + f.getFechaDeRegistro().toString() + "</p>");
                                                                        out.print("<p> Hora de inicio: " + f.getHoraInicio().toString() + "</p>");

                                                                    }
                                                                }
                                                            }
                                                        }
                                                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////777
                                                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                        List<String> paqs = Fabrica.getCtrlPaquetes().listarPaquetes();

                                                        out.print("<form action=\"ConsultarEspectaculoBackEnd\">");

                                                        out.print("</br>");
                                                        out.print("</br>");
                                                        out.print("<h6>Seleccione Paquete:</h6>");
                                                        out.print("<select name='paquete' class='custom-select selectEsp' id='inputGroupSelect04p'>");

                                                        if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo") == null) {
                                                            out.print("<option selected>Paquetes...</option>");

                                                            for (String i : paqs) {
                                                                if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(i).contains(e.getNombre())) {
                                                                    out.print("<option >" + i + "</option>");
                                                                }

                                                            }
                                                        } else {
                                                            if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString() != "Paquetes...") {
                                                                out.print("<option selected>" + contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString() + "</option>");
                                                                for (String i : paqs) {
                                                                    if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(i).contains(e.getNombre())) {
                                                                        if (!contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString().equals(i)) {
                                                                            out.print("<option >" + i + "</option>");
                                                                        }
                                                                    }
                                                                }
                                                            } else {
                                                                out.print("<option selected>Paquetes...</option>");

                                                                for (String i : paqs) {
                                                                    if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(i).contains(e.getNombre())) {
                                                                        out.print("<option >" + i + "</option>");
                                                                    }

                                                                }
                                                            }

                                                        }

                                                        out.print("</select>");

                                                        out.print("</li>");
                                                        out.print("</ul>");
                                                        out.print("<button class='btn btn-outline-secondaryp' type='submit' disabled>Consultar</button>");

                                                        out.print("</form>");

                                                        //                                                
                                                        ///////////////////////////////////////////////////////////////////////////////////////
                                                        if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo") != null) {
                                                            String spaq = contexto.getAttribute("PaqueteSeleccionadoEnConsultarEspectaculo").toString();

                                                            if (spaq != "Paquetes..." && spaq != null) {
                                                                for (String paq : paqs) {
                                                                    if (spaq.equals(paq)) {
                                                                        DtPaqueteDeEspectaculos instanciaP = Fabrica.getCtrlPaquetes().mostrarInfoPaquete(paq);
                                                                        out.print("<img class=\"imgPrincipal\" src='" + instanciaP.getImagen() + "' alt='imagen del paquete'>");

                                                                        out.print("<h5> Nombre: " + instanciaP.getNombre() + "</h5>");
                                                                        out.print("<p> Descripcion: " + instanciaP.getDescripcion() + "</p>");
                                                                        out.print("<p> Descuento: " + instanciaP.getDescuento() + "</p>");

                                                                        out.print("<p> Fecha de inicio: " + instanciaP.getFechaInicio().toString() + "</p>");
                                                                        out.print("<p> Fecha de fin: " + instanciaP.getFechaFin().toString() + "</p>");
                                                                        out.print("<p> Fecha de alta: " + instanciaP.getFechaAlta().toString() + "</p>");

                                                                    }
                                                                }
                                                            }
                                                        }
                                                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////777
                                                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                        //////////////////////////
                                                    }
                                                }
                                            }
                                        }

                                    }
                                }

                            }
                        }
                        //////////////////////////////////////////////
                        //////////////////////////////////////////////
                        //////////////////////////////////////////////
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

        <script>
            const jsonUnaEstrella = <%=jsonUnaEstrella%>;
            const jsonDosEstrellas = <%=jsonDosEstrellas%>;
            const jsonTresEstrellas = <%=jsonTresEstrellas%>;
            const jsonCuatroEstrellas = <%=jsonCuatroEstrellas%>;
            const jsonCincoEstrellas = <%=jsonCincoEstrellas%>;

            // create data
            var data = [
                ["uno", parseInt(jsonUnaEstrella)],
                ["dos", parseInt(jsonDosEstrellas],
                        ["tres", parseInt(jsonTresEstrellas)],
                ["cuatro", parseInt(jsonCuatroEstrellas)],
                ["cinco", parseInt(jsonCincoEstrellas)]
            ];

// create a chart
            chart = anychart.bar();

// create a bar series and set the data
            var series = chart.bar(data);

// set the container id
            chart.container("grafica");

// initiate drawing the chart
            chart.draw();
        </script>
        <%@include file="headerScript.jsp"%>
    </body>


</html>
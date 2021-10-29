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
        <%
        iRegistrosAcceso ir = Fabrica.getCtrlRegistrosAcceso();
        long moment = new java.util.Date().getTime();
        DtRegistroAcceso r = new DtRegistroAcceso(0,java.net.InetAddress.getLocalHost().getHostAddress(),request.getHeader("User-Agent"),request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"+request.getServletPath().substring(request.getServletPath().lastIndexOf("/") +1),moment);
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

            .box img{
                height: 300px;
                width: 300px;
                margin: 20px auto;
            }
            .forgot {
                text-decoration: underline;
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
                    margin-top: 30px;
                }
                body {
                    background: #191919;
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
        <%ServletContext contexto = getServletContext();

            out.print("<div class=\"box\">");
            out.println("<form action=\"ConsultarFuncionBackEnd\">");
            out.println("<h1>Consultar Funcion</h1>");
            out.println("</br>");
            out.println("<h6>Seleccione tipo de cosulta</h6>");
            out.println("<select name=\"tipoConsulta\">");
            out.println("<option>Seleccione...</option>");
            out.println("<option value=\"Plataforma\">Plataforma</option>");
            out.println("<option value=\"Categorias\">Categorias</option>");
            out.println("</select>");
            out.println("<button type=\"submit\">Consultar</button>");
            out.println("</form>");

            if (contexto.getAttribute("tipoDeConsultaFunciones") != null) {

                if (contexto.getAttribute("tipoDeConsultaFunciones").toString().equals("Plataforma")) {

                    out.print("<form action=\"ConsultarFuncionBackEnd\" >");
                    out.print("</br>");
                    out.print("</br>");
                    out.print("<h6>Seleccione Plataforma:</h6>");
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
                    out.println("<button class=\"btn btn-outline-secondary\" type=\"submit\" disabled>Consultar</button>");
                    out.println("</form>  ");

                    if (contexto.getAttribute("PlataformaSeleccionadaEnConsultarFuncion") != null) {
                        String plat = contexto.getAttribute("PlataformaSeleccionadaEnConsultarFuncion").toString();
                        if (plat != "Seleccione..." && plat != null) {
                            for (DtPlataforma p : listaDePlat) {
                                if (plat.equals(p.getNombre())) {

                                    out.print("<h3> Nombre: " + p.getNombre() + "</h3>");
                                    out.print("<p> URL: " + p.getUrl() + "</p>");
                                    out.print("<p> Descripicion" + p.getDescripcion() + "</p>");

                                    List<DtEspectaculo> esps = Fabrica.getCtrlEspectaculos().listarEspectaculos(p.getNombre());

                                    out.print("<form action=\"ConsultarFuncionBackEnd\">");
                                    out.print("</br>");
                                    out.print("</br>");
                                    out.print("<h6>Seleccione Espectaculo:</h6>");
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

                                    out.print("<button class='btn btn-outline-secondarye' type='submit' disabled>Consultar</button>");
                                    out.print("</form>");

                                    if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion") != null) {
                                        String esp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString();

                                        if (esp != "Espectaculos..." && esp != null) {
                                            for (DtEspectaculo e : esps) {
                                                if (esp.equals(e.getNombre())) {

                                                    out.print("<img src='" + e.getImagen() + "' alt='imagen de espectaculo'>");
                                                    if (e.getVideo() != null) {
                                                        String[] parts = e.getVideo().split("v=");
                                                        out.print("<iframe width=\"400\" height=\"225\" src=\"https://www.youtube.com/embed/" + parts[1] + "\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>" + "</iframe>");
                                                    }
                                                    out.print("<h3> Nombre:" + e.getNombre() + "</h3>");

                                                    out.print("<p> Descripcion:" + e.getDescripcion() + "</p>");
                                                    out.print("<p> Duracion:" + e.getDuracion() + "</p>");
                                                    out.print("<p> Cantidad maxima espectadores:" + e.getCantidadMaximaEspectadores() + "</p>");
                                                    out.print("<p> Cantidad minima de espectadores:" + e.getCantidadMinimaEspectadores() + "</p>");
                                                    out.print("<p> URL:" + e.getUrl() + "</p>");
                                                    out.print("<p> Costo" + e.getCosto() + "</p>");
                                                    out.print("<p> Fecha de registro:" + e.getFechaDeRegistro() + "</p>");
//////////////////////////////////////////////////

                                                    List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString());
                                                    out.print("<form action=\"ConsultarFuncionBackEnd\">");
                                                    out.print("</br>");
                                                    out.print("</br>");
                                                    out.print("<h6>Seleccione Funcion:</h6>");
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

                                                    out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");

                                                    out.print("</form>");

                                                    if (contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion") != null) {
                                                        String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion").toString();

                                                        if (sfun != "Funciones..." && sfun != null) {
                                                            for (DtFuncion f : fun) {
                                                                if (sfun.equals(f.getNombre())) {
                                                                    out.print("<img src='" + f.getImagen() + "' alt='imagen de la funcion'>");
                                                                    out.print("<h3> Nombre:" + f.getNombre() + "</h3>");
                                                                    out.print("<p> Fecha:" + f.getFecha().toString() + "</p>");
                                                                    out.print("<p> Fecha de registro:" + f.getFechaDeRegistro().toString() + "</p>");
                                                                    out.print("<p> Hora de Inicio:" + f.getHoraInicio().toString() + "</p>");

                                                                    List<DtArtista> ars = Fabrica.getCtrlEspectaculos().getInvitados(contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion").toString());
                                                                    out.print("<form action=\"ConsultarFuncionBackEnd\">");
                                                                    out.print("</br>");
                                                                    out.print("</br>");
                                                                    out.print("<h6>Seleccione Artista Invitado:</h6>");
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

                                                                    out.print("<button class='btn btn-outline-secondarya' type='submit' disabled>Consultar</button>");
                                                                    out.print("</form>");

                                                                    ///////////////////////////////////////////////////////////////////////////////////////////
                                                                    if (contexto.getAttribute("ArtistaSeleccionadoEnConsultarFuncion") != null) {
                                                                        String sar = contexto.getAttribute("ArtistaSeleccionadoEnConsultarFuncion").toString();

                                                                        if (sar != "Seleccione..." && sar != null) {
                                                                            for (DtArtista a : ars) {
                                                                                if (sar.equals(a.getNickname())) {
                                                                                    out.print("<img src='" + a.getImagen() + "' alt='imagen del artista'>");
                                                                                    out.print("<h4> Nickname:" + a.getNickname() + "</h4>");
                                                                                    out.print("<p> Correo:" + a.getCorreo() + "</p>");
                                                                                    out.print("<p> Nombre:" + a.getNombre() + "</p>");
                                                                                    out.print("<p> Apellido:" + a.getApellido() + "</p>");
                                                                                    out.print("<p> Fecha de Nacimiento:" + a.getFechaNacimiento().toString() + "</p>");
                                                                                    out.print("<p> Link Web:" + a.getLinkWeb() + "</p>");
                                                                                    out.print("<p> Biografia:" + a.getBiografia() + "</p>");
                                                                                    out.print("<p> Descripcion:" + a.getDescripcion() + "</p>");

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

                } else if (contexto.getAttribute("tipoDeConsultaFunciones").toString().equals("Categorias")) {
                    out.print("<form action=\"ConsultarFuncionBackEnd\">");
                    out.print("</br>");
                    out.print("</br>");
                    out.print("<h6>Seleccione Categoria</h6>");

                    out.println("<select name=\"categoria\" id=\"inputGroupSelect04\">");

                    List<String> listaDeCat = Fabrica.getCtrlEspectaculos().listarCategorias();
                    if (contexto.getAttribute("CategoriaSeleccionadaEnConsultarFuncion") != null) {
                        String plat = contexto.getAttribute("CategoriaSeleccionadaEnConsultarFuncion").toString();
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

                    if (contexto.getAttribute("CategoriaSeleccionadaEnConsultarFuncion") != null) {
                        String plat = contexto.getAttribute("CategoriaSeleccionadaEnConsultarFuncion").toString();
                        if (plat != "Seleccione..." && plat != null) {
                            for (String c : listaDeCat) {
                                if (plat.equals(c)) {
                                    out.print("<h3> nombre:" + c + "</h3>");

                                    List<DtEspectaculo> esps = Fabrica.getCtrlEspectaculos().listarEspPorCat(c);
                                    out.print("<form action=\"ConsultarFuncionBackEnd\">");
                                    out.print("</br>");
                                    out.print("</br>");
                                    out.print("<h6>Seleccione Espectaculo:</h6>");
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

                                    out.print("<button class='btn btn-outline-secondarye' type='submit' disabled>Consultar</button>");
                                    out.print("</form>");

                                    if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion") != null) {
                                        String esp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString();

                                        if (esp != "Espectaculos..." && esp != null) {
                                            for (DtEspectaculo e : esps) {
                                                if (esp.equals(e.getNombre())) {

                                                    out.print("<img src='" + e.getImagen() + "' alt='imagen de espectaculo'>");
                                                    if (e.getVideo() != null) {
                                                        String[] parts = e.getVideo().split("v=");
                                                        out.print("<iframe width=\"400\" height=\"225\" src=\"https://www.youtube.com/embed/" + parts[1] + "\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>" + "</iframe>");
                                                    }
                                                    out.print("<h3> Nombre:" + e.getNombre() + "</h3>");
                                                    out.print("<p> Descripcion:" + e.getDescripcion() + "</p>");
                                                    out.print("<p> Duracion:" + e.getDuracion() + "</p>");
                                                    out.print("<p> Cantidad maxima espectadores:" + e.getCantidadMaximaEspectadores() + "</p>");
                                                    out.print("<p> Cantidad minima de espectadores:" + e.getCantidadMinimaEspectadores() + "</p>");
                                                    out.print("<p> URL:" + e.getUrl() + "</p>");
                                                    out.print("<p> Costo" + e.getCosto() + "</p>");
                                                    out.print("<p> Fecha de registro:" + e.getFechaDeRegistro() + "</p>");
//////////////////////////////////////////////////

                                                    List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFuncion").toString());
                                                    out.print("<form action=\"ConsultarFuncionBackEnd\">");
                                                    out.print("</br>");
                                                    out.print("</br>");
                                                    out.print("<h6>Seleccione Funcion:</h6>");
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

                                                    out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");

                                                    out.print("</form>");

                                                    if (contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion") != null) {
                                                        String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion").toString();

                                                        if (sfun != "Funciones..." && sfun != null) {
                                                            for (DtFuncion f : fun) {
                                                                if (sfun.equals(f.getNombre())) {
                                                                    out.print("<img src='" + f.getImagen() + "' alt='imagen de la funcion'>");
                                                                    out.print("<h3> Nombre:" + f.getNombre() + "</h3>");
                                                                    out.print("<p> Fecha:" + f.getFecha().toString() + "</p>");
                                                                    out.print("<p> Fecha de registro:" + f.getFechaDeRegistro().toString() + "</p>");
                                                                    out.print("<p> Hora de Inicio:" + f.getHoraInicio().toString() + "</p>");

                                                                    List<DtArtista> ars = Fabrica.getCtrlEspectaculos().getInvitados(contexto.getAttribute("FuncionSeleccionadaEnConsultarFuncion").toString());
                                                                    out.print("<form action=\"ConsultarFuncionBackEnd\">");
                                                                    out.print("</br>");
                                                                    out.print("</br>");
                                                                    out.print("<h6>Seleccione Artista Invitado:</h6>");
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

                                                                    out.print("<button class='btn btn-outline-secondarya' type='submit' disabled>Consultar</button>");
                                                                    out.print("</form>");

                                                                    ///////////////////////////////////////////////////////////////////////////////////////////
                                                                    if (contexto.getAttribute("ArtistaSeleccionadoEnConsultarFuncion") != null) {
                                                                        String sar = contexto.getAttribute("ArtistaSeleccionadoEnConsultarFuncion").toString();

                                                                        if (sar != "Seleccione..." && sar != null) {
                                                                            for (DtArtista a : ars) {
                                                                                if (sar.equals(a.getNickname())) {
                                                                                    out.print("<img src='" + a.getImagen() + "' alt='imagen del artista'>");
                                                                                    out.print("<h4> Nickname:" + a.getNickname() + "</h4>");
                                                                                    out.print("<p> Correo:" + a.getCorreo() + "</p>");
                                                                                    out.print("<p> Nombre:" + a.getNombre() + "</p>");
                                                                                    out.print("<p> Apellido:" + a.getApellido() + "</p>");
                                                                                    out.print("<p> Fecha de Nacimiento:" + a.getFechaNacimiento().toString() + "</p>");
                                                                                    out.print("<p> Link Web:" + a.getLinkWeb() + "</p>");
                                                                                    out.print("<p> Biografia:" + a.getBiografia() + "</p>");
                                                                                    out.print("<p> Descripcion:" + a.getDescripcion() + "</p>");

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

                }
            }


        %>

        <%@include file="headerScript.jsp"%>
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
    </div>
</body>


</html>

<%-- 
    Document   : Sorteos
    Created on : 25 oct. 2021, 12:03:37
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
        <div class="box">
        <%ServletContext contexto = getServletContext();%>
        <%

            List<DtEspectaculo> esps = Fabrica.getCrlUsuarios().listarEspectaculosDeArtista(contexto.getAttribute("nickname").toString());

            out.print("<form action=\"SorteosBackEnd\">");
            out.print("</br>");
            out.print("</br>");
            out.print("<h6>Seleccione Espectaculo:</h6>");
            out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
            if (contexto.getAttribute("EspectaculoSeleccionadoEnSorteos") == null) {
                out.print("<option selected>Espectaculos...</option>");

                for (DtEspectaculo e : esps) {
                    out.print("<option >" + e.getNombre() + "</option>");

                }
            } else {
                if (contexto.getAttribute("EspectaculoSeleccionadoEnSorteos").toString() != "Espectaculos...") {
                    out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadoEnSorteos").toString() + "</option>");

                    for (DtEspectaculo e : esps) {
                        if (!contexto.getAttribute("EspectaculoSeleccionadoEnSorteos").toString().equals(e.getNombre())) {
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
            if (contexto.getAttribute("EspectaculoSeleccionadoEnSorteos") != null) {
                String esp = contexto.getAttribute("EspectaculoSeleccionadoEnSorteos").toString();

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

                            List<DtFuncion> funQuePuedenTenerSorteo = Fabrica.getCtrlEspectaculos().listarFuncionesQuePuedenTenerSorteo(contexto.getAttribute("EspectaculoSeleccionadoEnSorteos").toString());
                            List<String> nombreFunQuePuedenTenerSorteo = new ArrayList<String>();
                            for (DtFuncion f : funQuePuedenTenerSorteo) {
                                nombreFunQuePuedenTenerSorteo.add(f.getNombre());
                            }

                            List<DtFuncion> funQueTienenSorteo = Fabrica.getCtrlEspectaculos().listarFuncionesQuePuedenTenerSorteo(contexto.getAttribute("EspectaculoSeleccionadoEnSorteos").toString());
                            List<String> nombreFunQueTienenSorteo = new ArrayList<String>();
                            for (DtFuncion f : funQuePuedenTenerSorteo) {
                            out.print("<h5> Nombre: " + f.getNombre() + "</h5>");
                                nombreFunQueTienenSorteo.add(f.getNombre());
                            }

                            List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadoEnSorteos").toString());
                            out.print("<form action=\"SorteosBackEnd\">");
                            out.print("</br>");
                            out.print("</br>");
                            out.print("<h6>Seleccione Funcion:</h6>");
                            out.print("<select name='funcion' class='custom-select selectEsp' id='inputGroupSelect04f'>");

                            if (contexto.getAttribute("FuncionSeleccionadaEnSorteos") == null) {
                                out.print("<option selected>Funciones...</option>");

                                for (DtFuncion f : fun) {
                                    out.print("<option >" + f.getNombre() + "</option>");

                                }
                            } else {
                                if (contexto.getAttribute("FuncionSeleccionadaEnSorteos").toString() != "Funciones...") {
                                    out.print("<option selected>" + contexto.getAttribute("FuncionSeleccionadaEnSorteos").toString() + "</option>");

                                    for (DtFuncion f : fun) {
                                        if (!contexto.getAttribute("FuncionSeleccionadaEnSorteos").toString().equals(f.getNombre())) {
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

                            if (contexto.getAttribute("FuncionSeleccionadaEnSorteos") != null) {
                                String sfun = contexto.getAttribute("FuncionSeleccionadaEnSorteos").toString();

                                if (sfun != "Funciones..." && sfun != null) {
                                    for (DtFuncion f : fun) {
                                        if (sfun.equals(f.getNombre())) {
                                            
                                            out.print("<h5> Nombre: " + f.getNombre() + "</h5>");
                                            out.print("<p> Fecha: " + f.getFecha().toString() + "</p>");
                                            out.print("<p> Fecha de registro: " + f.getFechaDeRegistro().toString() + "</p>");
                                            out.print("<p> Hora de inicio:" + f.getHoraInicio().toString() + "</p>");
                                            
                                            
                                            if (nombreFunQuePuedenTenerSorteo.contains(f.getNombre())) {
                                                out.print("<form action=\"SorteosBackEnd\">");
                                                out.print("<button class='btn btn-outline-secondaryf' type='submit' >Crear sorteo</button>");

                                                out.print("</form>");
                                            } else if (nombreFunQueTienenSorteo.contains(f.getNombre())) {
                                            List<DtEspectador> lEsp = Fabrica.getCtrlEspectaculos().listarGanadores(f.getNombre());
                                               
                                                 for (DtEspectador es : lEsp) {
                                                    out.print("<h3>Nickname" + es.getNickname() + "</h3>");
                                                    out.print("<p>Nombre:" + es.getNombre() + "</p>");
                                                    out.print("<p>Apellido:" + es.getApellido() + "</p>");
                                                    out.print("<p>Correo:" + es.getCorreo() + "</p>");

                                                }    

                                            } else {
                                                out.print("<p>Esta funcion no puede tener sorteo </p>");
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
</html>

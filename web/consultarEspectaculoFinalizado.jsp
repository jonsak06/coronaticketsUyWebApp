<%-- 
    Document   : consultarEspectaculoFinalizado
    Created on : 28 oct. 2021, 22:26:35
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
        <div class="box">
            <%ServletContext contexto = getServletContext();%>
            <%
                int unaEstrella = 0;
                int dosEstrellas = 0;
                int tresEstrellas = 0;
                int cuatroEstrellas = 0;
                int cincoEstrellas = 0;
                List<DtEspectaculo> lEspectac = Fabrica.getCrlUsuarios().listarEspectaculosFinalizadosDeArtista(contexto.getAttribute("nickname").toString());

                out.print("<form action=\"consultarEspectaculoFinalizadoBackEnd\">");
                out.print("</br>");
                out.print("</br>");
                out.print("<h6>Seleccione Espectaculo:</h6>");
                out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04e'>");
                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados") == null) {
                    out.print("<option selected>Espectaculos...</option>");

                    for (DtEspectaculo e : lEspectac) {
                        out.print("<option >" + e.getNombre() + "</option>");

                    }
                } else {
                    if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString() != "Espectaculos...") {
                        out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString() + "</option>");

                        for (DtEspectaculo e : lEspectac) {
                            if (!contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString().equals(e.getNombre())) {
                                out.print("<option >" + e.getNombre() + "</option>");

                            }

                        }
                    } else {
                        out.print("<option selected>Espectaculos...</option>");

                        for (DtEspectaculo e : lEspectac) {
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
                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados") != null) {
                    String esp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString();

                    if (esp != "Seleccione..." && esp != null) {
                        for (DtEspectaculo e : lEspectac) {
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
                            }
                        }
                    }
                }

            %>



            <script>
                const usus = document.getElementById("inputGroupSelect04");
                const botonConsultarUsu = document.querySelector(".btn-outline-secondary");
                usus.addEventListener("change", e => {
                    if (e.target.value === "Seleccione...") {
                        botonConsultarUsu.disabled = true;
                    } else {
                        botonConsultarUsu.disabled = false;
                    }
                });


            </script>

            <script>
                const regis = document.getElementById("inputGroupSelect04r");
                const botonConsultarReg = document.querySelector(".btn-outline-secondaryr");
                regis.addEventListener("change", e => {
                    if (e.target.value === "Seleccione...") {
                        botonConsultarReg.disabled = true;
                    } else {
                        botonConsultarReg.disabled = false;
                    }
                });

            </script>

            <script>
                const funs = document.getElementById("inputGroupSelect04f");
                const botonConsultarFun = document.querySelector(".btn-outline-secondaryf");
                funs.addEventListener("change", e => {
                    if (e.target.value === "Seleccione...") {
                        botonConsultarFun.disabled = true;
                    } else {
                        botonConsultarFun.disabled = false;
                    }
                });

            </script>

            <script>
                const paks = document.getElementById("inputGroupSelect04pak");
                const botonConsultarPak = document.querySelector(".btn-outline-secondarypak");
                paks.addEventListener("change", e => {
                    if (e.target.value === "Seleccione...") {
                        botonConsultarPak.disabled = true;
                    } else {
                        botonConsultarPak.disabled = false;
                    }
                });

            </script>

            <script>
                const usuSeguidoSelected = document.getElementById("inputGroupSelect04us");
                const botonConsultarUSS = document.querySelector(".btn-outline-secondaryus");
                usuSeguidoSelected.addEventListener("change", e => {
                    if (e.target.value === "Seleccione...") {
                        botonConsultarUSS.disabled = true;
                    } else {
                        botonConsultarUSS.disabled = false;
                    }
                });

            </script>

            <script>
                const usuQueTeSigueSelected = document.getElementById("inputGroupSelect04uts");
                const botonConsultarUTS = document.querySelector(".btn-outline-secondaryuts");
                usuQueTeSigueSelected.addEventListener("change", e => {
                    if (e.target.value === "Seleccione...") {
                        botonConsultarUTS.disabled = true;
                    } else {
                        botonConsultarUTS.disabled = false;
                    }
                });

            </script>
        </div>

    </body>
</html>

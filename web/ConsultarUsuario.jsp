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
                font-weight: 500
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

            .box input[type="submit"]:hover {
                background: #2ecc71
            }

            .forgot {
                text-decoration: underline
            }


            table {
                border-collapse: separate;
                border-spacing: 5px;
                background: #191919;
                color: #fff;
                margin: 0 auto;
            }
            td, th {
                background: #fff;
                color: #000;
            }
            .abajo
            {
                margin-top: 500px;
            }
            .abajoAr
            {
                margin-top: 800px;
            }

        </style>
        <script>
            var anterior = "nada";
            function ShowSelected()
            {

                var tablas = document.getElementsByTagName("table");
                for (x = 0; x < tablas.length; x++)
                {
                    tablas[x].style.display = "none";
                }



                /* Para obtener el texto */
                var funcion = document.getElementById("selectedFuncion");
                var selected = funcion.options[funcion.selectedIndex].text;
                alert(selected);

                document.getElementById(selected).style.display = "block";



            }
            EspectaculoSelected()
            {
                var tablas = document.getElementsByTagName("table");
                for (x = 0; x < tablas.length; x++)
                {
                    tablas[x].style.display = "none";
                }



                /* Para obtener el texto */
                var funcion = document.getElementById("selectedFuncion");
                var selected = funcion.options[funcion.selectedIndex].text;
                alert(selected);

                var seleccionadas = document.getElementsByClassName()(selected);
                for (x = 0; x < seleccionadas.length; x++)
                {
                    seleccionadas[x].style.display = "block";
                }


            }

        </script>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <form class="box" >

            <%
                ServletContext contexto = getServletContext();
                if (contexto.getAttribute("tipoUsuario") != null) {

                    if (contexto.getAttribute("tipoUsuario").equals("Espectador")) {

                        DtEspectador es = Fabrica.getCrlUsuarios().getDatosEspectador(contexto.getAttribute("nickname").toString());

                        out.print("<p name=\"/Tipo\"/>Espectador</p>");
                        out.print("<p>Nombre:" + es.getNombre() + "</p>");
                        out.print("<p>Apellido:" + es.getApellido() + "</p>");
                        out.print("<p>Nickname:" + es.getNickname() + "</p>");
                        out.print("<p>Correo:" + es.getCorreo() + "</p>");
                        out.print("<p>Fecha de nacimiento: " + es.getFechaNacimiento().toString() + "</p>");
            %>

            <select id="selectedFuncion" name="Funciones" onchange="ShowSelected();">
                <%
                    List<DtFuncion> funciones = Fabrica.getCrlUsuarios().getFuncionesRegistros(contexto.getAttribute("nickname").toString());
                    for (DtFuncion i : funciones) {
                        out.println("<option>" + i.getNombre() + "</option>");
                    }
                %>
            </select>
        </form>
<div class="abajo">        
            <%
                for (int i = 0; i < funciones.size(); i++) {
                    List<DtRegistro> r = Fabrica.getCrlUsuarios().getRegistros(contexto.getAttribute("nickname").toString());
                    out.print("<table id=\"" + funciones.get(i).getNombre() + "\" class=\"tabla\" name=\"tabla\" style=\"display:none;\" >");
                    out.print("<tr>");
                    out.print("<th>Nombre de la funcion</th>");
                    out.print("<th>Hora de inicio</th>");
                    out.print("<th>Estado del registro</th>");
                    out.print("<th>Costo del registro</th>");
                    out.print("<th>Fecha en el cual te registraste a la funcion</th>");
                    out.print("</tr>");
                    out.print("<tr>");
                    out.print("<td>" + funciones.get(i).getNombre() + "");
                    out.print("<td>" + funciones.get(i).getHoraInicio() + "");
                    out.print("<td>" + r.get(i).getEstado().toString() + "");
                    out.print("<td>" + r.get(i).getCosto() + "");
                    out.print("<td>" + r.get(i).getFecha().toString() + "");
                    out.print("</tr>");
                    out.print("</table>");
                }
            } else if (contexto.getAttribute("tipoUsuario").equals("Artista")) {
            %> 
          </div>
            <form class="box">

                <% DtArtista ar = Fabrica.getCrlUsuarios().getDatosArtista(contexto.getAttribute("nickname").toString());

                    out.print("<p name=\"/Tipo\"/>Artista</p>");
                    out.print("<p>Nombre:" + ar.getNombre() + "</p>");
                    out.print("<p>Apellido:" + ar.getApellido() + "</p>");
                    out.print("<p>Nickname:" + ar.getNickname() + "</p>");
                    out.print("<p>Correo:" + ar.getCorreo() + "</p>");
                    out.print("<p>Fecha de nacimiento: " + ar.getFechaNacimiento().toString() + "</p>");
                    out.print("<p>Link web: " + ar.getLinkWeb() + "</p>");
                    out.print("<p>Biografia: " + ar.getBiografia() + "</p>");
                    out.print("<p>Descripcion: " + ar.getDescripcion()+ "</p>");

                %>  

                <select id="selectedEspectaculo" name="Funciones" onchange="EspectaculoSelected();">
                    <%            List<DtEspectaculo> espectaculos = Fabrica.getCrlUsuarios().listarEspectaculosDeArtista(contexto.getAttribute("nickname").toString());
                        for (DtEspectaculo i : espectaculos) {
                            out.println("<option>" + i.getNombre() + "</option>");
                        }


                    %>
                </select>
            </form>
<div class="abajoAr">

            <%            for (int i = 0; i < espectaculos.size(); i++) {
                            if (i == 0) {
                                List<DtPaqueteDeEspectaculos> paquetes = Fabrica.getCrlUsuarios().listarPaquetesEspectaculosDeArtista("", espectaculos.get(i).getNombre());
                                List<DtFuncion> funciones = Fabrica.getCrlUsuarios().listarFuncionesEspectaculosDeArtista("", espectaculos.get(i).getNombre());

                                out.print("<table id=\"" + espectaculos.get(i).getNombre() + "\" class=\"" + espectaculos.get(i).getNombre() + "\" name=\"tabla\" style=\"display:block;\" >");
                                out.print("<tr>");
                                out.print("<th>Nombre</th>");
                                out.print("<th>Descripcion</th>");
                                out.print("<th>Esp Max</th>");
                                out.print("<th>Esp Min</th>");
                                out.print("<th>Costo</th>");
                                out.print("<th>URL</th>");
                                out.print("<th>Fecha de Registro</th>");
                                out.print("</tr>");
                                out.print("<tr>");
                                out.print("<td>" + espectaculos.get(i).getNombre() + "");
                                out.print("<td>" + espectaculos.get(i).getDescripcion() + "");
                                out.print("<td>" + espectaculos.get(i).getCantidadMaximaEspectadores() + "");
                                out.print("<td>" + espectaculos.get(i).getCantidadMinimaEspectadores() + "");
                                out.print("<td>" + espectaculos.get(i).getCosto() + "");
                                out.print("<td>" + espectaculos.get(i).getUrl() + "");
                                out.print("<td>" + espectaculos.get(i).getFechaDeRegistro().toString() + "");
                                out.print("</tr>");
                                out.print("</table>");

                                out.print("<table id=\"" + espectaculos.get(i).getNombre() + "\" class=\"" + espectaculos.get(i).getNombre() + "\" name=\"tabla\" style=\"display:block;\" >");
                                out.print("<tr>");
                                out.print("<th>Nombre</th>");
                                out.print("<th>Fecha y hora</th>");
                                out.print("</tr>");
                                for (DtFuncion u : funciones) {
                                    out.print("<tr>");
                                    out.print("<td>" + u.getNombre() + "");
                                    out.print("<td>" + u.getHoraInicio().toString() + "");
                                    out.print("</tr>");

                                }
                                out.print("</table>");

                                out.print("<table id=\"" + espectaculos.get(i).getNombre() + "\" class=\"" + espectaculos.get(i).getNombre() + "\" name=\"" + espectaculos.get(i).getNombre() + "\" style=\"display:block;\" >");
                                out.print("<tr>");
                                out.print("<th>Nombre</th>");
                                out.print("<th>Descripcion</th>");
                                out.print("<th>Inicio</th>");
                                out.print("<th>Fin</th>");
                                out.print("<th>Descuento</th>");
                                out.print("</tr>");
                                for (DtPaqueteDeEspectaculos p : paquetes) {
                                    out.print("<tr>");
                                    out.print("<td>" + p.getNombre() + "");
                                    out.print("<td>" + p.getDescripcion() + "");
                                    out.print("<td>" + p.getFechaInicio().toString() + "");
                                    out.print("<td>" + p.getFechaFin().toString() + "");
                                    out.print("<td>" + p.getDescuento() + "");
                                    out.print("</tr>");
                                }
                                out.print("</table>");

                            } else {
                                List<DtPaqueteDeEspectaculos> paquetes = Fabrica.getCrlUsuarios().listarPaquetesEspectaculosDeArtista("", espectaculos.get(i).getNombre());
                                List<DtFuncion> funciones = Fabrica.getCrlUsuarios().listarFuncionesEspectaculosDeArtista("", espectaculos.get(i).getNombre());

                                out.print("<table id=\"" + espectaculos.get(i).getNombre() + "\" class=\"" + espectaculos.get(i).getNombre() + "\" name=\"tabla\" style=\"display:none;\" >");
                                out.print("<tr>");
                                out.print("<th>Nombre</th>");
                                out.print("<th>Descripcion</th>");
                                out.print("<th>Esp Max</th>");
                                out.print("<th>Esp Min</th>");
                                out.print("<th>Costo</th>");
                                out.print("<th>URL</th>");
                                out.print("<th>Fecha de Registro</th>");
                                out.print("</tr>");
                                out.print("<tr>");
                                out.print("<td>" + espectaculos.get(i).getNombre() + "");
                                out.print("<td>" + espectaculos.get(i).getDescripcion() + "");
                                out.print("<td>" + espectaculos.get(i).getCantidadMaximaEspectadores() + "");
                                out.print("<td>" + espectaculos.get(i).getCantidadMinimaEspectadores() + "");
                                out.print("<td>" + espectaculos.get(i).getCosto() + "");
                                out.print("<td>" + espectaculos.get(i).getUrl() + "");
                                out.print("<td>" + espectaculos.get(i).getFechaDeRegistro().toString() + "");
                                out.print("</tr>");
                                out.print("</table>");

                                out.print("<table id=\"" + espectaculos.get(i).getNombre() + "\" class=\"" + espectaculos.get(i).getNombre() + "\" name=\"tabla\" style=\"display:none;\" >");
                                out.print("<tr>");
                                out.print("<th>Nombre</th>");
                                out.print("<th>Fecha y hora</th>");
                                out.print("</tr>");
                                for (DtFuncion u : funciones) {
                                    out.print("<tr>");
                                    out.print("<td>" + u.getNombre() + "");
                                    out.print("<td>" + u.getHoraInicio().toString() + "");
                                    out.print("</tr>");

                                }
                                out.print("</table>");

                                out.print("<table id=\"" + espectaculos.get(i).getNombre() + "\" class=\"" + espectaculos.get(i).getNombre() + "\" name=\"" + espectaculos.get(i).getNombre() + "\" style=\"display:none;\" >");
                                out.print("<tr>");
                                out.print("<th>Nombre</th>");
                                out.print("<th>Descripcion</th>");
                                out.print("<th>Inicio</th>");
                                out.print("<th>Fin</th>");
                                out.print("<th>Descuento</th>");
                                out.print("</tr>");
                                for (DtPaqueteDeEspectaculos p : paquetes) {
                                    out.print("<tr>");
                                    out.print("<td>" + p.getNombre() + "");
                                    out.print("<td>" + p.getDescripcion() + "");
                                    out.print("<td>" + p.getFechaInicio().toString() + "");
                                    out.print("<td>" + p.getFechaFin().toString() + "");
                                    out.print("<td>" + p.getDescuento() + "");
                                    out.print("</tr>");
                                }
                                out.print("</table>");
                            }
                        }
                    }
                }
            %>
        </div>

    </body>
</html>


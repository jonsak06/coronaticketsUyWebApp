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
        <style type="text/css">

            * {
                margin:0px;
                padding:0px;
            }

            #header {
                margin:auto;
                width:500px;
                height: 150px;
                font-family:Arial, Helvetica, sans-serif;
            }

            ul, ol {
                list-style:none;
            }

            .nav > li {
                float:left;
                margin-top: 50px;
            }

            .nav li a {
                background-color:#000;
                color:#fff;
                text-decoration:none;
                padding:10px 12px;
                display:block;
            }

            .nav li a:hover {
                background-color:#434343;
            }

            .nav li ul {
                display:none;
                position:absolute;
                min-width:140px;
            }

            .nav li:hover > ul {
                display:block;
            }

            .nav li ul li {
                position:relative;
            }

            .nav li ul li ul {
                right:-140px;
                top:0px;
            }

            .logo {

                width: 150px;
                height: 150px;
                float: left;
            }

            form {
                /* Centrar el formulario en la página */
                margin: 0 auto;
                width: 500px;
                /* Esquema del formulario */
                padding: 1em;
                border: 1px solid #CCC;
                border-radius: 1em;
            }


            ul {
                list-style: none;
            }

            form li + li {
                margin-top: 1em;
            }

            label {
                /* Tamaño y alineación uniforme */
                display: inline-block;
                width: 90px;
                text-align: right;
            }
            input{
                margin: 0 auto;
            }
            input,
            textarea {
                /* Para asegurarse de que todos los campos de texto tienen la misma configuración de letra
                   Por defecto, las áreas de texto tienen un tipo de letra monoespaciada */
                font: 1em sans-serif;

                /* Tamaño uniforme del campo de texto */
                width: 300px;
                box-sizing: border-box;

                /* Hacer coincidir los bordes del campo del formulario */
                border: 1px solid #999;
            }

            input:focus,
            textarea:focus {
                /* Destacado adicional para elementos que tienen el cursor */
                border-color: #000;
            }

            textarea {
                /* Alinear los campos de texto multilínea con sus etiquetas */
                vertical-align: top;

                /* Proporcionar espacio para escribir texto */
                height: 5em;
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
        <img class="logo" src="/coronaticketsUyWebApp/img/logo.jpeg"/>
        <div id="header">
            <ul class="nav">
                <li><a href="/coronaticketsUyWebApp/login.jsp">Iniciar Sesion</a></li>
                <li><a href="">Usuarios</a>
                    <ul>
                        <li><a href="/coronaticketsUyWebApp/altaUsuario.jsp">Alta Usuario</a></li>
                        <li><a href="">Modificar Usuario</a></li>
                        <li><a href="">Consultar Usuario</a></li>

                </li>
            </ul>
        </li>
        <li><a href="">Acerca de</a>
            <ul>
                <li><a href="">Submenu1</a></li>
                <li><a href="">Submenu2</a></li>
                <li><a href="">Submenu3</a></li>
                <li><a href="">Submenu4</a></li>
            </ul>
        </li>
        <li><a href="">Contacto</a></li>
    </ul>
</div>
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
<form>
    <select id="selectedFuncion" name="Funciones" onchange="ShowSelected();">
        <%
            List<DtFuncion> funciones = Fabrica.getCrlUsuarios().getFuncionesRegistros(contexto.getAttribute("nickname").toString());
            for (DtFuncion i : funciones) {
                out.println("<option>" + i.getNombre() + "</option>");
            }
        %>
    </select>
</form>
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

    DtArtista ar = Fabrica.getCrlUsuarios().getDatosArtista(contexto.getAttribute("nickname").toString());

    out.print("<p name=\"/Tipo\"/>Espectador</p>");
    out.print("<p>Nombre:" + ar.getNombre() + "</p>");
    out.print("<p>Apellido:" + ar.getApellido() + "</p>");
    out.print("<p>Nickname:" + ar.getNickname() + "</p>");
    out.print("<p>Correo:" + ar.getCorreo() + "</p>");
    out.print("<p>Fecha de nacimiento: " + ar.getFechaNacimiento().toString() + "</p>");

%>  
<form>
    <select id="selectedEspectaculo" name="Funciones" onchange="EspectaculoSelected();">
        <%            List<DtEspectaculo> espectaculos = Fabrica.getCrlUsuarios().listarEspectaculosDeArtista(contexto.getAttribute("nickname").toString());
            for (DtEspectaculo i : espectaculos) {
                out.println("<option>" + i.getNombre() + "</option>");
            }


        %>
    </select>
</form>


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
</body>
</html>


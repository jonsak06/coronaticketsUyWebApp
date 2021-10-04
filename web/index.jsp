<%-- 
    Document   : test
    Created on : Sep 16, 2021, 10:43:40 PM
    Author     : julio
--%>

<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iUsuarios"%>
<%@page import="javax.servlet.ServletContext"%>
<%@page import="java.util.List"%>
<%@page import="root.entidades.Espectador"%>
<%@page import="javax.persistence.*"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CoronaTicketsUy</title>
        <style type="text/css">

            * {
                margin:0px;
                padding:0px;
            }

            #header {

                padding: 40px;
                position: absolute;
                left: 23%;
                /*margin:auto;*/
                width:1000px;
                font-family:Arial, Helvetica, sans-serif;
            }

            ul, ol {
                list-style:none;
            }

            .nav > li {
                float:left;
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

        </style>
    </head>
    <body>
        <%ServletContext contexto = getServletContext();%>
        <div id="header">
            <ul class="nav">
                <li><a href="/coronaticketsUyWebApp/login.jsp"<%contexto.setAttribute("vaHacia", "/index.jsp");%>>Iniciar Sesion</a></li>
                <li><a <% if (contexto.getAttribute("tipoUsuario") == null)
                        out.print("href=\"/coronaticketsUyWebApp/altaUsuario.jsp\"");%> ><%
                    if (contexto.getAttribute("tipoUsuario") != null) {
                        out.println(contexto.getAttribute("nickname"));
                                    } else {
                                        out.print("Registrate");
                                    }%></a></li>
                <li><a href="">Servicios</a>
                    <ul>

                        <%
                            if (contexto.getAttribute("tipoUsuario") == null) {
                                contexto.setAttribute("vaHacia", "/registroEspectadorFuncion.jsp");
                                out.print("<li><a href=\"/coronaticketsUyWebApp/login.jsp\">Registrarse a una función de un espectáculo</a></li>");
                            } else if (contexto.getAttribute("tipoUsuario").equals("Espectador")) {
                                out.print("<li><a href=\"/coronaticketsUyWebApp/modificarUsuario.jsp\">Modificar Usuario</a></li>");
                                out.print("<li><a href=\"/coronaticketsUyWebApp/seguirUsuario.jsp\">seguirUsuario</a></li>");

                                out.print("<li><a href=\"/coronaticketsUyWebApp/registroEspectadorFuncion.jsp\">Registrarse a una función de un espectáculo</a></li>");
                            } else {
                                out.print("<li><a href=\"/coronaticketsUyWebApp/modificarUsuario.jsp\">Modificar Usuario</a></li>");
                                out.print("<li><a href=\"/coronaticketsUyWebApp/seguirUsuario.jsp\">seguirUsuario</a></li>");

                                out.print("<li><a href=\"/coronaticketsUyWebApp/artistaError.jsp\">Registrarse a una función de un espectáculo</a></li>");
                                out.print("<li><a href=\"/coronaticketsUyWebApp/altaEspectaculo.jsp\">Ingresar nuevo Espectáculo</a></li>");

                            }
                        %>
                        <li><a href="/coronaticketsUyWebApp/altaUsuario.jsp">alta usuario</a></li>
                        <li><a href="/coronaticketsUyWebApp/AltaFUncion.jsp">Alta de Funcion</a>

                            <ul>
                                <li><a href="">Submenu1</a></li>
                                <li><a href="">Submenu2</a></li>
                                <li><a href="">Submenu3</a></li>
                                <li><a href="">Submenu4</a></li>
                            </ul>
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
                <li><a href="/coronaticketsUyWebApp/cerrarSesion.jsp">Cerrar Sesion</a></li>
            </ul>
        </div>
    </body>
</html>

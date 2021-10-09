<%-- 
    Document   : AltaFuncion
    Created on : Oct 2, 2021, 1:32:09 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!--        <style type="text/css">

            * {
                margin:px;
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

        </style>-->
        <link rel="stylesheet" href="headerStyles.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
<!--        <div id="header">
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
</div>-->

<script>
    function linkPlataformas() {
          var espectaculos = document.getElementsByClassName("espectaculos");
           for (i=0; i<espectaculos.length; i++){
               espectaculos[i].style.display = "none";
           }
            var aux=document.getElementById("Plataformas");
            var selected=aux.options[aux.selectedIndex].text;
            alert(selected);
            document.getElementById(selected).style.display="block";
    }
    
    function confirmarArtista() {
        
        
        
    }
    
    
    
</script>
<form action="AltaFuncionBackEnd"  name="fAltadeFuncion" id="" method="POST">

<select id="Plataformas" onchange="linkPlataformas()">
    <%
        ServletContext contexto = getServletContext();

        List<DtPlataforma> plat = Fabrica.getCtrlEspectaculos().listarPlataformas();
        for (DtPlataforma i : plat) {
            out.print("<option> " + i.getNombre() + " </option>");
        }
    %>
</select>


<%
    for (DtPlataforma i : plat) {
        List<DtEspectaculo> pespectaculos = Fabrica.getCtrlEspectaculos().listarEspectaculos(i.getNombre());
        List<DtEspectaculo> espec = Fabrica.getCrlUsuarios().listarEspectaculosDeArtista(contexto.getAttribute("nickname").toString());
        out.print("<select id=\"" + i.getNombre() + "\" style=\"display:none;\" name=\"espectaculos\" class=\"espectaculos\"> ");
        
        for (DtEspectaculo pe : pespectaculos) {
            for (DtEspectaculo e : espec) {
                if (e.getNombre().equals(pe.getNombre())) {
                    out.print("<option> " + e.getNombre() + " </option>");
                }
            }
        }
        out.print("</select> ");
        
    }

%>

<p>Nombre:<input type="text" name="nombre" value="" id="nombre" size="30" /></p>

<p>Fecha: <input type="date" name="fecha" id="fecha"></p>

<p>Hora de Inicio: <input type="time" name="hora" value="11:45" step="1"/></p>

<p> Artistas Invitados </p>
    <%
        
        ServletContext contexto1 = getServletContext();
        List<String> liart = new ArrayList<String>();
        List<String> lisDelInput = new ArrayList<String>();
        List<DtArtista> dtArtistas = Fabrica.getCrlUsuarios().getArtistas();
        for (DtArtista i : dtArtistas) {
            out.print("<label><input name=\""+ i.getNickname() +"\" type=\"checkbox\" value=\"true\"> "+ i.getNickname() +"</label><br>");
        }
         
    %>
    





<p>Fecha de Alta: <input type="date" name="fechaA" id="FechadeAlta"></p>

<input type="file" name="Imagen" size="150"/>

<input type="submit" name="" value="crear">



</form>
<%@include file="headerScript.jsp"%>
</body>
</html>

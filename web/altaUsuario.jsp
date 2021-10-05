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

        
        <script>
            function sart() {
                document.getElementById("tBiografia").style.display = "block";
                document.getElementById("tfBiografia").style.display = "block";
                document.getElementById("tfLink").style.display = "block";
                document.getElementById("tLink").style.display = "block";
                document.getElementById("tDescripcion").style.display = "block";
                document.getElementById("tfDescripcion").style.display = "block";
            }
            function sesp() {
                document.getElementById("tBiografia").style.display = "none";
                document.getElementById("tfBiografia").style.display = "none";
                document.getElementById("tfLink").style.display = "none";
                document.getElementById("tLink").style.display = "none";
                document.getElementById("tDescripcion").style.display = "none";
                document.getElementById("tfDescripcion").style.display = "none";
            }

        </script>
    </head>
    <body>
        
        <%@include file="header.jsp" %>
        <link rel="stylesheet" href="./miestilo.css" type="text/css">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

        <form action="AltaUsuariosBackEnd" class="box" name="fAltaUsuario" id="fAltaUsuario" method="POST">
            <p>Tipo Usuario:
                <input type="radio" name="us" value="e" id="us" onclick="sesp()"> Espectador
                <input type="radio" name="us" value="a" id="us" onclick="sart()"> Artista
            </p>

            <p>Nombre:</p>
            <input type="text" name="nombre" value="" id="nombre" />

            <p>Apellido:</p>
            <input type="text" name="apellido" value="" id="apellido"  />

            <p>Nickname:</p>
            <input type="text" name="nickname" value="" id="nickname"/>

            <p>Correo:</p>
            <input type="text" name="correo" value="" id="correo" />

            <p>Contraseña:</p>
            <input type="password" name="contrasenia" id="contrasenia" value="" />

            <p>Confirmar contraseña:</p>
            <input type="password" name="contraseniaC" id="cContraseña" value="" />

            <p>Fecha: </p>
            <input type="date" name="fecha" id="fecha">

            <p style="display:none;" id="tLink">Link web:</p>
            <input type="text" name="link" value="" id="tfLink"  style="display:none;" />

            <p style="display:none;" id="tBiografia">Biografia:</p>
            <textarea name="biografia" id="tfBiografia"  style="display:none; margin: 0 auto;">
            </textarea>

            <p style="display:none;" id="tDescripcion">Descripcion:</p>
            <textarea name="descripcion" id="tfDescripcion"  style="display:none; margin: 0 auto;">
            </textarea>

            <input type="file" name="Imagen" size="150"/>

            <input type="submit" name="" value="crear">


        </form>
                    </div>
            </div>
        </div>
    </body>
</html>


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
            .input-group {
                margin-top: 20px;
                width: 100%;
            }
            .custom-select {
                width: 90%;
            }
            .infoPaquete {
                margin-top: 20px;
                width: 25%;
            }
            .selectEsp{
                width: 100%;
                height: 100%;
            }
        </style>
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

        <form action="AltaUsuariosBackEnd"  name="fAltaUsuario" id="fAltaUsuario" method="POST">
            <p>Tipo Usuario:
                <input type="radio" name="us" value="e" id="us" onclick="sesp()"> Espectador
                <input type="radio" name="us" value="a" id="us" onclick="sart()"> Artista
            </p>

            <p>Nombre:<input type="text" name="nombre" value="" id="nombre" size="30" /></p>

            <p>Apellido:<input type="text" name="apellido" value="" id="apellido" size="30" /></p>

            <p>Nickname:<input type="text" name="nickname" value="" id="nickname" size="30" /></p>

            <p>Correo:<input type="text" name="correo" value="" id="correo" size="30" /></p>

            <p>Contraseña:<input type="password" name="contrasenia" id="contrasenia" value="" size="30" /></p>

            <p>Confirmar contraseña:<input type="password" name="contraseniaC" id="cContraseña" value="" size="30" /></p>

            <p>Fecha: <input type="date" name="fecha" id="fecha"></p>

            <p style="display:none;" id="tLink">Link web:<input type="link" name="link" value="" id="tfLink" size="30" style="display:none;" /></p>

            <p style="display:none;" id="tBiografia">Biografia:</p>
            <textarea name="biografia" id="tfBiografia" rows="4" cols="30" style="display:none;">
            </textarea>

            <p style="display:none;" id="tDescripcion">Descripcion:</p>
            <textarea name="descripcion" id="tfDescripcion" style="display:none;" rows="4" cols="30">
            </textarea>

            <input type="file" name="Imagen" size="150"/>

            <input type="submit" name="" value="crear">


        </form>
    </body>
</html>


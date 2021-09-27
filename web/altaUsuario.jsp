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
        <script>

            var getData = function () {
                var nombre = document.getElementById("nombre").value;
                var apellido = document.getElementById("apellido").value;
                var nickname = document.getElementById("nickname").value;
                var correo = document.getElementById("correo").value;
                var contrasenia = document.getElementById("contrasenia").value;
                var fecha = document.getElementById("fecha").value;
                var imagen = "";
                var id = 0;
                var canjeables = 0;

                DtEspectador es = new DtEspectador(canjeables, id, nombre, apellido, correo, nickname, imagen, fecha, contrasenia);

                Fabrica.getCrlUsuarios().altaEspectador(es);


            }


        </script>  
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
<form name="Form" id="form">
    <p>Tipo Usuario:
        <input type="radio" name="hm" value="e" id="TipoUsuario"> Espectador
        <input type="radio" name="hm" value="a" id="TipoUsuario"> Artista
    </p>

    <p>Nombre:<input type="text" name="nombre" value="" id="nombre" size="30" /></p>

    <p>Apellido:<input type="text" name="apellido" value="" id="apellido" size="30" /></p>

    <p>Nickname:<input type="text" name="nickname" value="" id="nickname" size="30" /></p>

    <p>Correo:<input type="text" name="correo" value="" id="correo" size="30" /></p>

    <p>Contraseña:<input type="password" name="contrasenia" id="contrasenia" value="" size="30" /></p>

    <p>Confirmar contraseña:<input type="password" name="contraseniaC" id="cContraseña" value="" size="30" /></p>

    <p>Fecha: <input type="date" name="fecha" id="fecha"></p>

    <p>Link web:<input type="password" name="link" value="" size="30" /></p>

    <p>Biografia:</p>
    <textarea name="biografia" rows="4" cols="30">
    </textarea>

    <p>Descripcion:</p>
    <textarea name="descripcion" rows="4" cols="30">
    </textarea>

    <input type="file" name="Imagen" size="150"/>

    <button type="button" onclick="getData()"> Enviar </button>


</form>
</body>
</html>

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
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="headerStyles.css">

        <script>
            if(${creadoUs == true}) {
                alert("Usuario creado");
            }
            var tus;
            tus = 0;
            function sart() {
                tus = 2;
                document.getElementById("tBiografia").style.display = "block";
                document.getElementById("tfBiografia").style.display = "block";
                document.getElementById("tfLink").style.display = "block";
                document.getElementById("tLink").style.display = "block";
                document.getElementById("tDescripcion").style.display = "block";
                document.getElementById("tfDescripcion").style.display = "block";
            }
            function sesp() {
                tus = 1;
                document.getElementById("tBiografia").style.display = "none";
                document.getElementById("tfBiografia").style.display = "none";
                document.getElementById("tfLink").style.display = "none";
                document.getElementById("tLink").style.display = "none";
                document.getElementById("tDescripcion").style.display = "none";
                document.getElementById("tfDescripcion").style.display = "none";
            }

        </script>
        <link rel="stylesheet" href="./miestilo.css" type="text/css">
        <style>
            .box textarea {
                border: 0;
                background: none;
                display: block;
                margin: 20px auto;
                text-align: center;
                border: 2px solid #3498db;
                padding: 10px 10px;
                width: 300px;
                height: 300px;
                outline: none;
                color: white;
                border-radius: 24px;
                transition: 0.25s
            }

            .box textarea:focus {
                width: 250px;
                height: 250px;
                border-color: #2ecc71
            }
            .box input[type="date"] {
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
            .box input[type="date"]:focus {
                width: 200px;
                border-color: #2ecc71
            }

            .box input[type="file"] {
                border: 0;
                background: none;
                display: block;
                margin: 20px auto;
                text-align: center;
                border: 2px solid #3498db;
                padding: 10px 10px;
                width: 350px;
                outline: none;
                color: white;
                border-radius: 24px;
                transition: 0.25s
            }
            .box input[type="file"]:focus {
                width: 300px;
                border-color: #2ecc71
            }

        </style>
    </head>
    <body>
        <%
            List<DtArtista> lAr = Fabrica.getCrlUsuarios().getArtistas();
            List<DtEspectador> lEs = Fabrica.getCrlUsuarios().getEspectadores();
            List<String> lUsN = new ArrayList<String>();
            for (DtArtista a : lAr) {
                lUsN.add(a.getNickname());
            }
            for (DtEspectador e : lEs) {
                lUsN.add(e.getNickname());
            }
            List<String> lUsC = new ArrayList<String>();
            for (DtArtista a : lAr) {
                lUsC.add(a.getCorreo());
            }
            for (DtEspectador e : lEs) {
                lUsC.add(e.getCorreo());
            }
            Gson gson = new Gson();
            String jsonUsN = gson.toJson(lUsN);
            String jsonUsC = gson.toJson(lUsC);
        %>
        <%@include file="header.jsp" %>

        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <form action="AltaUsuariosBackEnd" enctype="multipart/form-data" class="box" name="fAltaUsuario" id="fAltaUsuario" method="POST">
                        <p>Tipo Usuario:
                            <input type="radio" name="us" value="e" id="use" onclick="sesp()"> Espectador
                            <input type="radio" name="us" value="a" id="usa" onclick="sart()"> Artista
                        </p>

                        <p>Nombre:</p>
                        <input type="text" name="nombre" value="" id="nombre" required/>

                        <p>Apellido:</p>
                        <input type="text" name="apellido" value="" id="apellido"  required/>

                        <p>Nickname:</p>
                        <input type="text" name="nickname" value="" id="nickname" required/>

                        <p>Correo:</p>
                        <input type="text" name="correo" value="" id="correo" required/>

                        <p>Contraseña:</p>
                        <input type="password" name="contrasenia" id="contrasenia" value="" required/>

                        <p>Confirmar contraseña:</p>
                        <input type="password" name="contraseniaC" id="cContrasenia" value="" required/>

                        <p>Fecha: </p>
                        <input type="date" name="fecha" id="fecha" required>

                        <p style="display:none;" id="tLink">Link web:</p>
                        <input type="text" name="link" value="" id="tfLink"  style="display:none;" />

                        <p style="display:none;" id="tBiografia">Biografia:</p>
                        <textarea name="biografia" id="tfBiografia"  style="display:none; margin: 0 auto;">
                        </textarea>

                        <p style="display:none;" id="tDescripcion">Descripcion:</p>
                        <textarea name="descripcion" id="tfDescripcion"  style="display:none; margin: 0 auto;">
                        </textarea>
                        <p>Imagen: </p>
                        <input type="file" name="imagen" size="150" id="imagen"/>


                        <input type="submit" name="" value="crear" id="crear">


                    </form>
                    <script>
                        const botonCrearPaq = document.getElementById("crear");
                        const jsonUsN = <%=jsonUsN%>;
                        const jsonUsC = <%=jsonUsC%>;
                        botonCrearPaq.addEventListener("click", e => {
                            if (tus == 0)
                            {
                                e.preventDefault();
                                alert("Debes seleccionar el tipo de usuario");
                            }
                            if (document.getElementById("cContrasenia").value != document.getElementById("contrasenia").value)
                            {
                                e.preventDefault();
                                alert("Las contrasenias tienen que ser iguales");
                            }
                            if (jsonUsN.includes(document.getElementById("nickname").value)) {
                                e.preventDefault();
                                alert("El nickname ya existe");
                            }
                            if (jsonUsC.includes(document.getElementById("correo").value)) {
                                e.preventDefault();
                                alert("El correo ya esta usado");
                            }if(document.getElementById("correo").value.includes(".@")||document.getElementById("correo").value.includes("@.")||!document.getElementById("correo").value.includes("@")||!document.getElementById("correo").value.includes("."))
                            {
                                e.preventDefault();
                                alert("El correo es invalido");
                            }if(tus==2&&!document.getElementById("tfLink").value.includes(".")&&!document.getElementById("tfLink").value=="" )
                            {
                                e.preventDefault();
                                alert("link invalido");
                            }
                            
                        });

                    </script>
                    <%@include file="headerScript.jsp"%>
                </div>
            </div>
        </div>
    </body>
</html>


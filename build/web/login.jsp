<%-- 
    Document   : login
    Created on : Sep 21, 2021, 5:00:48 PM
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String nickname;%>
<%!String tipoUsuario;%>
<html>
<!--    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
        <form action="pasajeaLogin" name="pasajeaLogin" method="POST">
            <li>Nickname: </li><input type="text" name="nick" value="" />
            <li>Password:</li><input type="password" name="pass" value="" />
            <input type="submit" value="Ingresar" />
        </form>
    </body>-->
<div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <form action="pasajeaLogin" name="pasajeaLogin" method="POST" class="box">
                    <h1>Login</h1>
                    <p class="text-muted">Ingresa tu nickname y tu contraseña!</p> <input type="text" name="nick" placeholder="Nickname"> <input type="password" name="" placeholder="Contrase;a"> <a class="forgot text-muted" href="index.jsp">Olvidaste tu contraseña?</a> <input type="submit" name="" value="Login">
                </form>
            </div>
        </div>
    </div>
</div>
</html>

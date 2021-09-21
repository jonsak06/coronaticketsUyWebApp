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
    <head>
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
    </body>
</html>

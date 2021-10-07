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
        <title>Comprar Paquete</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    </head>
	<body>
            <%@include file="header.jsp" %>
            <%ServletContext contexto = getServletContext();%>
<div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <form action="pasajeaLogin" name="pasajeaLogin" method="POST" class="box">
                    <h1>Login</h1>
                    <p class="text-muted">Ingresa tu nickname y tu contraseña!</p> <input type="text" name="nick" placeholder="Nickname"> <input type="password" name="pass" placeholder="Contraseña"> <a class="forgot text-muted" href="index.jsp">Olvidaste tu contraseña?</a> <input type="submit" name="" value="Login">
                </form>
            </div>
        </div>
    </div>
</div>
        </body>
</html>

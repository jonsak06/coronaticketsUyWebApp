<%-- 
    Document   : artistaError
    Created on : Sep 25, 2021, 9:41:50 AM
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprar Paquete</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
                <link rel="stylesheet" href="headerStyles.css">
    </head>
	<body>
            <%@include file="header.jsp" %>
            <%ServletContext contexto = getServletContext();%>
                <div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
    <div class="row">
    <div class="col-md-12">
    <div class="card">                          
        <form action="CerrarSesion" method="POST" class="box">
            <h1>No estas en el lugar indicado!</h1>
            <p>Para poder registrarte a una función de un espectáculo debes iniciar sesión como espectador!</p>
            <p>Vuelve para Iniciar Sesión nuevamente</p> 
            
            <a href="/coronaticketsUyWebApp/login.jsp"/>Volvera a Iniciar Sesion</a>
        </form>
    </div>
    </div>
    </div>
            
    <%@include file="headerScript.jsp"%>
            

    </body>
</html>

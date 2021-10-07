<%-- 
    Document   : funcionrepetida
    Created on : Oct 3, 2021, 9:25:59 AM
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <form action = "" name=" " method="POST" class="box">
            <h1>YA ESTAS REGISTRADO A ESTA FUNCION</h1>
            <p class = "text-unmuted">Vuelve para elegir otra</p>
            <a href="/coronaticketsUyWebApp/registroEspectadorFuncion.jsp">Volver</a>
            
        </form>
    </div>
    </div>
    </div>
    </body>
</html>

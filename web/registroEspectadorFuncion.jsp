<%-- 
    Document   : registroEspectadorFuncion
    Created on : Sep 21, 2021, 12:30:39 PM
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
                <form action = "listarEspectaculos" name="listarEspectaculos" method="POST" class = "box">
                    <h1>Búsqueda de Espectáculos</h1>
                    <input type="text" name="plataforma" value="" placeholder="Buscar por Plataforma o Categoria"/><input type="submit" value="Listar" />
                </form>
            </div>
        </div>
    </div>
    </div>
        </body>
</html>

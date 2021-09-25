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
    </head>
        <%
            ServletContext contexto = getServletContext();
            out.print("<li>"+contexto.getAttribute("nickname")+"<li>");
        %>

    <div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <form action = "listarEspectaculos" name="listarEspectaculos" method="POST" class = "box">
                    <h1>Búsqueda de Espectáculos</h1>
                    <input type="text" name="plataforma" value="" placeholder="Buscar por Plataforma"/><input type="submit" value="Listar" />
                </form>
            </div>
        </div>
    </div>
    </div>
</html>

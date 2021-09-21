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
        <title>Registrarse a una Funcion</title>
    </head>
    <body>
        <%
            ServletContext contexto = getServletContext();
            out.print("<li>"+contexto.getAttribute("nickname")+"<li>");
        %>
        <form action = "listarEspectaculos" name="listarEspectaculos" method="POST">
            <input type="text" name="plataforma" value="" /><input type="submit" value="Listar" />
        </form>
    </body>
</html>

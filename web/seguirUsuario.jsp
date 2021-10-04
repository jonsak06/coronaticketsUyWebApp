<%-- 
    Document   : seguirUsuario
    Created on : 4 oct. 2021, 11:57:12
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
    </head>
    <body>
        <form action="action">
        <%
    ServletContext contexto = getServletContext();
    if (contexto.getAttribute("tipoUsuario") != null) {

        if (contexto.getAttribute("tipoUsuario").equals("Espectador")) {
             List<DtUsuario> usNo=Fabrica.getCrlUsuarios().getUsuariosQueNoSiguesEs(contexto.getAttribute("nickname").toString());
        %>
        <select>
        <%    
            for(DtUsuario i: usNo){
                out.println("<option>" + i.getNickname() + "</option>");
            }
            %>
        </select>
        </form>
        <% 
    }
%>


<%
           
    }
%>
    </body>
</html>

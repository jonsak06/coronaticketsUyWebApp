<%-- 
    Document   : verPremiosEspecrador
    Created on : 27 oct. 2021, 11:07:22
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
        <%ServletContext contexto = getServletContext();%>
        <%

            List<DtPremio> lpre= Fabrica.getCrlUsuarios().getPremiosDelEspectador(contexto.getAttribute("nickname").toString());
            for(DtPremio p: lpre){
                out.print("<p>"+p.getNombre()+"<p>");
                out.print("<p>"+p.getDescripcion()+"<p>");
                out.print("</br>");
            }

        %>
    </body>
</html>

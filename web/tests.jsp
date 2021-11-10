<%-- 
    Document   : tests
    Created on : Nov 10, 2021, 9:14:45 AM
    Author     : julio
--%>

<%@page import="webservices.DtEspectaculo"%>
<%@page import="root.interfaces.iDatosDePrueba"%>
<%@page import="java.util.List"%>
<%@page import="webservices.DtEspectador"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p>Web Services corriendo estos son nuestros espectadores</p>
        <%
//        iDatosDePrueba idp = Fabrica.getDatosDePrueba();
//        idp.cargarDatos();
//        iUsuarios iu = Fabrica.getCrlUsuarios();
//        List<DtEspectador> result = iu.getEspectadores();
//        for(DtEspectador e : result){
//        out.println("<p>"+e.getNombre()+"</p>");
//        }
           List<DtEspectaculo> result = Fabrica.getCtrlEspectaculos().listarTodosLosEspectaculos();
           for(DtEspectaculo e: result){
           out.println("<p>"+e.getNombre()+"</p>");
           }
        %>
    </body>
</html>

<%-- 
    Document   : indexMovil
    Created on : Oct 21, 2021, 4:29:23 PM
    Author     : dexion
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <%
        iRegistrosAcceso ir = Fabrica.getCtrlRegistrosAcceso();
        long moment = new java.util.Date().getTime();
        DtRegistroAcceso r = new DtRegistroAcceso(0,java.net.InetAddress.getLocalHost().getHostAddress(),request.getHeader("User-Agent"),request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"+request.getServletPath().substring(request.getServletPath().lastIndexOf("/") +1),moment);
        ir.ingresarRegistro(r);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CoronaTicketsUy</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <style>
            body {
                background: #2d2d2d;
                color: white;
            }
            .modal {
                color: black;
            }
        </style>
    </head>
    <body>
        <% 
            try {
                ServletContext contexto = getServletContext();
                String tipoUsr = contexto.getAttribute("tipoUsuario").toString();
                if(!tipoUsr.equals("Espectador")) {
                    response.sendRedirect("loginMovil.jsp");
                }
            } catch(Exception e) {
                response.sendRedirect("loginMovil.jsp");
            }
        %>
        <%@include file="headerMovil.jsp"%>
        <h1 style="text-align: center; margin-top: 30px;">Bienvenido!</h1>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        
    </body>
</html>

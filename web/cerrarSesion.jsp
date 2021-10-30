<%-- 
    Document   : cerrarSesion
    Created on : Sep 25, 2021, 10:54:30 AM
    Author     : julio
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
            <h1>Cerrar Sesión</h1>
            <input type="submit" value="SI" />
        </form>
    </div>
    </div>
    </div>
            
            
    <%@include file="headerScript.jsp"%>
    </body>
</html>

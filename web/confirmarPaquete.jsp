<%-- 
    Document   : confirmarPaquete
    Created on : Oct 6, 2021, 4:03:18 PM
    Author     : julio
--%>

<%@page import="root.datatypes.DtFuncion"%>
<%@page import="root.datatypes.DtFuncion"%>
<%@page import="root.interfaces.IEspectaculos"%>
<%@page import="root.fabrica.Fabrica"%>
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
        <form action = "finalizarRegistro" name=" " method="POST" class="box">
            <h1>Desea confirmar?</h1>
            <%
                IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                DtFuncion funcion = ie.getDatosFuncion(contexto.getAttribute("funcion").toString());
                out.println("<p class =\"text-muted \" >Funcion: "+contexto.getAttribute("funcion").toString()+"</p>");
                out.println("<p class =\"text-muted \" >Espectaculo: "+contexto.getAttribute("espectaculo").toString()+"</p>");
                out.println("<p class =\"text-muted \" >Fecha y hora: "+funcion.getHoraInicio()+"</p>");
                float costo = 0;
                if(contexto.getAttribute("costo")==null){costo=ie.getCosto(contexto.getAttribute("funcion").toString());}else{
                costo = (float) contexto.getAttribute("costo");
                }
                out.println("<p class =\"text-muted \" >Costo: "+costo+"</p>");
                %>
             <input style="float: right" type="submit" name="confirmacionSi" value="Si" /><input type="submit" style="float: left" name="confirmacionNo" value="No" />
        </form>
    </div>
    </div>
    </div>
             <%@include file="headerScript.jsp"%>
    </body>
</html>

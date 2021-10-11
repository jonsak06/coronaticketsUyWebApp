<%-- 
    Document   : compraPaquetes
    Created on : Oct 5, 2021, 11:49:57 AM
    Author     : julio
--%>

<%@page import="root.interfaces.iPaquetes"%>
<%@page import="root.datatypes.DtPaqueteDeEspectaculos"%>
<%@page import="root.interfaces.IEspectaculos"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iUsuarios"%>
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
      <form action = "compraPaquete" name="compraPaquete" method="POST" class="box">
            <h1>Seleccione un paquete de Espectáculos</h1>
            <select name="paquete">
                <%
                    iPaquetes ip = Fabrica.getCtrlPaquetes();
                    List<String> todosLosPaq = ip.listarPaquetesVigentes();
                    for(String i: todosLosPaq){
                    out.println("<option>"+i+"</option>");
                    }
                %>
            </select>
                <input type="submit" value="Seleccionar" />
        </form>
            </div>
        </div>    
        </div>      
    </div>
            <%@include file="headerScript.jsp"%>
        </body>
</html>
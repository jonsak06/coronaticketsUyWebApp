<%-- 
    Document   : seleccionarPaquete
    Created on : Oct 2, 2021, 6:16:57 PM
    Author     : julio
--%>

<%@page import="root.fabrica.Fabrica"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.iUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      <form action = "finalizarRegistroPaquete" name="finalizarRegistroPaquete" method="POST" class="box">
            <h1>Tiene paquetes de descuento para este espectáculo</h1>
            <select name="paquete">
                <%
                    iUsuarios iu = Fabrica.getCrlUsuarios();
                    List<String> paquetes = iu.listarPaquetesParaEsp(contexto.getAttribute("nickname").toString(), contexto.getAttribute("espectaculo").toString());
                    for(String i: paquetes){
                    out.println("<option>"+i+"</option>");
                    }
                %>
            </select>
                <input type="submit" name="Aceptar" style="float: right" value="Aceptar" /><input type="submit" name="Cancelar" style="float: left" value="Cancelar" />
        </form>
            </div>
        </div>    
        </div>      
    </div>
            <%@include file="headerScript.jsp"%>
        </body>
</html>
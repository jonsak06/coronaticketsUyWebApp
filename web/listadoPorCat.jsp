<%-- 
    Document   : listadoPorPlat
    Created on : Sep 21, 2021, 12:56:32 PM
    Author     : julio
--%>

<%@page import="root.datatypes.DtEspectaculo"%>
<%@page import="java.util.List"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprar Paquete</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    </head>
	<body>
            <%@include file="header.jsp" %>
            <%ServletContext contexto = getServletContext();%>
    <div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
        <div class="row">
        <div class="col-md-12">
            <div class="card">
      <form action = "listarFuncionesDeEspectaculo" name="listarFuncionesDeEspectaculo" method="POST" class="box">
            <h1>Espectaculos en de la categoria: <% out.print(request.getAttribute("plataforma")); %></h1>
            <select name="espectaculos">
                <%
                    IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                    List<DtEspectaculo> espec = ie.listarEspPorCat(request.getAttribute("plataforma").toString());
                    for(DtEspectaculo i: espec){
                    out.println("<option>"+i.getNombre()+"</option>");
                    }
                %>
            </select>
                <input type="submit" value="Seleccionar" />
        </form>
            </div>
        </div>    
        </div>      
    </div>
        </body>
</html>
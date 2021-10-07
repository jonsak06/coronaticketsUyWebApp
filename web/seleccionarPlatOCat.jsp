<%-- 
    Document   : seleccionarPlatOCat
    Created on : Oct 2, 2021, 4:32:31 PM
    Author     : julio
--%>

<%@page import="root.datatypes.DtPlataforma"%>
<%@page import="java.util.List"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.IEspectaculos"%>
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
      <form action = "platOCat" name="platOCat" method="POST" class="box">
            <h1>La plataforma o la categoría ingresada no exitste</h1>
            <p>Sin embargo te invitamos a seleccionar una de las siguientes opciones</p>
            <p>Categorias</p>
            <select style="float: left" name="categorias">
                <%
                    IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                    List<String> listadeCat = ie.listarCategorias();
                    for(String i: listadeCat){
                    out.println("<option>"+i+"</option>");
                    }
                    %>
            </select><input name="categoriaOK" style="float: right" type="submit" value="Buscar" />
            
                        <select style="float: left" name="plataformas">
                <%
                    
                    List<DtPlataforma> listaPlat = ie.listarPlataformas();
                    for(DtPlataforma i: listaPlat){
                    out.println("<option>"+i.getNombre()+"</option>");
                    }
                    %>
            </select><input name="plataformaOK" style="float: right" type="submit" value="Buscar" />
                
        </form>
            </div>
        </div>    
        </div>      
    </div>
        </body>
</html>

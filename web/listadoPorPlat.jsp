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
    </head>
    <div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
        <div class="row">
        <div class="col-md-12">
            <div class="card">
      <form action = "listarFuncionesDeEspectaculo" name="listarFuncionesDeEspectaculo" method="POST" class="box">
            <h1>Espectaculos en la plataforma: <% out.print(request.getParameter("plataforma")); %></h1>
            <select name="espectaculos">
                <%
                    IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                    List<DtEspectaculo> espec = ie.listarEspectaculos(request.getParameter("plataforma"));
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
</html>

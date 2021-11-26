<%-- 
    Document   : RegistroAccesos
    Created on : Oct 29, 2021, 11:20:47 AM
    Author     : julio
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
table#mitabla {border-collapse: collapse;}
td.bajo {background-color: #cccccc;}
td.medio {background-color: #cccccc;}
td.alto {background-color: #cccccc;}

td.a {background-color: #ffffff;}
td.b {background-color: #ffffff;}
td.c {background-color: #ffffff;}

td.aaa {background-color: #ffffff;}
td.bbb {background-color: #ffffff;}
td.ccc {background-color: #ffffff;}

thead.cabecera tr td {
    font-family: monospace;
    font-size: 30px;
    font-weight: bold;
    color: #191919;
    padding: 15px;}

tfoot.pie tr td {
    font-size: 18px;
    font-weight: bold;
    font-family: Georgia;
    padding: 2px;}

tbody.cuerpo tr td {
    color: #191919;
    padding: 10px;}

td {border-style: solid;
    border-color: #cccccc;
 border-width: 1px;}
 
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro  de Accesos al Sitio</title>
    </head>
    <body>
        <h1>Registro  de Accesos al Sitio</h1>
        <table class="default">
            <thead class="cabecera">
  <tr>
    <td>#</td>
    <td>IP</td>
    <td>URL</td>
    <td>Navegador y sistema del Cliente</td>
  </tr>
            </thead>
            <tbody class="cuerpo">
         <%
  iRegistrosAcceso ir = Fabrica.getCtrlRegistrosAcceso();
  List<DtRegistroAcceso> registros = ir.getRegistrosAcceso();
  for(DtRegistroAcceso r: registros){
            out.println("<tr>");
            out.println("<td>"+r.getCounter()+"</td>");
            out.println("<td>"+r.getIpCliente()+"</td>");
            out.println("<td>"+r.getUrlSitio()+"</td>");
            out.println("<td>"+r.getNavCliente()+"</td>");
            out.println("</tr>");
            }
  %>
            </tbody>
</table>
    </body>
</html>

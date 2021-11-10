<%-- 
    Document   : funcionesDeEspectaculo
    Created on : Sep 21, 2021, 3:19:01 PM
    Author     : julio
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.*"%>
<%@page import="root.datatypes.*"%>
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
        <form action = "listarCanjeables" name="listarCanjeables" method="POST" class="box">
            <h1>Funciones del espectaculo: <% out.print(contexto.getAttribute("espectaculo").toString()); %></h1>
        <select name="funcion">
            <%
                IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                List<DtFuncion> lista2 = ie.funcEspNoReg(contexto.getAttribute("nickname").toString(), contexto.getAttribute("espectaculo").toString());
for(DtFuncion f: lista2){
                out.println("<option>"+f.getNombre()+"</option>");
                }
                
            %>
        </select>
        <%if(lista2.size()==0){
                out.println("<p>No quedan funciones disponibles</p>");
                out.println("<a href=\"/coronaticketsUyWebApp/registroEspectadorFuncion.jsp\">Volver</a>");
                }else{out.println("<input type=\"submit\" value=\"Seleccionar\" />");}
                        %>
        </form>
    </div>
    </div>
    </div>
        <%@include file="headerScript.jsp"%>
    </body>
</html>

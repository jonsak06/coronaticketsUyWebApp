<%-- 
    Document   : listadoDeCanjeables
    Created on : Sep 25, 2021, 6:29:43 PM
    Author     : julio
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.entidades.Registro"%>
<%@page import="root.datatypes.DtRegistro"%>
<%@page import="java.util.List"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iUsuarios"%>
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
                <form action = "canjeyRegistro" name="canjeyRegistro" method="POST" class = "box">
                    <% 
                    //ServletContext contexto = getServletContext();
                    String nick = contexto.getAttribute("nickname").toString();
                    iUsuarios iu = Fabrica.getCrlUsuarios();
                    contexto.setAttribute("cantCanjeables",iu.getCanjeables(nick));
                    if(iu.getCanjeables(nick)<3){
                    out.println("<h1>NO TIENES SUFICIENTES REGISTROS PARA CANJEAR</h1>");
                    out.println("<input  name=\"continuar\" type=\"submit\" value=\"continuar\" / >");
                    }else{
                    out.println("<h1>Listado de Canjeables</h1>");
                    int j=1;
                    for(DtRegistro i: iu.listarCanjeables(nick)){
                        out.println("<p><input type=\"checkbox\" name="+j+"  value=\"ON\"/ id="+j+"><label for "+j+">"+i.getNombreFuncion()+" "+i.getFechaFuncion()+"</label></p>");
                        j++;
                    }
                    out.println("<p>Realizar Canje?</p>");
                    out.println("<input style=\"float: right\" type=\"submit\" name=\"realizarCanje\" value=\"Si\" /><input type=\"submit\" style=\"float: left\" name=\"norealizarCanje\" value=\"No\" />");
                    }
                    %>
<!--                    <h1>Listado de Canjeables</h1>
                    <input type="text" name="plataforma" value="" placeholder="Buscar por Plataforma"/><input type="submit" value="Listar" />-->
                </form>
            </div>
        </div>
    </div>
    </div>
            <%@include file="headerScript.jsp"%>
        </body>
</html>

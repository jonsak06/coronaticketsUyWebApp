<%-- 
    Document   : confirmacionDeCanje
    Created on : Oct 2, 2021, 8:19:09 AM
    Author     : julio
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="java.util.ArrayList"%>
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

    </head>
	<body>
            <%@include file="header.jsp" %>
            <link rel="stylesheet" href="headerStyles.css">
            <%ServletContext contexto = getServletContext();%>
    <div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
    <div class="row">
    <div class="col-md-12">
    <div class="card">
        <form action = "finalizarRegistroCanje" name=" " method="POST" class="box">
            <h1>Desea confirmar?</h1>
            <p>Esta a punto de canjear los siguientes registros</p>
             <%int cantCanjeables = Integer.parseInt(contexto.getAttribute("cantCanjeables").toString());
            iUsuarios iu = Fabrica.getCrlUsuarios();

            List<DtRegistro> canjeables = iu.listarCanjeables(contexto.getAttribute("nickname").toString());
            List<String> canje = new ArrayList<String>();
            int i = 1;
            while(i<cantCanjeables+1){
                if(request.getParameter(i+"")!=null){
                    out.println("<li>"+canjeables.get(i-1).getNombreFuncion()+"</li>");
                    canje.add(canjeables.get(i-1).getNombreFuncion());
                    
                }
                i++;
            }
   
                    contexto.setAttribute("canje", canje);
             %>
             <p class ="text-muted" style="float: right">Costo $0</p>
             <p class ="text-muted">Confirmar Canje</p>
             <input style="float: right" type="submit" name="confirmacionSi" value="Si" /><input type="submit" style="float: left" name="confirmacionNo" value="No" />
        </form>
    </div>
    </div>
    </div>
           <%@include file="headerScript.jsp"%>  
    </body>
</html>

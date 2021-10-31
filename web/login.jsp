<%-- 
    Document   : login
    Created on : Sep 21, 2021, 5:00:48 PM
    Author     : julio
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String nickname;%>
<%!String tipoUsuario;%>
<html>
    <head>
                <script src="http://code.jquery.com/jquery-latest.js">

</script>
<script>
	$(document).ready(function() {
		$('#nick').focusout(function(event) {
			var nombreVar = $('#nick').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.post('NicknameExiste', {
				nombre : nombreVar
			}, function(responseText) {
				$('#mensaje').html(responseText);
			});
		});
	});
</script>
        <%
        iRegistrosAcceso ir = Fabrica.getCtrlRegistrosAcceso();
        long moment = new java.util.Date().getTime();
        DtRegistroAcceso r = new DtRegistroAcceso(0,java.net.InetAddress.getLocalHost().getHostAddress(),request.getHeader("User-Agent"),request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"+request.getServletPath().substring(request.getServletPath().lastIndexOf("/") +1),moment);
        ir.ingresarRegistro(r);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                <form action="pasajeaLogin" name="pasajeaLogin" method="POST" class="box">
                    <h1>Login</h1>
                    <p class="text-muted">Ingresa tu nickname y tu contraseña!</p> <input type="text" name="nick" id="nick" placeholder="Nickname"><div id="mensaje"></div> <input type="password" name="pass" placeholder="Contraseña"> <a class="forgot text-muted" href="index.jsp">Olvidaste tu contraseña?</a> <input type="submit" name="" value="Login">
                </form>
            </div>
        </div>
    </div>
</div>
            <%@include file="headerScript.jsp"%>
        </body>
</html>

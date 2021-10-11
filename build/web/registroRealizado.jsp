<%-- 
    Document   : registroRealizado
    Created on : Oct 2, 2021, 12:22:27 PM
    Author     : julio
--%>

<%@page import="root.datatypes.DtFuncion"%>
<%@page import="root.datatypes.DtFuncion"%>
<%@page import="root.interfaces.IEspectaculos"%>
<%@page import="root.interfaces.IEspectaculos"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccione una Funcion</title>
    </head>
     <title>CoronaTicketsUy</title>
		<style type="text/css">
			
			* {
				margin:px;
				padding:0px;
			}
			
			#header {
                                    
                                padding: 40px;
                                position: absolute;
                                left: 23%;
				/*margin:auto;*/
				width:1000px;
				font-family:Arial, Helvetica, sans-serif;
			}
			
			ul, ol {
				list-style:none;
			}
			
			.nav > li {
				float:left;
			}
			
			.nav li a {
				background-color:#000;
				color:#fff;
				text-decoration:none;
				padding:10px 12px;
				display:block;
			}
			
			.nav li a:hover {
				background-color:#434343;
			}
			
			.nav li ul {
				display:none;
				position:absolute;
				min-width:140px;
			}
			
			.nav li:hover > ul {
				display:block;
			}
			
			.nav li ul li {
				position:relative;
			}
			
			.nav li ul li ul {
				right:-140px;
				top:0px;
			}
			
		</style>
	</head>
	<body>
            <%ServletContext contexto = getServletContext();%>
		<div id="header">
			<ul class="nav">
                            <li><a href="/coronaticketsUyWebApp/login.jsp"<%contexto.setAttribute("vaHacia", "/index.jsp");%>>Iniciar Sesion</a></li>
                                <li><a href=""><%
                                        if(contexto.getAttribute("tipoUsuario")!=null){
            out.println(contexto.getAttribute("nickname"));
        }else{out.print("Registrate");}%></a></li>
				<li><a href="">Servicios</a>
					<ul>
                                            
                                                <% 
                                                    if(contexto.getAttribute("tipoUsuario")==null){
                                                        contexto.setAttribute("vaHacia", "/registroEspectadorFuncion.jsp");
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/login.jsp\">Registrarse a una función de un espectáculo</a></li>");
                                                }else if(contexto.getAttribute("tipoUsuario").equals("Espectador")){
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/modificarUsuario.jsp\">Modificar Usuario</a></li>");
                                                
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/registroEspectadorFuncion.jsp\">Registrarse a una función de un espectáculo</a></li>");
                                                }else{
                                                 out.print("<li><a href=\"/coronaticketsUyWebApp/modificarUsuario.jsp\">Modificar Usuario</a></li>");
                                               
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/artistaError.jsp\">Registrarse a una función de un espectáculo</a></li>");
                                                }
                                                %>
						<li><a href="/coronaticketsUyWebApp/altaUsuario.jsp">alta usuario</a></li>
						<li><a href="">Submenu4</a>
							<ul>
								<li><a href="">Submenu1</a></li>
								<li><a href="">Submenu2</a></li>
								<li><a href="">Submenu3</a></li>
								<li><a href="">Submenu4</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="">Acerca de</a>
					<ul>
						<li><a href="">Submenu1</a></li>
						<li><a href="">Submenu2</a></li>
						<li><a href="">Submenu3</a></li>
						<li><a href="">Submenu4</a></li>
					</ul>
				</li>
				<li><a href="">Contacto</a></li>
                                <li><a href="/coronaticketsUyWebApp/cerrarSesion.jsp">Cerrar Sesion</a></li>
			</ul>
		</div>
    </body>
    <body>
    <div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
    <div class="row">
    <div class="col-md-12">
    <div class="card">
        <form action = "finalizarRegistro" name=" " method="POST" class="box">
            <h1>Registro realizado!</h1>
            <%
                IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                DtFuncion funcion = ie.getDatosFuncion(contexto.getAttribute("funcion").toString());
                out.println("<p class =\"text-muted \" >Funcion: "+contexto.getAttribute("funcion").toString()+"</p>");
                out.println("<p class =\"text-muted \" >Espectaculo: "+contexto.getAttribute("espectaculo").toString()+"</p>");
                out.println("<p class =\"text-muted \" >Fecha y hora: "+funcion.getHoraInicio()+"</p>");
                out.println("<p class =\"text-muted \" >Costo: "+contexto.getAttribute("costo")+"</p>");
                contexto.removeAttribute("funcion");
                contexto.removeAttribute("espectaculo");
                contexto.removeAttribute("costo");
                contexto.removeAttribute("funciones");
                %>
                <a href="/coronaticketsUyWebApp/index.jsp">Volver al Inicio</a>
        </form>
    </div>
    </div>
    </div>
    </body>
</html>

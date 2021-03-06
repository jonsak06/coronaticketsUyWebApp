<%-- 
    Document   : listadoDeCanjeables
    Created on : Sep 25, 2021, 6:29:43 PM
    Author     : julio
--%>

<%@page import="root.entidades.Registro"%>
<%@page import="root.datatypes.DtRegistro"%>
<%@page import="java.util.List"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/login.jsp\">Registrarse a una funci??n de un espect??culo</a></li>");
                                                }else if(contexto.getAttribute("tipoUsuario").equals("Espectador")){
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/modificarUsuario.jsp\">Modificar Usuario</a></li>");
                                                
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/registroEspectadorFuncion.jsp\">Registrarse a una funci??n de un espect??culo</a></li>");
                                                }else{
                                                 out.print("<li><a href=\"/coronaticketsUyWebApp/modificarUsuario.jsp\">Modificar Usuario</a></li>");
                                               
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/artistaError.jsp\">Registrarse a una funci??n de un espect??culo</a></li>");
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
</html>

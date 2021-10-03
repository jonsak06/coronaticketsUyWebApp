<%-- 
    Document   : altaEspectaculo
    Created on : Oct 3, 2021, 10:24:13 AM
    Author     : julio
--%>

<%@page import="root.datatypes.DtPlataforma"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.IEspectaculos"%>
<%@page import="root.fabrica.Fabrica"%>
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
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/login.jsp\">Registrarse a una función de un espectáculo</a></li>");
                                                }else if(contexto.getAttribute("tipoUsuario").equals("Espectador")){
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/modificarUsuario.jsp\">Modificar Usuario</a></li>");
                                                
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/registroEspectadorFuncion.jsp\">Registrarse a una función de un espectáculo</a></li>");
                                                }else{
                                                 out.print("<li><a href=\"/coronaticketsUyWebApp/modificarUsuario.jsp\">Modificar Usuario</a></li>");
                                               
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/artistaError.jsp\">Registrarse a una función de un espectáculo</a></li>");
                                                out.print("<li><a href=\"/coronaticketsUyWebApp/altaEspectaculo.jsp\">Ingresar nuevo Espectáculo</a></li>");

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
                <form action="altaEspectaculoerv" name="altaEspectaculo" method="POST" class="box" enctype='multipart/form-data'>
                    <h1>Datos del Espectaculo</h1>
                    <p class="text-muted">Ingresa los datos del espectaculo</p> 
                    <select name="plataforma">
                        <option>Seleccione una Plataforma</option>
                        <%
                            IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                            List<DtPlataforma> plataformas = ie.listarPlataformas();
                            for(DtPlataforma p: plataformas){
                                out.println("<option>"+p.getNombre()+"</option>");
                            }
                        %>
                                
                    </select>
                    <input type="text" name="nombreEsp" placeholder="Nombre"> 
                    <textarea name="descripcion" style="background-color: #191919; color: white;border: 2px solid #3498db; padding: 10px 10px; outline: none; color: white; border-radius: 24px; transition: 0.25s" rows="4" cols="40" placeholder="Descripcion"></textarea>
                    <input type="text" name="duracion" placeholder="Duracion en Minutos"> 
                    <input type="text" name="cantMin" placeholder="Cantidad de espectadores mínima"> 
                    <input type="text" name="cantMax" placeholder="Cantidad de espectadores máxima"> 
                    <input type="text" name="url" placeholder="URL por la cuál se trasnimitirá"> 
                    <input type="text" name="costo" placeholder="Costo del Espectáculo"> 
                    <% 
                    //ServletContext contexto = getServletContext();
                    
                    out.println("<p>Seleccione al menos un Categoría</p>");
                    List<String> categorias = ie.listarCategorias();
                    int j=1;
                    for(String i: categorias){
                        out.println("<p><input type=\"checkbox\" name="+j+"  value=\"ON\"/ id="+j+"><label for "+j+">"+i+"</label></p>");
                        j++;
                    }
                    %>
                    <div id="div_file">
                        <p id="texto">Seleccionar Imagen</p>
                        <input type="file" name="upfile" style="background-color: #191919; color: white;border: 2px solid #3498db; padding: 10px 10px; outline: none; color: white; border-radius: 24px; transition: 0.25s">
                    </div>
                    <input type="submit" name="" value="Ingresar">
                </form>
            </div>
        </div>
    </div>
</div>
</html>

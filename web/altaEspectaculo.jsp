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
                    <select name="plataforma" id="plataforma">
                        <option>Seleccione una Plataforma</option>
                        <%
                            IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                            List<DtPlataforma> plataformas = ie.listarPlataformas();
                            for(DtPlataforma p: plataformas){
                                out.println("<option>"+p.getNombre()+"</option>");
                            }
                        %>
                                
                    </select>
                    <input type="text" name="nombreEsp" placeholder="Nombre" id="nombre" required> 
                    <textarea name="descripcion" style="background-color: #191919; color: white;border: 2px solid #3498db; padding: 10px 10px; outline: none; color: white; border-radius: 24px; transition: 0.25s" rows="4" cols="40" placeholder="Descripcion"></textarea>
                    <input type="number" style="    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #3498db;
    padding: 10px 10px;
    width: 250px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s" name="duracion" placeholder="Duracion en Minutos" id="duracion" min="0" required> 
                    <input type="number" style="    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #3498db;
    padding: 10px 10px;
    width: 250px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s" name="cantMin" placeholder="Cantidad de espectadores mínima" id="cantMin" min="0" required> 
                    <input type="number" style="    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #3498db;
    padding: 10px 10px;
    width: 250px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s" name="cantMax" placeholder="Cantidad de espectadores máxima" id="cantMax" min="1" required> 
                    <input type="text" name="url" placeholder="URL por la cuál se trasnimitirá" id="url" required> 
                    <input type="number" style="    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #3498db;
    padding: 10px 10px;
    width: 250px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s" step="0.01" min="0" name="costo" placeholder="Costo del Espectáculo" id="costo" required> 
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
                    <input type="submit" name="ingresar" value="Ingresar" id="ingresar">
                </form>
                    <script>
            const botonIngresar = document.getElementById("ingresar");
//            const stringToDate = str => {
//                const partes = str.split("-");
//                return new Date(partes[0], partes[1], partes[2]);
//            };
            
            botonIngresar.addEventListener("click", e => {
//                const fechaInicio = document.getElementById("fecha-inicio");
                const plataforma = document.getElementById("plataforma");
                if(plataforma.value=="Seleccione una Plataforma") {
                        e.preventDefault();
                        alert("Debe seleccionar una Plataforma para el Espectáculo");
                }
                const cantMax = document.getElementById("cantMax");
                const cantMin = document.getElementById("cantMin");
                if(cantMax.value<=cantMin.value){
                    e.preventDefault();
                    alert("La cantidad máxima de espectadores debe superar la cantidad mínima");
                }
                const url = document.getElementById("url");
                if(url.value.toString().includes(" ") || url.value.toString().includes(".")==false){
                    e.preventDefault();
                    alert("URL inválida");
                }
                
            });
        </script>
            </div>
        </div>
    </div>
</div>
</html>

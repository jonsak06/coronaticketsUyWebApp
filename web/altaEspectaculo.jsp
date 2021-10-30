<%-- 
    Document   : altaEspectaculo
    Created on : Oct 3, 2021, 10:24:13 AM
    Author     : julio
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.datatypes.DtPlataforma"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.IEspectaculos"%>
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
                    <textarea name="descripcion" style="background-color: #191919; color: white;border: 2px solid #3498db; padding: 10px 10px; outline: none; color: white; border-radius: 24px; transition: 0.25s" rows="4" cols="30" placeholder="Descripcion"></textarea>
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
                    
                    <textarea name="descripcionDelPremio" style="background-color: #191919; color: white;border: 2px solid #3498db; padding: 10px 10px; outline: none; color: white; border-radius: 24px; transition: 0.25s" rows="4" cols="30" placeholder="Descripcion del Premio"></textarea>
                    
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
    transition: 0.25s" step="1" min="1" name="numeroDePremiosPorFuncion" placeholder="Numero de premios por funcion" id="numeroDePremiosPorFuncion" >
                     <p><input type="checkbox" name="premio"  value="ON" id="subir"><label for subir>Tener premio</label>
                    
                    <input type="text" name="video" placeholder="URL de video" id="video">
                    <div id="div_file">
                        <p id="texto">Seleccionar Imagen</p>
                        <input type="file" name="upfile" id="upfile" style="background-color: #191919; color: white;border: 2px solid #3498db; padding: 10px 10px; outline: none; color: white; border-radius: 24px; transition: 0.25s">
                        <p><input type="checkbox" name="subir"  value="ON" id="subir"><label for subir>Subir Archivo</label>
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
                const video = document.getElementById("video");
                if(url.value.toString().includes(" ") || url.value.toString().includes(".")==false){
                    e.preventDefault();
                    alert("URL de video inválida");
                }
              });
        </script>
        <%@include file="headerScript.jsp"%>
            </div>
        </div>
    </div>
</div>
</html>

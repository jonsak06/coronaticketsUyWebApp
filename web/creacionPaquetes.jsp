<%-- 
    Document   : creacionPaquetes
    Created on : Oct 3, 2021, 3:51:54 PM
    Author     : dexion
--%>

<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iPaquetes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear paquete</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <style>
            .formContainer {
                margin-top: 30px;
            }
        </style>
        <link rel="stylesheet" href="headerStyles.css">
    </head>
    <body>
        <% 
            //usuarios que no sean artistas son redirigidos al inicio
//            try {
//                ServletContext contexto = getServletContext();
//                String tipoUsr = contexto.getAttribute("tipoUsr").toString();
//                if(!tipoUsr.equals("Artista")) {
//                    response.sendRedirect("index.jsp");
//                }
//            } catch(Exception e) {
//                response.sendRedirect("index.jsp");
//            }
        %>
        <%@include file="header.jsp"%>
        
        <div class="container formContainer">
            <form method="post" action="crearPaquete" enctype="multipart/form-data" class="row g-3">
                <div class="col-12">
                    <label for="nombre" class="form-label">Nombre del paquete</label>
                    <input name="nombre" type="text" class="form-control" id="nombre" required> 
                </div>
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripcion</label>
                    <textarea name="descripcion" class="form-control" id="descripcion" rows="3" required></textarea>
                </div>
                <div class="col-md-6">
                    <label for="fecha-inicio" class="form-label">Fecha de inicio</label>
                    <input name="fechaInicio" type="date" class="form-control" id="fecha-inicio" required>
                </div>
                <div class="col-md-6">
                    <label for="fecha-fin" class="form-label">Fecha de fin</label>
                    <input name="fechaFin" type="date" class="form-control" id="fecha-fin" required>
                </div>
                <div class="col-md-6">
                    <label for="descuento" class="form-label">Descuento</label>
                    <input name="descuento" type="number" class="form-control" id="descuento" min="0" max="100" required>
                </div>
                <div class="col-md-6">
                    <label for="imagen" class="form-label">Imagen</label>
                    <input name="imagen" class="form-control" type="file" id="imagen">
                </div>
                
                <div class="col-12">
                    <button type="submit" class="btn btn-primary" id='crear-paquete'>Crear paquete</button>
                </div>
            </form>
        </div>
        <% 
            //obtengo la lista de nombres de paquetes y la convierto a json
            iPaquetes ip = Fabrica.getCtrlPaquetes();
            List<String> paqs = ip.listarPaquetes();
            Gson gson = new Gson();
            String jsonPaqs = gson.toJson(paqs);
        %>
        <%@include file="headerScript.jsp"%>
        <script>
            if(${creado == true}) {
                alert("Paquete creado");
            }
            const botonCrearPaq = document.getElementById("crear-paquete");
            const stringToDate = str => {
                const partes = str.split("-");
                return new Date(partes[0], partes[1], partes[2]);
            };
            
            const jsonPaqs = <%=jsonPaqs%>;
            
            botonCrearPaq.addEventListener("click", e => {
                const fechaInicio = document.getElementById("fecha-inicio");
                const fechaFin = document.getElementById("fecha-fin");
                const nombre = document.getElementById("nombre").value;
                if(fechaInicio.value !== "" && fechaFin.value !== "") {
                    if(stringToDate(fechaInicio.value) > stringToDate(fechaFin.value)) {
                        e.preventDefault();
                        alert("La fecha de fin debe ser mayor o igual a la fecha de inicio");
                    } else if (jsonPaqs.includes(nombre)) {
                        e.preventDefault();
                        alert("El paquete ya existe");
                    }
                }
            });
        </script>
    </body>
</html>

<%-- 
Document   : altaUsuario
Created on : 24 set. 2021, 16:55:39
Author     : tecnologo
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">


        <link rel="stylesheet" href="headerStyles.css">
        <script>
            var anterior = "nada";
            function ShowSelected()
            {

                var seleccionadas = document.getElementsByClassName("tabla");
                for (x = 0; x < seleccionadas.length; x++)
                {
                    seleccionadas[x].style.display = "none";
                }



                /* Para obtener el texto */
                var funcion = document.getElementById("selectedFuncion");
                var selected = funcion.options[funcion.selectedIndex].text;
                alert(selected);

                document.getElementById(selected).style.display = "block";



            }
            EspectaculoSelected()
            {
                var tablas = document.getElementsByTagName("table");
                for (x = 0; x < tablas.length; x++)
                {
                    tablas[x].style.display = "none";
                }



                /* Para obtener el texto */
                var funcion = document.getElementById("selectedFuncion");
                var selected = funcion.options[funcion.selectedIndex].text;
                alert(selected);

                var seleccionadas = document.getElementsByClassName()(selected);
                for (x = 0; x < seleccionadas.length; x++)
                {
                    seleccionadas[x].style.display = "block";
                }


            }

        </script>
    </head>

    <body>

        <%@include file="header.jsp" %>
        <form action="consultarUsuariosBackEnd" class="container">
            <div class="input-group">
                <select name="Usuario" class="custom-select" id="inputGroupSelect04">
                    <option selected>Seleccione...</option>
                    <%                    
                        List<DtArtista> lArt = Fabrica.getCrlUsuarios().getArtistas();
                        List<DtEspectador> lEsp = Fabrica.getCrlUsuarios().getEspectadores();

                        for (DtArtista a : lArt) {
                            out.println("<option>" + a.getNickname() + "</option>");
                        }
                        for (DtEspectador e : lEsp) {
                            out.println("<option>" + e.getNickname() + "</option>");
                        }
                    %>
                </select>
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit" disabled>Consultar</button>
                </div>
            </div>
        </form> 
              <div class="container infoUsuario">
        
        <% 
            String usu = request.getParameter("Usuario");
            if(usu != "Seleccione..." && usu != null)
            {
            
                for (DtArtista a : lArt) {
                    if(usu.equals(a.getNickname()))
                    {
                    out.print("<div class='card' style='width: 18rem;'>");
                out.print("<img src='"+a.getImagen()+"' class='card-img-top' alt='imagen del paquete'>");
                    out.print("<div class='card-body'>");
                    out.print("<h5 class='card-title'>"+a.getNickname()+"</h5>");
                    out.print("<p class='card-text'>"+a.getNombre()+"</p>");
                    out.print("<p class='card-text'>"+a.getApellido()+"</p>");
                    out.print("<p class='card-text'>"+a.getCorreo()+"</p>");
                    out.print("<p class='card-text'>"+a.getFechaNacimiento().toString()+"</p>");
                    out.print("</div>");
                out.print("</div>");
                    }
                }
                for (DtEspectador e : lEsp) {
                    if(usu.equals(e.getNickname()))
                    {
                    out.print("<div class='card' style='width: 18rem;'>");
                out.print("<img src='"+e.getImagen()+"' class='card-img-top' alt='imagen del paquete'>");
                    out.print("<div class='card-body'>");
                    out.print("<h5 class='card-title'>"+e.getNickname()+"</h5>");
                    out.print("<p class='card-text'>"+e.getNombre()+"</p>");
                    out.print("<p class='card-text'>"+e.getApellido()+"</p>");
                    out.print("<p class='card-text'>"+e.getCorreo()+"</p>");
                    out.print("<p class='card-text'>"+e.getFechaNacimiento().toString()+"</p>");
                    out.print("</div>");
                out.print("</div>");
                
                
                
                    }
                }
                 
            }
        %>
    </div>  


        <script>
            const paqs = document.getElementById("inputGroupSelect04");
            const botonConsultarPaq = document.querySelector(".btn-outline-secondary");
            paqs.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarPaq.disabled = true;
                } else {
                    botonConsultarPaq.disabled = false;
                }
            });

        </script>
        <%@include file="headerScript.jsp"%>
    </body>

</html>


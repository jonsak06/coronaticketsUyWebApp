<%-- 
    Document   : addEspectaculoFaborito
    Created on : 9 oct. 2021, 02:39:23
    Author     : tecnologo
--%>


<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.*"%>
<%@page import="root.datatypes.*"%>
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
        <meta http-equiv="Content-Type" content="text/htm<link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="headerStyles.css">
        <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:600&display=swap');

.content{
  margin: auto;
  display: flex;
  border: 2px solid #eae2e1;
  height: 70px;
  width: 350px;
  cursor: pointer;
}
.content.heart-active{
  border-color: #f9b9c4;
  background: #fbd0d8;
}
.heart{
  display: flex;
  position: relative;

  background: url("img.png") no-repeat;

  background-size: 2900%;
  height: 100px;
  width: 100px;
  top: -23px;
}
.text{
 display: flex;
  font-size: 15px;
  margin-left: -5px;
  color: grey;
  font-family: 'Montserrat',sans-serif;
  margin-top: 12px;
  
}

.text.heart-active{
  color: #000;
}
.heart.heart-active{
  animation: animate .8s steps(28) 1;
  background-position: right;
}

.contentA{
  margin: auto;
  display: flex;
  border: 2px solid #eae2e1;
  height: 70px;
  width: 350px;
  cursor: pointer;
  border-color: #f9b9c4;
  background: #fbd0d8;
}
.contentA.heart-active{
  border-color: none;
  background: none;
}
.heartA{
  display: flex;
  position: relative;

  background: url("img.png") no-repeat;

  background-size: 2900%;
  height: 100px;
  width: 100px;
  top: -23px;
}
.textA{
 display: flex;
  font-size: 15px;
  margin-left: -5px;
  color: grey;
  font-family: 'Montserrat',sans-serif;
  margin-top: 12px;
  
}

.textA.heart-active{
  color: #000;
}
.heartA.heart-active{
  animation: animate .8s steps(28) 1;
  background-position: right;
}



@keyframes animate {
  0%{
    background-position: left;
  }
  100%{
    background-position: right;
  }
}

            body {
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                background: linear-gradient(to right, #b92b27, #1565c0)
            }

            .card {
                margin-bottom: 10px;
                border: none
            }

            .box {
                width: 500px;
                padding: 40px;
                position: absolute;
                top: 25%;
                left: 25%;
                background: #191919;
                ;
                text-align: center;
                transition: 0.25s;
                margin-top: 100px
            }

            .box input[type="text"],
            .box input[type="password"] {
                border: 0;
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
                transition: 0.25s
            }


            .box h1 {
                color: white;
                text-transform: uppercase;
            }

            .box h3 {
                color: white;
                text-transform: uppercase;
                font-size: 40px;

            }
            .box h4 {
                color: white;
                text-transform: uppercase;
                font-size: 30px;

            }

            .box h5 {
                color: white;
                text-transform: uppercase;
                font-size: 22px;

            }
            .box h6 {
                color: white;
                text-transform: uppercase;

            }

            .box input[type="text"]:focus,
            .box input[type="password"]:focus {
                width: 200px;
                border-color: #2ecc71
            }

            .box select:focus {
                width: 200px;
                border-color: #2ecc71
            }

            .box select {
                border: 0;
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
                transition: 0.25s
            }

            .box li {
                color: white;
                font-weight: 250
            }

            .box p{
                color: white;
                font-weight: 250
            }


            .box input[type="submit"] {
                border: 0;
                background: none;
                display: block;
                margin: 20px auto;
                text-align: center;
                border: 2px solid #2ecc71;
                padding: 14px 40px;
                outline: none;
                color: white;
                border-radius: 24px;
                transition: 0.25s;
                cursor: pointer
            }

            .box button {
                border: 0;
                background: none;
                display: block;
                margin: 20px auto;
                text-align: center;
                border: 2px solid #2ecc71;
                padding: 14px 40px;
                outline: none;
                color: white;
                border-radius: 24px;
                transition: 0.25s;
                cursor: pointer
            }

            .box option {
                background: black;
                color: white;
            }

            .box input[type="submit"]:hover {
                background: #2ecc71
            }

            .box img{
                height: 300px;
                width: 300px;
                margin: 20px auto;
            }
            .forgot {
                text-decoration: underline
            }


        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%ServletContext contexto = getServletContext();%>
        <div class="box">

            <%
                out.println("<form action=\"addEspectaculoFaboritoBackEnd\">");
                List<DtEspectaculo> esps = Fabrica.getCrlUsuarios().getEspectaculosALosQueElEspectadorFueAUnaFuncion(contexto.getAttribute("nickname").toString());
                List<DtEspectaculo> espsFab = Fabrica.getCrlUsuarios().getEspectaculosFaboritos(contexto.getAttribute("nickname").toString());
                List<String> nombresEspsFab = new ArrayList<String>();
                List<String> nombresEspsNoFab = new ArrayList<String>();
                for (DtEspectaculo e : espsFab) {
                    nombresEspsFab.add(e.getNombre());
                }
                for (DtEspectaculo e : esps) {
                    if (!nombresEspsFab.contains(e.getNombre())) {

                        nombresEspsNoFab.add(e.getNombre());
                    }
                }
                Gson gson = new Gson();
                String jsonNombresEspsFab = gson.toJson(nombresEspsFab);
                String jsonNombresEspsNoFab = gson.toJson(nombresEspsNoFab);
                for (DtEspectaculo e : esps) {
                    out.print("<img src='" + e.getImagen() + "' alt='imagen del espectaculo'>");
                    out.print("<h4> Nombre: " + e.getNombre() + "</h4>");
                    out.print("<p> Descripcion: " + e.getDescripcion() + "</p>");
                    out.print("<p> Duracion: " + e.getDuracion() + "</p>");
                    out.print("<p> Cantidad Maxima de Espectadores: " + e.getCantidadMaximaEspectadores() + "</p>");
                    out.print("<p> Cantidad Minima de Espectadores: " + e.getCantidadMinimaEspectadores() + "</p>");
                    out.print("<p> URL: " + e.getUrl() + "</p>");
                    out.print("<p> Costo: " + e.getCosto() + "</p>");
                    out.print("<p> Fecha de registro: " + e.getFechaDeRegistro() + "</p>");
                    if (nombresEspsFab.contains(e.getNombre())) {

//                        out.print("<label><input type=\"checkbox\" value=\"none\" name=\""+e.getNombre()+"\" checked> <img src=\"corazonLleno.png\"/></label><br><br>");
                       
                            out.print("<div class=\"contentA\">");
                            out.print("<span class=\"heartA\"></span>");
                            out.print("<span class=\"textA\">"+ e.getNombre()+"</span>");
                            out.print("</div>");
                            
      
        
           
      
    
                        

                    } else {
//                        out.print("<label><input type=\"checkbox\" value=\"none\" name=\""+e.getNombre()+"\" > <img src=\"corazonVacio.png\"/></label><br>");
                        
                            out.print("<div class=\"content\">");
                            out.print("<span class=\"heart\"></span>");
                            out.print("<span class=\"text\">"+ e.getNombre()+"</span>");
                            out.print("</div>");
                            
                    }
                    

                }
                out.print("<input type=\"submit\" name=\"\" value=\"crear\" id=\"crear\">");
                out.println("</form>");

            %>
        </div>

        <script>
      $(document).ready(function(){
         //empieza la parte manual del estado desactivado
        $('.content').click(function(){
//       if(var1 === true)
//          {var1 = false;}
//        else{var1 = true; }

       
          $(this).toggleClass("heart-active");
          
          $('.text',this).toggleClass("heart-active");
          $('.heart',this).toggleClass("heart-active");
         var texto = $('.text',this).text();
         alert(texto);
          $.post('addEspectaculoFaboritoBackEnd', {
				nombre : texto
			});
        });
        //empieza la parte automatica del estado activado
        $(this).toggleClass("heart-active");
          $('.conentA',this).toggleClass("heart-active");
          $('.textA',this).toggleClass("heart-active");
          $('.heartA',this).toggleClass("heart-active");
          //empieza la parte manual del estado activado
        $('.contentA').click(function(){
          $(this).toggleClass("heart-active");
          
          $('.textA',this).toggleClass("heart-active");
          $('.heartA',this).toggleClass("heart-active");
         var texto = $('.textA',this).text();
          $.post('addEspectaculoFaboritoBackEnd', {
				nombre : texto
			});
        });
        
        
      });
    </script>
        
        <script>
            const jsonNombresEspsFab = <%=jsonNombresEspsFab%>;
            const jsonNombresEspsNoFab = <%=jsonNombresEspsNoFab%>;
            
            const plats = document.getElementById("inputGroupSelect04");
            const botonConsultarPlat = document.querySelector(".btn-outline-secondary");
            plats.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarPlat.disabled = true;
                } else {
                    botonConsultarPlat.disabled = false;
                }
            });

        </script>        
        <script>   const esps = document.getElementById("inputGroupSelect04e");
            const botonConsultarEsps = document.querySelector(".btn-outline-secondarye");
            esps.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarEsps.disabled = true;
                } else {
                    botonConsultarEsps.disabled = false;
                }
            });

        </script>   
        <script>
            const funs = document.getElementById("inputGroupSelect04f");
            const botonConsultarFuns = document.querySelector(".btn-outline-secondaryf");
            funs.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarFuns.disabled = true;
                } else {
                    botonConsultarFuns.disabled = false;
                }
            });

        </script>  
        <script>
            const ars = document.getElementById("inputGroupSelect04a");
            const botonConsultarArs = document.querySelector(".btn-outline-secondarya");
            ars.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarArs.disabled = true;
                } else {
                    botonConsultarArs.disabled = false;
                }
            });

        </script> 
        <script>
            const paqs = document.getElementById("inputGroupSelect04p");
            const botonConsultarPaqs = document.querySelector(".btn-outline-secondaryp");
            paqs.addEventListener("change", e => {
                if (e.target.value === "Seleccione...") {
                    botonConsultarPaqs.disabled = true;
                } else {
                    botonConsultarPaqs.disabled = false;
                }
            });

        </script> 
        <%@include file="headerScript.jsp"%>
    </body>


</html>
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
        <style type="text/css">

            * {
                margin:0px;
                padding:0px;
            }

            #header {
                margin:auto;
                width:500px;
                height: 150px;
                font-family:Arial, Helvetica, sans-serif;
            }

            ul, ol {
                list-style:none;
            }

            .nav > li {
                float:left;
                margin-top: 50px;
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

            .logo {

                width: 150px;
                height: 150px;
                float: left;
            }

            form {
                /* Centrar el formulario en la página */
                margin: 0 auto;
                width: 500px;
                /* Esquema del formulario */
                padding: 1em;
                border: 1px solid #CCC;
                border-radius: 1em;
            }


            ul {
                list-style: none;
            }

            form li + li {
                margin-top: 1em;
            }

            label {
                /* Tamaño y alineación uniforme */
                display: inline-block;
                width: 90px;
                text-align: right;
            }
            input{
                margin: 0 auto;
            }
            input,
            textarea {
                /* Para asegurarse de que todos los campos de texto tienen la misma configuración de letra
                   Por defecto, las áreas de texto tienen un tipo de letra monoespaciada */
                font: 1em sans-serif;

                /* Tamaño uniforme del campo de texto */
                width: 300px;
                box-sizing: border-box;

                /* Hacer coincidir los bordes del campo del formulario */
                border: 1px solid #999;
            }

            input:focus,
            textarea:focus {
                /* Destacado adicional para elementos que tienen el cursor */
                border-color: #000;
            }

            textarea {
                /* Alinear los campos de texto multilínea con sus etiquetas */
                vertical-align: top;

                /* Proporcionar espacio para escribir texto */
                height: 5em;
            }
        </style>
    </head>
    
    <body>
        <img class="logo" src="/coronaticketsUyWebApp/img/logo.jpeg"/>
        <div id="header">
            <ul class="nav">
                <li><a href="/coronaticketsUyWebApp/login.jsp">Iniciar Sesion</a></li>
                <li><a href="">Usuarios</a>
                    <ul>
                        <li><a href="/coronaticketsUyWebApp/altaUsuario.jsp">Alta Usuario</a></li>
                        <li><a href="">Modificar Usuario</a></li>
                        <li><a href="">Consultar Usuario</a></li>

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
    </ul>
</div>


<%
        ServletContext contexto = getServletContext();
        if (contexto.getAttribute("tipoUsuario") != null) 
        {
            
            if(contexto.getAttribute("tipoUsuario").equals("Espectador") )
            {
                    out.print("<p>pene</p>");
                DtEspectador es = Fabrica.getCrlUsuarios().getDatosEspectador(contexto.getAttribute("nickname").toString());
             
             out.print( "<form action=\"/UsuariosBackEnd\"/  name=\"/fAltaUsuario\"/ id=\"/fAltaUsuario\"/ method=\"/POST\"/>"  );
             out.print( "<p>Nombre:<input type=\"/text\"/ name=\"/nombre\"/ value=\"/"+ es.getNombre() +"\"/ id=\"/nombre\"/ size=\"/30\"/  /></p>"  );
             out.print( "<p>Apellido:<input type=\"/text\"/ name=\"/apellido\"/ value=\"/"+ es.getApellido() +"\"/ id=\"/apellido\"/ size=\"/30\"/ /></p>"  );
             out.print( "<p>Nickname:<input type=\"/text\"/ name=\"/nickname\"/ value=\"/"+ es.getNickname() +"\"/ id=\"/nickname\"/ size=\"/30\"/ disabled /></p>"  );
             out.print( "<p>Correo:<input type=\"/text\"/ name=\"/correo\"/ value=\"/"+ es.getCorreo() +"\"/ id=\"/correo\"/ size=\"/30\"/ disabled /></p>"  );
             out.print( "<p>Contraseña:<input type=\"/password\"/ name=\"/contrasenia\"/ id=\"/contrasenia\"/ value=\"/"+ es.getPass() +"\"/ size=\"/30\"/ /></p>"  );
             out.print( "<p>Fecha: <input type=\"/date\"/ name=\"/fecha\"/ value=\"/"+ es.getFechaNacimiento().toString() +"\"/ id=\"/fecha\"/></p>"  );
             out.print( "</form>"  );
             
            }
        }
%>
    
<form action="UsuariosBackEnd"  name="fAltaUsuario" id="fAltaUsuario" method="POST">
    
     <form action="UsuariosBackEnd"  name="fAltaUsuario" id="fAltaUsuario" method="POST"> 
   
    <p>Link web:<input type="password" name="link" value="" size="30" /></p>

    <p>Biografia:</p>
    <textarea name="biografia" rows="4" cols="30">
    </textarea>

    <p>Descripcion:</p>
    <textarea name="descripcion" rows="4" cols="30">
    </textarea>

    <input type="file" accept="image/*" name="Imagen" size="150"/>

    <input type="submit" name="" value="crear">


</form>
</body>
</html>

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
        <style>


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

        <%@include file="header.jsp" %>
        <%ServletContext contexto = getServletContext();
        %>
        <form action="consultarUsuariosBackEnd" class="container">
            <div class="box">
                <select name="usuario" class="custom-select" id="inputGroupSelect04">

                    <%
                        List<DtArtista> lArt = Fabrica.getCrlUsuarios().getArtistas();
                        List<DtEspectador> lEsp = Fabrica.getCrlUsuarios().getEspectadores();

                        if (contexto.getAttribute("UsuarioSeleccionadaEnConsultarUsuario") != null) {
                            String selUsu = contexto.getAttribute("UsuarioSeleccionadaEnConsultarUsuario").toString();
                            if (selUsu != "Seleccione...") {
                                out.println("<option selected>" + selUsu + "</option>");
                                for (DtArtista a : lArt) {
                                    if (!a.getNickname().equals(selUsu)) {

                                        out.println("<option>" + a.getNickname() + "</option>");
                                    }
                                }
                                for (DtEspectador e : lEsp) {
                                    if (!e.getNickname().equals(selUsu)) {

                                        out.println("<option>" + e.getNickname() + "</option>");
                                    }
                                }
                            } else {
                                out.println("<option selected>Seleccione...</option>");
                                for (DtArtista a : lArt) {
                                    out.println("<option>" + a.getNickname() + "</option>");
                                }
                                for (DtEspectador e : lEsp) {
                                    out.println("<option>" + e.getNickname() + "</option>");
                                }
                            }

                        } else {
                            out.println("<option selected>Seleccione...</option>");
                            for (DtArtista a : lArt) {
                                out.println("<option>" + a.getNickname() + "</option>");
                            }
                            for (DtEspectador e : lEsp) {
                                out.println("<option>" + e.getNickname() + "</option>");
                            }

                        }
                    %>
                </select>
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit" disabled>Consultar</button>
                </div>

        </form> 
        <div class="container infoUsuario">

            <%
                if (contexto.getAttribute("UsuarioSeleccionadaEnConsultarUsuario") != null) {
                    String selUsu = contexto.getAttribute("UsuarioSeleccionadaEnConsultarUsuario").toString();
                    if (selUsu != "Seleccione..." && selUsu != null) {
///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                        for (DtArtista a : lArt) {
                            if (selUsu.equals(a.getNickname())) {
                                out.print("<img src='" + a.getImagen() + "' alt='imagen del artista'>");

                                out.print("<h3>Nickname: " + a.getNickname() + "</h3>");
                                out.print("<p>Nombre:" + a.getNombre() + "</p>");
                                out.print("<p>Apellido:" + a.getApellido() + "</p>");
                                out.print("<p>Correo:" + a.getCorreo() + "</p>");
                                out.print("<p>Fecha de Nacimiento:" + a.getFechaNacimiento().toString() + "</p>");
                                out.print("<p>Link web:" + a.getLinkWeb() + "</p>");
                                out.print("<p>Biografia:" + a.getBiografia() + "</p>");
                                out.print("<p>Descripcion:" + a.getDescripcion() + "</p>");

                                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                List<DtUsuario> lUsuarQueSigues = Fabrica.getCrlUsuarios().getUsuariosQueSiguesAr(a.getNickname());
                                out.print("<form action=\"consultarUsuariosBackEnd\">");
                                out.print("</br>");
                                out.print("</br>");
                                out.print("<h6>Seleccione usuario seguido:</h6>");
                                out.print("<select name='usuQueSiges' class='custom-select selectEsp' id='inputGroupSelect04us'>");
                                if (contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario") == null) {
                                    out.print("<option selected>Seleccione...</option>");

                                    for (DtUsuario usu : lUsuarQueSigues) {
                                        out.print("<option >" + usu.getNickname() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario").toString() != "Seleccione...") {
                                        out.print("<option selected>" + contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario").toString() + "</option>");

                                        for (DtUsuario usu : lUsuarQueSigues) {
                                            if (!contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario").toString().equals(usu.getNickname())) {
                                                out.print("<option >" + usu.getNickname() + "</option>");

                                            }

                                        }
                                    } else {
                                        out.print("<option selected>Seleccione...</option>");

                                        for (DtUsuario usu : lUsuarQueSigues) {
                                            out.print("<option >" + usu.getNickname() + "</option>");

                                        }
                                    }

                                }

                                out.print("</select>");
                                //aaaa

                                out.print("</li>");
                                out.print("</ul>");

                                out.print("<button class='btn btn-outline-secondaryus' type='submit' disabled>Consultar</button>");
                                out.print("</form>");

///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                                //////////////////////////////////////////////
                                if (contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario") != null) {
                                    String sfun = contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario").toString();

                                    if (sfun != "Seleccione..." && sfun != null) {
                                        for (DtUsuario u : lUsuarQueSigues) {
                                            if (sfun.equals(u.getNickname())) {
                                                if (u instanceof DtArtista) {

                                                    out.print("<img src='" + ((DtArtista) u).getImagen() + "'alt='imagen del seguido'>");

                                                    out.print("<h4> Nickname:" + ((DtArtista) u).getNickname() + "</h4>");
                                                    out.print("<p> Nombre:" + ((DtArtista) u).getNombre() + "</p>");
                                                    out.print("<p> Apellido:" + ((DtArtista) u).getApellido() + "</p>");
                                                    out.print("<p> Correo:" + ((DtArtista) u).getCorreo() + "</p>");
                                                    out.print("<p> Fecha de nacimiento" + ((DtArtista) u).getFechaNacimiento().toString() + "</p>");
                                                    out.print("<p> Link web:" + ((DtArtista) u).getLinkWeb() + "</p>");
                                                    out.print("<p> Biografia:" + ((DtArtista) u).getBiografia() + "</p>");
                                                    out.print("<p> Descciopcion:" + ((DtArtista) u).getDescripcion() + "</p>");

                                                }
                                                if (u instanceof DtEspectador) {
                                                    out.print("<img src='" + ((DtEspectador) u).getImagen() + "' alt='imagen del seguido'>");

                                                    out.print("<h4 >" + ((DtEspectador) u).getNickname() + "</h4>");
                                                    out.print("<p >" + ((DtEspectador) u).getNombre() + "</p>");
                                                    out.print("<p >" + ((DtEspectador) u).getApellido() + "</p>");
                                                    out.print("<p>" + ((DtEspectador) u).getCorreo() + "</p>");
                                                    out.print("<p>" + ((DtEspectador) u).getFechaNacimiento().toString() + "</p>");

                                                }

                                            }
                                        }
                                    }
                                }

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
                                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                List<DtUsuario> lUsuarQueTeSiguen = Fabrica.getCrlUsuarios().getUsuariosQueTeSiguenAr(a.getNickname());
                                out.print("<form action=\"consultarUsuariosBackEnd\">");
                                out.print("</br>");
                                out.print("</br>");
                                out.print("<h6>Seleccione usuario que lo seguen:</h6>");
                                out.print("<select name='usuQueTeSigen' class='custom-select selectEsp' id='inputGroupSelect04uts'>");
                                if (contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario") == null) {
                                    out.print("<option selected>Seleccione...</option>");

                                    for (DtUsuario usu : lUsuarQueTeSiguen) {
                                        out.print("<option >" + usu.getNickname() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario").toString() != "Seleccione...") {
                                        out.print("<option selected>" + contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario").toString() + "</option>");

                                        for (DtUsuario usu : lUsuarQueTeSiguen) {
                                            if (!contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario").toString().equals(usu.getNickname())) {
                                                out.print("<option >" + usu.getNickname() + "</option>");

                                            }

                                        }
                                    } else {
                                        out.print("<option selected>Seleccione...</option>");

                                        for (DtUsuario usu : lUsuarQueTeSiguen) {
                                            out.print("<option >" + usu.getNickname() + "</option>");

                                        }
                                    }

                                }

                                out.print("</select>");
                                //aaaa

                                out.print("</li>");
                                out.print("</ul>");

                                out.print("<button class='btn btn-outline-secondaryuts' type='submit' disabled>Consultar</button>");
                                out.print("</form>");

///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                                //////////////////////////////////////////////
                                if (contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario") != null) {
                                    String sfun = contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario").toString();

                                    if (sfun != "Seleccione..." && sfun != null) {
                                        for (DtUsuario u : lUsuarQueSigues) {
                                            if (sfun.equals(u.getNickname())) {
                                                if (u instanceof DtArtista) {
                                                    out.print("<img src='" + ((DtArtista) u).getImagen() + "' alt='imagen del usuario que te sigue'>");

                                                    out.print("<h4> Nickname: " + ((DtArtista) u).getNickname() + "</h4>");
                                                    out.print("<p> Nombre: " + ((DtArtista) u).getNombre() + "</p>");
                                                    out.print("<p> Apellido: " + ((DtArtista) u).getApellido() + "</p>");
                                                    out.print("<p> Correo: " + ((DtArtista) u).getCorreo() + "</p>");
                                                    out.print("<p> Fecha de Nacimiento: " + ((DtArtista) u).getFechaNacimiento().toString() + "</p>");
                                                    out.print("<p> Link web: " + ((DtArtista) u).getLinkWeb() + "</p>");
                                                    out.print("<p> Biografia: " + ((DtArtista) u).getBiografia() + "</p>");
                                                    out.print("<p> Descripcion: " + ((DtArtista) u).getDescripcion() + "</p>");

                                                }
                                                if (u instanceof DtEspectador) {
                                                    out.print("<img src='" + ((DtEspectador) u).getImagen() + "' alt='imagen del paquete'>");

                                                    out.print("<h4> Nickname: " + ((DtEspectador) u).getNickname() + "</h4>");
                                                    out.print("<p>Nombre: " + ((DtEspectador) u).getNombre() + "</p>");
                                                    out.print("<p>Apellido: " + ((DtEspectador) u).getApellido() + "</p>");
                                                    out.print("<p>Correo: " + ((DtEspectador) u).getCorreo() + "</p>");
                                                    out.print("<p>Fecha de Nacimiento: " + ((DtEspectador) u).getFechaNacimiento().toString() + "</p>");

                                                }

                                            }
                                        }
                                    }
                                }

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
////////////////////////////////////////////////////////////////////////////////
                                List<DtEspectaculo> lAuxEspe = Fabrica.getCrlUsuarios().listarEspectaculosDeArtista(a.getNickname());

                                List<DtEspectaculo> lEspectac = new ArrayList<DtEspectaculo>();
                                List<DtEspectaculo> lEspectacRechazador = Fabrica.getCtrlEspectaculos().listarRechazados();
                                List<DtEspectaculo> lEspectacIngresados = Fabrica.getCtrlEspectaculos().listarIngresados();
                                List<String> aux = new ArrayList<String>();
                                if (contexto.getAttribute("tipoUsuario") != null) {
                                    if (!contexto.getAttribute("nickname").toString().equals(a.getNickname())) {
                                        for (DtEspectaculo ingre : lEspectacIngresados) {
                                            aux.add(ingre.getNombre());
                                        }

                                        for (DtEspectaculo recha : lEspectacRechazador) {
                                            aux.add(recha.getNombre());
                                        }
                                        for (DtEspectaculo espe : lAuxEspe) {
                                            if (!aux.contains(espe.getNombre())) {
                                                lEspectac.add(espe);
                                            }

                                        }
                                    } else {
                                        for (DtEspectaculo ingre : lEspectacIngresados) {
                                            aux.add(ingre.getNombre());
                                        }
                                        for (DtEspectaculo recha : lEspectacRechazador) {
                                            aux.add(recha.getNombre());
                                        }
                                        for (DtEspectaculo espe : lAuxEspe) {
                                            lEspectac.add(espe);
                                        }
                                    }
                                } else {
                                    for (DtEspectaculo ingre : lEspectacIngresados) {
                                        aux.add(ingre.getNombre());
                                    }
                                    for (DtEspectaculo recha : lEspectacRechazador) {
                                        aux.add(recha.getNombre());
                                    }
                                    for (DtEspectaculo espe : lAuxEspe) {
                                        if (!aux.contains(espe.getNombre())) {
                                            lEspectac.add(espe);
                                        }

                                    }

                                }
                                out.print("<form action=\"consultarUsuariosBackEnd\">");

                                out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04r'>");
                                out.print("</br>");
                                out.print("</br>");
                                out.print("<h6>Seleccione usuario Espectaculo:</h6>");
                                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario") == null) {
                                    out.print("<option selected>Seleccione...</option>");

                                    for (DtEspectaculo esp : lEspectac) {

                                        out.print("<option >" + esp.getNombre() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario").toString() != "Seleccione...") {
                                        out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario").toString() + "</option>");

                                        for (DtEspectaculo esp : lEspectac) {
                                            if (!contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario").toString().equals(esp.getNombre())) {
                                                out.print("<option >" + esp.getNombre() + "</option>");

                                            }

                                        }
                                    } else {
                                        out.print("<option selected>Seleccione...</option>");

                                        for (DtEspectaculo esp : lEspectac) {
                                            out.print("<option >" + esp.getNombre() + "</option>");

                                        }
                                    }

                                }

                                out.print("</select>");
                                //aaaa

                                out.print("</li>");
                                out.print("</ul>");

                                out.print("<button class='btn btn-outline-secondaryr' type='submit' disabled>Consultar</button>");
                                out.print("</form>");

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
                                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario") != null) {
                                    String sesp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario").toString();

                                    if (sesp != "Seleccione..." && sesp != null) {
                                        for (int i = 0; i < lEspectac.size(); i++) {
                                            if (sesp.equals(lEspectac.get(i).getNombre())) {
                                                out.print("<img src='" + lEspectac.get(i).getImagen() + "' alt='imagen del espectaculo'>");
                                                out.print("<h4> Nombre: " + lEspectac.get(i).getNombre() + "</h4>");
                                                out.print("<p> Descripcion:" + lEspectac.get(i).getDescripcion() + "</p>");
                                                out.print("<p> Duracion:" + lEspectac.get(i).getDuracion() + "</p>");
                                                out.print("<p> Cantidad maxima de espectadores:" + lEspectac.get(i).getCantidadMaximaEspectadores() + "</p>");
                                                out.print("<p> Cantidad minima de espectadores:" + lEspectac.get(i).getCantidadMinimaEspectadores() + "</p>");
                                                out.print("<p> Url:" + lEspectac.get(i).getUrl() + "</p>");
                                                out.print("<p> Costo:" + lEspectac.get(i).getCosto() + "</p>");
                                                out.print("<p> FechaDeRegistro:" + lEspectac.get(i).getFechaDeRegistro() + "</p>");

                                                if (!aux.contains(sesp)) {
                                                    List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario").toString());
                                                    out.print("<form action=\"consultarUsuariosBackEnd\">");
                                                    out.print("</br>");
                                                    out.print("</br>");
                                                    out.print("<h6>Seleccione Funcion:</h6>");
                                                    out.print("<select name='funcion' class='custom-select selectEsp' id='inputGroupSelect04f'>");

                                                    if (contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario") == null) {
                                                        out.print("<option selected>Funciones...</option>");

                                                        for (DtFuncion f : fun) {
                                                            out.print("<option >" + f.getNombre() + "</option>");

                                                        }
                                                    } else {
                                                        if (contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario").toString() != "Espectaculos...") {
                                                            out.print("<option selected>" + contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario").toString() + "</option>");

                                                            for (DtFuncion f : fun) {
                                                                if (!contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario").toString().equals(f.getNombre())) {
                                                                    out.print("<option >" + f.getNombre() + "</option>");

                                                                }

                                                            }
                                                        } else {
                                                            out.print("<option selected>Funciones...</option>");

                                                            for (DtFuncion f : fun) {
                                                                out.print("<option >" + f.getNombre() + "</option>");

                                                            }
                                                        }

                                                    }

                                                    out.print("</select>");

                                                    out.print("</li>");
                                                    out.print("</ul>");

                                                    out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");
                                                    
                                                    out.print("</form>");

///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                                                    //////////////////////////////////////////////
                                                    if (contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario") != null) {
                                                        String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario").toString();

                                                        if (sfun != "Funciones..." && sfun != null) {
                                                            for (DtFuncion f : fun) {
                                                                if (sfun.equals(f.getNombre())) {
                                                                    
                                                                    out.print("<p class='card-text'>" + f.getNombre() + "</p>");
                                                                    out.print("<p class='card-text'>" + f.getFecha().toString() + "</p>");
                                                                    out.print("<p class='card-text'>" + f.getFechaDeRegistro().toString() + "</p>");
                                                                    out.print("<p class='card-text'>" + f.getHoraInicio().toString() + "</p>");

                                                                }
                                                            }
                                                        }
                                                    }

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
                                                    List<String> paqs = Fabrica.getCtrlPaquetes().listarPaquetes();

                                                    out.print("<form action=\"consultarUsuariosBackEnd\">");

                                                    out.print("<select name='paquete' class='custom-select selectEsp' id='inputGroupSelect04pak'>");
                                                    out.print("<option selected>Paquetes...</option>");

                                                    if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarUsuario") == null) {
                                                        out.print("<option selected>Paquetes...</option>");

                                                        for (String p : paqs) {
                                                            if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(p).contains(lEspectac.get(i).getNombre())) {
                                                                out.print("<option >" + p + "</option>");
                                                            }

                                                        }
                                                    } else {
                                                        if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarUsuario").toString() != "Paquetes...") {
                                                            out.print("<option selected>" + contexto.getAttribute("PaqueteSeleccionadoEnConsultarUsuario").toString() + "</option>");
                                                            for (String p : paqs) {
                                                                if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(p).contains(lEspectac.get(i).getNombre())) {
                                                                    if (!contexto.getAttribute("PaqueteSeleccionadoEnConsultarUsuario").toString().equals(p)) {
                                                                        out.print("<option >" + p + "</option>");
                                                                    }
                                                                }
                                                            }
                                                        } else {
                                                            out.print("<option selected>Paquetes...</option>");

                                                            for (String p : paqs) {
                                                                if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(p).contains(lEspectac.get(i).getNombre())) {
                                                                    out.print("<option >" + p + "</option>");
                                                                }

                                                            }
                                                        }

                                                    }

                                                    out.print("</select>");

                                                    out.print("</li>");
                                                    out.print("</ul>");

                                                    out.print("<button class='btn btn-outline-secondarypak' type='submit' disabled>Consultar</button>");
                                                    out.print("</div>");
                                                    out.print("</form>");

                                                    ///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////   
                                                    if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarUsuario") != null) {
                                                        String spaq = contexto.getAttribute("PaqueteSeleccionadoEnConsultarUsuario").toString();

                                                        if (spaq != "Paquetes..." && spaq != null) {
                                                            for (String paq : paqs) {
                                                                if (spaq.equals(paq)) {
                                                                    DtPaqueteDeEspectaculos instanciaP = Fabrica.getCtrlPaquetes().mostrarInfoPaquete(paq);
                                                                    out.print("<div class='card' style='width: 18rem;'>");
                                                                    out.print("<p class='card-text'>" + instanciaP.getNombre() + "</p>");
                                                                    out.print("<p class='card-text'>" + instanciaP.getDescripcion() + "</p>");
                                                                    out.print("<p class='card-text'>" + instanciaP.getDescuento() + "</p>");

                                                                    out.print("<p class='card-text'>" + instanciaP.getFechaInicio().toString() + "</p>");
                                                                    out.print("<p class='card-text'>" + instanciaP.getFechaFin().toString() + "</p>");
                                                                    out.print("<p class='card-text'>" + instanciaP.getFechaAlta().toString() + "</p>");

                                                                    out.print("</div>");

                                                                }
                                                            }
                                                        }
                                                    }
                                                    ///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                                                }
                                            }
                                        }
                                    }
                                }
///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////         
                            }
                        }

///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////                        
                        for (DtEspectador e : lEsp) {
                            if (selUsu.equals(e.getNickname())) {
                                out.print("<div class='card' style='width: 18rem;'>");
                                out.print("<img src='" + e.getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
                                out.print("</div>");
                                out.print("<h5 class='card-title'>" + e.getNickname() + "</h5>");
                                out.print("<p class='card-text'>" + e.getNombre() + "</p>");
                                out.print("<p class='card-text'>" + e.getApellido() + "</p>");
                                out.print("<p class='card-text'>" + e.getCorreo() + "</p>");
                                out.print("<p class='card-text'>" + e.getFechaNacimiento().toString() + "</p>");

                                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                List<DtUsuario> lUsuarQueSigues = Fabrica.getCrlUsuarios().getUsuariosQueSiguesEs(e.getNickname());
                                out.print("<form action=\"consultarUsuariosBackEnd\">");

                                out.print("<select name='usuQueSiges' class='custom-select selectEsp' id='inputGroupSelect04us'>");
                                if (contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario") == null) {
                                    out.print("<option selected>Seleccione...</option>");

                                    for (DtUsuario usu : lUsuarQueSigues) {
                                        out.print("<option >" + usu.getNickname() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario").toString() != "Seleccione...") {
                                        out.print("<option selected>" + contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario").toString() + "</option>");

                                        for (DtUsuario usu : lUsuarQueSigues) {
                                            if (!contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario").toString().equals(usu.getNickname())) {
                                                out.print("<option >" + usu.getNickname() + "</option>");

                                            }

                                        }
                                    } else {
                                        out.print("<option selected>Seleccione...</option>");

                                        for (DtUsuario usu : lUsuarQueSigues) {
                                            out.print("<option >" + usu.getNickname() + "</option>");

                                        }
                                    }

                                }

                                out.print("</select>");
                                //aaaa

                                out.print("</li>");
                                out.print("</ul>");

                                out.print("<button class='btn btn-outline-secondaryus' type='submit' disabled>Consultar</button>");
                                out.print("</form>");
                                out.print("</div>");

///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                                //////////////////////////////////////////////
                                if (contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario") != null) {
                                    String sfun = contexto.getAttribute("UsuarioQueSiguesSeleccionadEnConsultarUsuario").toString();

                                    if (sfun != "Seleccione..." && sfun != null) {
                                        for (DtUsuario u : lUsuarQueSigues) {
                                            if (sfun.equals(u.getNickname())) {
                                                if (u instanceof DtArtista) {
                                                    out.print("<div class='card' style='width: 18rem;'>");
                                                    out.print("<img src='" + ((DtArtista) u).getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
                                                    out.print("</div>");
                                                    out.print("<h5 class='card-title'>" + ((DtArtista) u).getNickname() + "</h5>");
                                                    out.print("<p class='card-text'>" + ((DtArtista) u).getNombre() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtArtista) u).getApellido() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtArtista) u).getCorreo() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtArtista) u).getFechaNacimiento().toString() + "</p>");

                                                }
                                                if (u instanceof DtEspectador) {
                                                    out.print("<div class='card' style='width: 18rem;'>");
                                                    out.print("<img src='" + ((DtEspectador) u).getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
                                                    out.print("</div>");
                                                    out.print("<h5 class='card-title'>" + ((DtEspectador) u).getNickname() + "</h5>");
                                                    out.print("<p class='card-text'>" + ((DtEspectador) u).getNombre() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtEspectador) u).getApellido() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtEspectador) u).getCorreo() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtEspectador) u).getFechaNacimiento().toString() + "</p>");

                                                }

                                            }
                                        }
                                    }
                                }

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
////////////////////////////////////////////////////////////////////////////////
                                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                List<DtUsuario> lUsuarQueTeSiguen = Fabrica.getCrlUsuarios().getUsuariosQueTeSiguenEs(e.getNickname());
                                out.print("<form action=\"consultarUsuariosBackEnd\">");

                                out.print("<select name='usuQueTeSigen' class='custom-select selectEsp' id='inputGroupSelect04uts'>");
                                if (contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario") == null) {
                                    out.print("<option selected>Seleccione...</option>");

                                    for (DtUsuario usu : lUsuarQueTeSiguen) {
                                        out.print("<option >" + usu.getNickname() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario").toString() != "Seleccione...") {
                                        out.print("<option selected>" + contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario").toString() + "</option>");

                                        for (DtUsuario usu : lUsuarQueTeSiguen) {
                                            if (!contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario").toString().equals(usu.getNickname())) {
                                                out.print("<option >" + usu.getNickname() + "</option>");

                                            }

                                        }
                                    } else {
                                        out.print("<option selected>Seleccione...</option>");

                                        for (DtUsuario usu : lUsuarQueTeSiguen) {
                                            out.print("<option >" + usu.getNickname() + "</option>");

                                        }
                                    }

                                }

                                out.print("</select>");
                                //aaaa

                                out.print("</li>");
                                out.print("</ul>");

                                out.print("<button class='btn btn-outline-secondaryuts' type='submit' disabled>Consultar</button>");
                                out.print("</form>");
                                out.print("</div>");

///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                                //////////////////////////////////////////////
                                if (contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario") != null) {
                                    String sfun = contexto.getAttribute("UsuarioQueTeSiguenSeleccionadEnConsultarUsuario").toString();

                                    if (sfun != "Seleccione..." && sfun != null) {
                                        for (DtUsuario u : lUsuarQueSigues) {
                                            if (sfun.equals(u.getNickname())) {
                                                if (u instanceof DtArtista) {
                                                    out.print("<div class='card' style='width: 18rem;'>");
                                                    out.print("<img src='" + ((DtArtista) u).getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
                                                    out.print("</div>");
                                                    out.print("<h5 class='card-title'>" + ((DtArtista) u).getNickname() + "</h5>");
                                                    out.print("<p class='card-text'>" + ((DtArtista) u).getNombre() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtArtista) u).getApellido() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtArtista) u).getCorreo() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtArtista) u).getFechaNacimiento().toString() + "</p>");

                                                }
                                                if (u instanceof DtEspectador) {
                                                    out.print("<div class='card' style='width: 18rem;'>");
                                                    out.print("<img src='" + ((DtEspectador) u).getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
                                                    out.print("</div>");
                                                    out.print("<h5 class='card-title'>" + ((DtEspectador) u).getNickname() + "</h5>");
                                                    out.print("<p class='card-text'>" + ((DtEspectador) u).getNombre() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtEspectador) u).getApellido() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtEspectador) u).getCorreo() + "</p>");
                                                    out.print("<p class='card-text'>" + ((DtEspectador) u).getFechaNacimiento().toString() + "</p>");

                                                }

                                            }
                                        }
                                    }
                                }

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
////////////////////////////////////////////////////////////////////////////////
                                if (contexto.getAttribute("tipoUsuario") != null) {
                                    if (contexto.getAttribute("nickname").toString().equals(e.getNickname())) {
                                        List<DtPaqueteDeEspectaculos> listaPaquetes = Fabrica.getCrlUsuarios().getPaquetesDelUsuario(e.getNickname());

                                        out.print("<form action=\"consultarUsuariosBackEnd\">");

                                        out.print("<select name='paqueteComprado' class='custom-select selectEsp' id='inputGroupSelect04r'>");
                                        if (contexto.getAttribute("PaqueteCompradoSeleccionadoEnConsultarUsuario") == null) {
                                            out.print("<option selected>Seleccione...</option>");

                                            for (DtPaqueteDeEspectaculos paq : listaPaquetes) {
                                                out.print("<option >" + paq.getNombre() + "</option>");

                                            }
                                        } else {
                                            if (contexto.getAttribute("PaqueteCompradoSeleccionadoEnConsultarUsuario").toString() != "Seleccione...") {
                                                out.print("<option selected>" + contexto.getAttribute("PaqueteCompradoSeleccionadoEnConsultarUsuario").toString() + "</option>");

                                                for (DtPaqueteDeEspectaculos paq : listaPaquetes) {
                                                    if (!contexto.getAttribute("PaqueteCompradoSeleccionadoEnConsultarUsuario").toString().equals(paq.getNombre())) {
                                                        out.print("<option >" + paq.getNombre() + "</option>");

                                                    }

                                                }
                                            } else {
                                                out.print("<option selected>Seleccione...</option>");

                                                for (DtPaqueteDeEspectaculos paq : listaPaquetes) {
                                                    out.print("<option >" + paq.getNombre() + "</option>");

                                                }
                                            }

                                        }
                                        out.print("</select>");
                                        //aaaa

                                        out.print("</li>");
                                        out.print("</ul>");

                                        out.print("<button class='btn btn-outline-secondaryr' type='submit' disabled>Consultar</button>");
                                        out.print("</form>");
                                        out.print("</div>");

                                        if (contexto.getAttribute("PaqueteCompradoSeleccionadoEnConsultarUsuario") != null) {
                                            String spaq = contexto.getAttribute("PaqueteCompradoSeleccionadoEnConsultarUsuario").toString();

                                            if (spaq != "Paquetes..." && spaq != null) {
                                                for (DtPaqueteDeEspectaculos instanciaP : listaPaquetes) {
                                                    if (spaq.equals(instanciaP.getNombre())) {
                                                        out.print("<div class='card' style='width: 18rem;'>");
                                                        out.print("<p class='card-text'>" + instanciaP.getNombre() + "</p>");
                                                        out.print("<p class='card-text'>" + instanciaP.getDescripcion() + "</p>");
                                                        out.print("<p class='card-text'>" + instanciaP.getDescuento() + "</p>");

                                                        out.print("<p class='card-text'>" + instanciaP.getFechaInicio().toString() + "</p>");
                                                        out.print("<p class='card-text'>" + instanciaP.getFechaFin().toString() + "</p>");
                                                        out.print("<p class='card-text'>" + instanciaP.getFechaAlta().toString() + "</p>");

                                                        out.print("</div>");

                                                    }
                                                }
                                            }
                                        }

                                    }

                                }

/////////////////////////////////////////////////////////////////////////////// 
////////////////////////////////////////////////////////////////////////////////
                                List<DtRegistro> lRegistr = Fabrica.getCrlUsuarios().getRegistros(e.getNickname());
                                List<DtFuncion> lFunciones = Fabrica.getCrlUsuarios().getFuncionesRegistros(e.getNickname());
                                out.print("<form action=\"consultarUsuariosBackEnd\">");

                                out.print("<select name='registro' class='custom-select selectEsp' id='inputGroupSelect04r'>");
                                if (contexto.getAttribute("RegistroSeleccionadaEnConsultarUsuario") == null) {
                                    out.print("<option selected>Seleccione...</option>");

                                    for (DtRegistro reg : lRegistr) {
                                        out.print("<option >" + reg.getNombreFuncion() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("RegistroSeleccionadaEnConsultarUsuario").toString() != "Seleccione...") {
                                        out.print("<option selected>" + contexto.getAttribute("RegistroSeleccionadaEnConsultarUsuario").toString() + "</option>");

                                        for (DtRegistro reg : lRegistr) {
                                            if (!contexto.getAttribute("RegistroSeleccionadaEnConsultarUsuario").toString().equals(reg.getNombreFuncion())) {
                                                out.print("<option >" + reg.getNombreFuncion() + "</option>");

                                            }

                                        }
                                    } else {
                                        out.print("<option selected>Seleccione...</option>");

                                        for (DtRegistro reg : lRegistr) {
                                            out.print("<option >" + reg.getNombreFuncion() + "</option>");

                                        }
                                    }

                                }

                                out.print("</select>");
                                //aaaa

                                out.print("</li>");
                                out.print("</ul>");

                                out.print("<button class='btn btn-outline-secondaryr' type='submit' disabled>Consultar</button>");
                                out.print("</form>");
                                out.print("</div>");

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
                                if (contexto.getAttribute("RegistroSeleccionadaEnConsultarUsuario") != null) {
                                    String sfun = contexto.getAttribute("RegistroSeleccionadaEnConsultarUsuario").toString();

                                    if (sfun != "Seleccione..." && sfun != null) {
                                        for (int i = 0; i < lFunciones.size(); i++) {
                                            if (sfun.equals(lFunciones.get(i).getNombre())) {
                                                out.print("<div class='card' style='width: 18rem;'>");
                                                out.print("<p class='card-text'>" + lFunciones.get(i).getNombre() + "</p>");
                                                out.print("<p class='card-text'>" + lFunciones.get(i).getFecha().toString() + "</p>");
                                                out.print("<p class='card-text'>" + lFunciones.get(i).getFechaDeRegistro().toString() + "</p>");
                                                out.print("<p class='card-text'>" + lFunciones.get(i).getHoraInicio().toString() + "</p>");
                                                out.print("<p class='card-text'>" + lRegistr.get(i).getCosto() + "</p>");
                                                out.print("<p class='card-text'>" + lRegistr.get(i).getEstado().toString() + "</p>");
                                                out.print("<p class='card-text'>" + lRegistr.get(i).getFecha().toString() + "</p>");

                                                out.print("</div>");

                                            }
                                        }
                                    }
                                }

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
                            }
                        }
///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////                          
                    }
                }


            %>
        </div>  
    </div>

    <script>
        const usus = document.getElementById("inputGroupSelect04");
        const botonConsultarUsu = document.querySelector(".btn-outline-secondary");
        usus.addEventListener("change", e => {
            if (e.target.value === "Seleccione...") {
                botonConsultarUsu.disabled = true;
            } else {
                botonConsultarUsu.disabled = false;
            }
        });

    </script>

    <script>
        const regis = document.getElementById("inputGroupSelect04r");
        const botonConsultarReg = document.querySelector(".btn-outline-secondaryr");
        regis.addEventListener("change", e => {
            if (e.target.value === "Seleccione...") {
                botonConsultarReg.disabled = true;
            } else {
                botonConsultarReg.disabled = false;
            }
        });

    </script>

    <script>
        const funs = document.getElementById("inputGroupSelect04f");
        const botonConsultarFun = document.querySelector(".btn-outline-secondaryf");
        funs.addEventListener("change", e => {
            if (e.target.value === "Seleccione...") {
                botonConsultarFun.disabled = true;
            } else {
                botonConsultarFun.disabled = false;
            }
        });

    </script>

    <script>
        const paks = document.getElementById("inputGroupSelect04pak");
        const botonConsultarPak = document.querySelector(".btn-outline-secondarypak");
        paks.addEventListener("change", e => {
            if (e.target.value === "Seleccione...") {
                botonConsultarPak.disabled = true;
            } else {
                botonConsultarPak.disabled = false;
            }
        });

    </script>

    <script>
        const usuSeguidoSelected = document.getElementById("inputGroupSelect04us");
        const botonConsultarUSS = document.querySelector(".btn-outline-secondaryus");
        usuSeguidoSelected.addEventListener("change", e => {
            if (e.target.value === "Seleccione...") {
                botonConsultarUSS.disabled = true;
            } else {
                botonConsultarUSS.disabled = false;
            }
        });

    </script>

    <script>
        const usuQueTeSigueSelected = document.getElementById("inputGroupSelect04uts");
        const botonConsultarUTS = document.querySelector(".btn-outline-secondaryuts");
        usuQueTeSigueSelected.addEventListener("change", e => {
            if (e.target.value === "Seleccione...") {
                botonConsultarUTS.disabled = true;
            } else {
                botonConsultarUTS.disabled = false;
            }
        });

    </script>
    <%@include file="headerScript.jsp"%>
</body>

</html>


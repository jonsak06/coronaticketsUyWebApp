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

    </head>

    <body>

        <%@include file="header.jsp" %>
        <%ServletContext contexto = getServletContext();
        %>
        <form action="consultarUsuariosBackEnd" class="container">
            <div class="input-group">
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
                                out.print("<div class='card' style='width: 18rem;'>");
                                out.print("<img src='" + a.getImagen() + "' class='card-img-top' alt='imagen del paquete'>");
                                out.print("<div class='card-body'>");
                                out.print("<h5 class='card-title'>" + a.getNickname() + "</h5>");
                                out.print("<p class='card-text'>" + a.getNombre() + "</p>");
                                out.print("<p class='card-text'>" + a.getApellido() + "</p>");
                                out.print("<p class='card-text'>" + a.getCorreo() + "</p>");
                                out.print("<p class='card-text'>" + a.getFechaNacimiento().toString() + "</p>");
                                out.print("</div>");
                                out.print("</div>");

                                List<DtEspectaculo> lEspectac = Fabrica.getCrlUsuarios().listarEspectaculosDeArtista(a.getNickname());
                                out.print("<form action=\"consultarUsuariosBackEnd\">");

                                out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04r'>");
                                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario") == null) {
                                    out.print("<option selected>Seleccione...</option>");

                                    for (DtEspectaculo esp : lEspectac) {
                                        out.print("<option >" + esp.getNombre() + "</option>");

                                    }
                                } else {
                                    if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario") != "Seleccione...") {
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
                                out.print("<div class='card-body'>");
                                out.print("<button class='btn btn-outline-secondaryr' type='submit' disabled>Consultar</button>");
                                out.print("</form>");
                                out.print("</div>");

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
                                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario") != null) {
                                    String sesp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario").toString();

                                    if (sesp != "Seleccione..." && sesp != null) {
                                        for (int i = 0; i < lEspectac.size(); i++) {
                                            if (sesp.equals(lEspectac.get(i).getNombre())) {
                                                out.print("<div class='card' style='width: 18rem;'>");
                                                out.print("<p class='card-text'>" + lEspectac.get(i).getNombre() + "</p>");
                                                out.print("<p class='card-text'>" + lEspectac.get(i).getDescripcion() + "</p>");
                                                out.print("<p class='card-text'>" + lEspectac.get(i).getDuracion() + "</p>");
                                                out.print("<p class='card-text'>" + lEspectac.get(i).getCantidadMaximaEspectadores() + "</p>");
                                                out.print("<p class='card-text'>" + lEspectac.get(i).getCantidadMinimaEspectadores() + "</p>");
                                                out.print("<p class='card-text'>" + lEspectac.get(i).getUrl() + "</p>");
                                                out.print("<p class='card-text'>" + lEspectac.get(i).getCosto() + "</p>");
                                                out.print("<p class='card-text'>" + lEspectac.get(i).getFechaDeRegistro() + "</p>");

                                                out.print("</div>");

                                                List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarUsuario").toString());
                                                out.print("<form action=\"consultarUsuariosBackEnd\">");

                                                out.print("<select name='funcion' class='custom-select selectEsp' id='inputGroupSelect04f'>");

                                                if (contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario") == null) {
                                                    out.print("<option selected>Funciones...</option>");

                                                    for (DtFuncion f : fun) {
                                                        out.print("<option >" + f.getNombre() + "</option>");

                                                    }
                                                } else {
                                                    if (contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario") != "Espectaculos...") {
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
                                                out.print("<div class='card-body'>");
                                                out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");
                                                out.print("</div>");
                                                out.print("</form>");
                                                out.print("</div>");

///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                                                //////////////////////////////////////////////
                                                if (contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario") != null) {
                                                    String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarUsuario").toString();

                                                    if (sfun != "Funciones..." && sfun != null) {
                                                        for (DtFuncion f : fun) {
                                                            if (sfun.equals(f.getNombre())) {
                                                                out.print("<div class='card' style='width: 18rem;'>");
                                                                out.print("<p class='card-text'>" + f.getNombre() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getFecha().toString() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getFechaDeRegistro().toString() + "</p>");
                                                                out.print("<p class='card-text'>" + f.getHoraInicio().toString() + "</p>");

                                                                out.print("</div>");

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
                                                    if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarUsuario") != "Paquetes...") {
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
                                                out.print("<div class='card-body'>");
                                                out.print("<button class='btn btn-outline-secondarypak' type='submit' disabled>Consultar</button>");
                                                out.print("</div>");
                                                out.print("</form>");
                                                out.print("</div>");
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
                                out.print("<div class='card-body'>");
                                out.print("<h5 class='card-title'>" + e.getNickname() + "</h5>");
                                out.print("<p class='card-text'>" + e.getNombre() + "</p>");
                                out.print("<p class='card-text'>" + e.getApellido() + "</p>");
                                out.print("<p class='card-text'>" + e.getCorreo() + "</p>");
                                out.print("<p class='card-text'>" + e.getFechaNacimiento().toString() + "</p>");
                                out.print("</div>");
                                out.print("</div>");

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
                                    if (contexto.getAttribute("RegistroSeleccionadaEnConsultarUsuario") != "Seleccione...") {
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
                                out.print("<div class='card-body'>");
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
        <%@include file="headerScript.jsp"%>
    </body>

</html>


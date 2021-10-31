<%-- 
    Document   : consultarEspectaculoFinalizado
    Created on : 28 oct. 2021, 22:26:35
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
    </head>
    <body>
        <%ServletContext contexto = getServletContext();%>
        <%
            List<DtEspectaculo> lEspectac = Fabrica.getCrlUsuarios().listarEspectaculosFinalizadosDeArtista(contexto.getAttribute("nickname").toString());

            out.print("<form action=\"consultarEspectaculoFinalizadoBackEnd\">");
            out.print("</br>");
            out.print("</br>");
            out.print("<h6>Seleccione Espectaculo:</h6>");

            out.print("<select name='espectaculo' class='custom-select selectEsp' id='inputGroupSelect04r'>");

            if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados") == null) {
                out.print("<option selected>Seleccione...</option>");

                for (DtEspectaculo esp : lEspectac) {

                    out.print("<option >" + esp.getNombre() + "</option>");

                }
            } else {
                if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString() != "Seleccione...") {
                    out.print("<option selected>" + contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString() + "</option>");

                    for (DtEspectaculo esp : lEspectac) {
                        if (!contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString().equals(esp.getNombre())) {
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
            if (contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados") != null) {
                String sesp = contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString();

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

                            List<DtFuncion> fun = Fabrica.getCtrlEspectaculos().listarTodasLasFunciones(contexto.getAttribute("EspectaculoSeleccionadpEnConsultarFinalizados").toString());
                            out.print("<form action=\"consultarEspectaculoFinalizadoBackEnd\">");
                            out.print("</br>");
                            out.print("</br>");
                            out.print("<h6>Seleccione Funcion:</h6>");
                            out.print("<select name='funcion' class='custom-select selectEsp' id='inputGroupSelect04f'>");

                            if (contexto.getAttribute("FuncionSeleccionadaEnConsultarFinalizados") == null) {
                                out.print("<option selected>Funciones...</option>");

                                for (DtFuncion f : fun) {
                                    out.print("<option >" + f.getNombre() + "</option>");

                                }
                            } else {
                                if (contexto.getAttribute("FuncionSeleccionadaEnConsultarFinalizados").toString() != "Funciones...") {
                                    out.print("<option selected>" + contexto.getAttribute("FuncionSeleccionadaEnConsultarFinalizados").toString() + "</option>");

                                    for (DtFuncion f : fun) {
                                        if (!contexto.getAttribute("FuncionSeleccionadaEnConsultarFinalizados").toString().equals(f.getNombre())) {
                                            out.print("<option >" + f.getNombre() + "</option>");

                                        }

                                    }
                                } else {
                                    out.print("<option selected>Pene...</option>");

//                                    for (DtFuncion f : fun) {
//                                        out.print("<option >" + f.getNombre() + "</option>");
//
//                                    }
                                    
                                }

                            }


                            out.print("</li>");
                            out.print("</ul>");

                            out.print("<button class='btn btn-outline-secondaryf' type='submit' disabled>Consultar</button>");

                            out.print("</form>");

///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////  
                            //////////////////////////////////////////////
                            if (contexto.getAttribute("FuncionSeleccionadaEnConsultarFinalizados") != null) {
                                String sfun = contexto.getAttribute("FuncionSeleccionadaEnConsultarFinalizados").toString();

                                if (sfun != "Funciones..." && sfun != null) {
                                    for (DtFuncion f : fun) {
                                        if (sfun.equals(f.getNombre())) {
                                            out.print("<img src='" + f.getImagen() + "' alt='imagen de la funcion'>");
                                            out.print("<h5>" + f.getNombre() + "</h5>");
                                            out.print("<p>" + f.getImagen() + "</p>");
                                            out.print("<p>" + f.getFecha().toString() + "</p>");
                                            out.print("<p>" + f.getFechaDeRegistro().toString() + "</p>");
                                            out.print("<p>" + f.getHoraInicio().toString() + "</p>");

                                        }
                                    }
                                }
                            }

///////////////////////////////////////////////////////////////////////////////                        
/////////////////////////////////////////////////////////////////////////////// 
                            List<String> paqs = Fabrica.getCtrlPaquetes().listarPaquetes();

                            out.print("<form action=\"consultarEspectaculoFinalizadoBackEnd\">");
                            out.print("</br>");
                            out.print("</br>");
                            out.print("<h6>Seleccione Paquete:</h6>");
                            out.print("<select name='paquete' class='custom-select selectEsp' id='inputGroupSelect04pak'>");
                            out.print("<option selected>Paquetes...</option>");

                            if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarFinalizados") == null) {
                                out.print("<option selected>Paquetes...</option>");

                                for (String p : paqs) {
                                    if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(p).contains(lEspectac.get(i).getNombre())) {
                                        out.print("<option >" + p + "</option>");
                                    }

                                }
                            } else {
                                if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarFinalizados").toString() != "Paquetes...") {
                                    out.print("<option selected>" + contexto.getAttribute("PaqueteSeleccionadoEnConsultarFinalizados").toString() + "</option>");
                                    for (String p : paqs) {
                                        if (Fabrica.getCtrlPaquetes().listarEspectaculosIncluidos(p).contains(lEspectac.get(i).getNombre())) {
                                            if (!contexto.getAttribute("PaqueteSeleccionadoEnConsultarFinalizados").toString().equals(p)) {
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

                            out.print("</form>");

                            ///////////////////////////////////////////////////////////////////////////////                        
///////////////////////////////////////////////////////////////////////////////   
                            if (contexto.getAttribute("PaqueteSeleccionadoEnConsultarFinalizados") != null) {
                                String spaq = contexto.getAttribute("PaqueteSeleccionadoEnConsultarFinalizados").toString();

                                if (spaq != "Paquetes..." && spaq != null) {
                                    for (String paq : paqs) {
                                        if (spaq.equals(paq)) {
                                            DtPaqueteDeEspectaculos instanciaP = Fabrica.getCtrlPaquetes().mostrarInfoPaquete(paq);
                                            out.print("<img src='" + instanciaP.getImagen() + "' alt='imagen del paquete'>");
                                            out.print("<h5>Nombre:" + instanciaP.getNombre() + "</h5>");
                                            out.print("<p>Descipcion:" + instanciaP.getDescripcion() + "</p>");
                                            out.print("<p>Decuento:" + instanciaP.getDescuento() + "</p>");

                                            out.print("<p>Fecha Inicio:" + instanciaP.getFechaInicio().toString() + "</p>");
                                            out.print("<p>Fecha Fin:" + instanciaP.getFechaFin().toString() + "</p>");
                                            out.print("<p>Fecha de alta:" + instanciaP.getFechaAlta().toString() + "</p>");

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

        %>



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

    </body>
</html>

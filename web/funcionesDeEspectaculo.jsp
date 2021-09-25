<%-- 
    Document   : funcionesDeEspectaculo
    Created on : Sep 21, 2021, 3:19:01 PM
    Author     : julio
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
        <title>Seleccione una Funcion</title>
    </head>
    <body>
    <div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
    <div class="row">
    <div class="col-md-12">
    <div class="card">
        <form action = "listarCanjeables" name="listarCanjeables" method="POST" class="box">
        <h1>Funciones del espectaculo: <% out.print(request.getParameter("espectaculos")); %></h1>
        <select name="funcion">
            <%
                IEspectaculos ie = Fabrica.getCtrlEspectaculos();
                iUsuarios iu = Fabrica.getCrlUsuarios();
                List<DtFuncion> listaFin = new ArrayList<DtFuncion>();
                List<DtFuncion> lista = ie.listarFunciones(request.getParameter("espectaculos"));
                for(DtFuncion i: lista){
                ServletContext contexto = getServletContext();
                String nick = contexto.getAttribute("nickname").toString();
                List<DtFuncion> lista2 = iu.getFuncionesNoRegistradas(nick);
                for(DtFuncion j: lista2){
                    if(j.getNombre().equals(i.getNombre())){
                    if(listaFin.contains(i)==false){
                    listaFin.add(i);
                }
                }
                }
                }
                for(DtFuncion f: listaFin){
                out.println("<option>"+f.getNombre()+" "+f.getHoraInicio()+"</option>");
                }
            %>
        </select><input type="submit" value="Seleccionar" />
        </form>
    </div>
    </div>
    </div>
    </body>
</html>

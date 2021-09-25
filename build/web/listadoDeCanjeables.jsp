<%-- 
    Document   : listadoDeCanjeables
    Created on : Sep 25, 2021, 6:29:43 PM
    Author     : julio
--%>

<%@page import="root.entidades.Registro"%>
<%@page import="root.datatypes.DtRegistro"%>
<%@page import="java.util.List"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container">
    <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <form action = "" name="" method="POST" class = "box">
                    <% 
                    ServletContext contexto = getServletContext();
                    String nick = contexto.getAttribute("nickname").toString();
                    iUsuarios iu = Fabrica.getCrlUsuarios();
                    if(iu.getCanjeables(nick)<3){
                    out.println("<h1>NO TIENES SUFICIENTES REGISTROS PARA CANJEAR</h1>");
                    out.println("<input  type = \"submit\" value = \"continuar\" / >");
                    }else{
                    out.println("<h1>Listado de Canjeables</h1>");
                    for(Registro i: iu.listarCanjeables(nick)){
                        out.println("<p><input type=\"checkbox\" name="+i.getFuncion().getNombre()+" "+i.getFuncion().getFecha()+"  value=\"ON\"/ id="+i.getFuncion().getNombre()+"><label for "+i.getFuncion().getNombre()+">"+i.getFuncion().getNombre()+"</label></p>");
                    }
                    
//                    out.println("<input type=\"checkbox\" name=\"\" value=\"ON\"/>");
                    }
                    %>
<!--                    <h1>Listado de Canjeables</h1>
                    <input type="text" name="plataforma" value="" placeholder="Buscar por Plataforma"/><input type="submit" value="Listar" />-->
                </form>
            </div>
        </div>
    </div>
    </div>
</html>

<%-- 
    Document   : test
    Created on : Sep 16, 2021, 10:43:40 PM
    Author     : julio
--%>

<%@page import="root.datatypes.DtArtista"%>
<%@page import="root.datatypes.DtEspectaculo"%>
<%@page import="root.interfaces.IEspectaculos"%>
<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iUsuarios"%>
<%@page import="javax.servlet.ServletContext"%>
<%@page import="java.util.List"%>
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
        <title>CoronaTicketsUy</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'><link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" href="headerStyles.css">
    </head>
    <body>
            <link rel="stylesheet" href="./miestilo.css" type="text/css"><!-- comment -->

        <%
            String ua=request.getHeader("User-Agent").toLowerCase();
            if(ua.matches("(?i).*((android|bb\\d+|meego).+mobile|avantgo|bada\\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\\.(browser|link)|vodafone|wap|windows ce|xda|xiino).*")||ua.substring(0,4).matches("(?i)1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\\-|your|zeto|zte\\-")) {
              response.sendRedirect("indexMovil.jsp");
              return;
            }
        %>
        <%@include file="header.jsp"%>
        <%@include file="headerScript.jsp"%>
<!-- partial:index.partial.html -->
<section class="awSlider">
  <div  class="carousel slide" data-ride="carousel" width="640" height="480">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target=".carousel" data-slide-to="0" class="active"></li>
        <%
       List<DtArtista> artistas = Fabrica.getCrlUsuarios().getArtistas();
       
        int i=1;
        for(DtArtista e :artistas){
        out.println("<li data-target=\".carousel\" data-slide-to=\""+i+"\"></li>");
        i = i+1;
    }
    
%>
<!--      
      <li data-target=".carousel" data-slide-to="1"></li>
      <li data-target=".carousel" data-slide-to="2"></li>
      <li data-target=".carousel" data-slide-to="3"></li>-->
    </ol>
<div class="carousel-inner" role="listbox">
<div class="item active">
    <img src="http://raspberrypijulio.ddns.net/ImagenesLab/logo.jpeg" width="640" height="480" >
    <div class="carousel-caption"><p>Encontra todos tus artistas favoritos y seguilos para enterarte de las últimas novedades</p></div>
</div>
<%
    for(DtArtista a: artistas){
    out.println("<div class=\"item\">");
    iUsuarios iu = Fabrica.getCrlUsuarios();

    out.println("<img src=\""+a.getImagen()+"\" width=\"640\" height=\"480\">");
    out.println("<div class=\"carousel-caption\"><h1>"+a.getNombre()+" "+a.getApellido()+"</h1><p><b><i>Seguilo como: "+a.getNickname()+"</i></b></p></div>");
    out.println("</div>");
    }
%>
</div>
    <!-- Wrapper for slides -->
<!--    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-941.jpg">
        <div class="carousel-caption">Görsel #1</div>
      </div>
      <div class="item">
        <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-101.jpg">
        <div class="carousel-caption">Görsel #2</div>
      </div>
      <div class="item">
        <img src="http://www.adobewordpress.com/wp-content/uploads/2014/02/wallpaper-thumb-1051.jpg">
        <div class="carousel-caption">Görsel #3</div>
      </div>
      <div class="item">
        <img src="http://www.adobewordpress.com/wp-content/uploads/2013/07/wallpaper-thumb-74.jpg">
        <div class="carousel-caption">Görsel #4</div>
      </div>
    </div>-->

    <!-- Controls -->
    <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Geri</span>
    </a>
    <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">İleri</span>
    </a>
  </div>
</section>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script><script  src="./script.js"></script>
    </body>
</html>

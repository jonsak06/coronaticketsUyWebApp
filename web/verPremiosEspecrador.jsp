<%-- 
    Document   : verPremiosEspecrador
    Created on : 27 oct. 2021, 11:07:22
    Author     : tecnologo
--%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="root.interfaces.*"%>
<%@page import="root.datatypes.*"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="java.sql.Date"%>
<%@page import="com.google.gson.Gson"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            iRegistrosAcceso ir = Fabrica.getCtrlRegistrosAcceso();
            long moment = new java.util.Date().getTime();
            DtRegistroAcceso r = new DtRegistroAcceso(0, java.net.InetAddress.getLocalHost().getHostAddress(), request.getHeader("User-Agent"), request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/" + request.getServletPath().substring(request.getServletPath().lastIndexOf("/") + 1), moment);
            ir.ingresarRegistro(r);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

        <div id="headerDesktop">
            <%@include file="header.jsp"%>
        </div>

        <div class="box">
            <%ServletContext contexto = getServletContext();%>
            <%

               String context = "";
               if(contexto.getAttribute("realPath")!=null){
                    context=contexto.getAttribute("realPath").toString();
                }
                Gson gson = new Gson();
            String contextGson = gson.toJson(context);
                List<DtPremio> lpre = Fabrica.getCrlUsuarios().getPremiosDelEspectador(contexto.getAttribute("nickname").toString());
                DtPremio auxiliar = null;
                List<DtPremio> lpreOrdenado = new ArrayList<DtPremio>();
//                int i = 0;
//                while (lpre.size() > 0) {
//                    lpreOrdenado.add(lpre.get(i));
//                    auxiliar = lpre.get(i);
//                    lpre.remove(i);
//                    for (int j = 0; j < lpre.size(); j++) {
//                        if (lpreOrdenado.get(i).getFechaSorteo() < lpre.get(j).getFechaSorteo()) {
//                            auxiliar = lpreOrdenado.get(i);
//                            lpreOrdenado.remove(i);
//                            lpreOrdenado.add(lpre.get(j));
//                            lpre.add(auxiliar);
//                        }
//                    }
//                }
                lpre.sort(new Comparator<DtPremio>() {

                    @Override
                    public int compare(DtPremio a, DtPremio b) {
                        if (a.getFechaSorteo()<= b.getFechaSorteo()) {
                            return 1;
                        } else {
                            return -1;
                        }
                    }

                });
//                lpre = lpreOrdenado;

                for (DtPremio p : lpre) {
                    out.print("<p>" + p.getNombre() + "</p>");
                    out.print("<p>" + p.getDescripcion() + "</p>");
                    out.print("<p>" + p.getNombreEspectaculo() + "</p>");
                    out.print("<p>" + p.getNombreFuncion() + "</p>");
                    out.print("<p>" + (new Date(p.getFechaSorteo())).toString() + "</p>");

                    out.print("<form action=\"ComprobatePDFBackEnd\">");
                    out.print("<button type=\"submit\">Generar PDF</button>");
                    out.print("<input type=\"checkbox\" name=\"nombrePremio\" value=\"" + p.getNombre() + " \"checked > ");
                    out.print("<input type=\"checkbox\" name=\"descripcion\" value=\""  + p.getDescripcion() + " \"checked > ");
                    out.print("<input type=\"checkbox\" name=\"nombreEspectaculo\" value=\""+ p.getNombreEspectaculo() + " \" checked> ");
                    out.print("<input type=\"checkbox\" name=\"NombreFuncion\" value=\"" + p.getNombreFuncion() + " \"checked > ");
                    out.print("<input type=\"checkbox\" name=\"fecha\" value=\""  + (new Date(p.getFechaSorteo())).toString() +  " \"checked > ");
                    
                    out.print("</form>");

                }


            %>
        </div >
        <script>
            const contextGson = <%=contextGson%>;
            if(contextGson!=""){
                alert(contextGson);
                window.open("/coronaticketsUyWebApp/"+contextGson);
            }
            </script>
    </body>

</html>

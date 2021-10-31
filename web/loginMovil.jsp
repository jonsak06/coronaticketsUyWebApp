<%-- 
    Document   : loginMovil
    Created on : Oct 21, 2021, 8:41:18 PM
    Author     : dexion
--%>

<%@page import="root.datatypes.DtRegistroAcceso"%>
<%@page import="root.interfaces.iRegistrosAcceso"%>
<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.fabrica.Fabrica"%>
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

        <%
            ServletContext contexto = getServletContext();
            Boolean loginCorrecto = (Boolean) contexto.getAttribute("loginCorrecto");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <style>
            body {
                background: #2d2d2d;
                color: white;
            }
            .container {
                margin-top: 50px;
                width: 80%;
            }
            .hide {
                display: none;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            button {
                width: 100%;
            }
            .btn {
                background-color: #444D55;
                border-color: #444D55;
            }
            .btn:hover,
            .btn:active,
            .btn:focus {
                background-color: #6c757d;
                border-color: #6c757d;
            }
            .form-check-input:checked {
                background-color: #444D55;
                border-color: #444D55;
            }
            .toast {
                width: 100%;
            }
        </style>

    </head>
    <body>
        <%@include file="headerMovil.jsp" %>

        <div class="toast align-items-center text-white bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    Datos erroneos, intente nuevamente.
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>

        <form action="pasajeaLoginMovil" method="post" class="container">

            <h1>Iniciar Sesion</h1>

            <div class="form-outline mb-4">
                <input name="nick" type="text" id="form1Example13" class="form-control form-control-lg">
                <label class="form-label" for="form1Example13" style="margin-left: 0px;">Nombre de usuario</label>
                <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 88.8px;"></div><div class="form-notch-trailing"></div></div></div>

            <div class="form-outline mb-4">
                <input name="pass" type="password" id="form1Example23" class="form-control form-control-lg">
                <label class="form-label" for="form1Example23" style="margin-left: 0px;">Contrasenia</label>
                <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 64.8px;"></div><div class="form-notch-trailing"></div></div></div>

            <div class="divider d-flex align-items-center my-4">
                <!-- Checkbox -->
                <div class="form-check">
                    <input name="recordarme" class="form-check-input" type="checkbox" value="" id="form1Example3" checked="" autocompleted="">
                    <label class="form-check-label" for="form1Example3"> Recordarme </label>
                </div>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>



        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>        
        <script>
            const botonHamburguesa = document.getElementById("hamburguesa");
            const linkToHome = document.getElementById("home");
            botonHamburguesa.classList.add("hide");

            const loginCorrecto = <%=loginCorrecto%>;
            const toastEl = document.querySelector(".toast");
            const toast = bootstrap.Toast.getOrCreateInstance(toastEl);
            if (!loginCorrecto) {
                toast.show();
            }
        </script>
    </body>
</html>




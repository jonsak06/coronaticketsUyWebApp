<%-- 
    Document   : header
    Created on : Oct 3, 2021, 3:10:06 PM
    Author     : dexion
--%>

<%
    String tipoUsuario = new String();
    try {
        ServletContext contexto = getServletContext();
        tipoUsuario = contexto.getAttribute("tipoUsuario").toString();
    } catch(Exception e) {
        tipoUsuario = "Visitante";
    }
%>

<header class="p-3 bg-dark text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="index.jsp" class="nav-link px-2 text-white">Inicio</a></li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Usuarios
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" id="modificarUsuario" href="modificarUsuario.jsp">Modificar perfil</a></li>
                    <li><hr class="dropdown-divider" id="separador"></li>
                    <li><a class="dropdown-item" id="consultarUsuario" href="ConsultarUsuario.jsp">Consulta de usuario</a></li>
                    <li><a class="dropdown-item" id="seguirUsuario" href="seguirUsuario.jsp">Seguir usuario</a></li>
                    <li><a class="dropdown-item" id="dejarSeguirUsuario" href="dejarDeSeguirUsuario.jsp">Dejar de seguir usuario</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Espectaculos
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" id="altaEspectaculo" href="altaEspectaculo.jsp">Alta de espectaculo</a></li>
                    <li><a class="dropdown-item" id="consultaEspectaculo" href="#">Consulta de espectaculo</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" id="altaFuncion" href="AltaFuncion.jsp">Alta de funcion</a></li>
                    <li><a class="dropdown-item" id="consultaFuncion" href="ConsultarFuncion.jsp">Consulta de funcion</a></li>
                    <li><a class="dropdown-item" id="registroAFuncion" href="registroEspectadorFuncion.jsp">Registro a funcion</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Paquetes
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" id="crearPaquete" href="creacionPaquetes.jsp">Crear paquete</a></li>
                    <li><a class="dropdown-item" id="agregarEspAPaq" href="agregadoEspAPaq.jsp">Agregar espectaculo a paquete</a></li>
                    <li><a class="dropdown-item" id="consultaPaquete" href="consultaPaquetes.jsp">Consulta de paquete</a></li>
                    <li><a class="dropdown-item" id="compraPaquete" href="compraPaquetes.jsp">Compra de paquete</a></li>
                </ul>
            </li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>

        <div class="text-end">
            <button type="button" id="login" onclick="window.location.href = 'login.jsp'" class="btn btn-outline-light me-2">Login</button>
            <button type="button" id="logout" onclick="window.location.href = 'cerrarSesion.jsp'" class="btn btn-outline-light me-2">Logout</button>
            <button type="button" id="altaUsuario" onclick="window.location.href = 'altaUsuario.jsp'" class="btn btn-warning">Sign-up</button>
        </div>
      </div>
    </div>
</header>
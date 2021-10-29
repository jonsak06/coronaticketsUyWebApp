<%-- 
    Document   : headerMovil
    Created on : Oct 21, 2021, 8:39:22 PM
    Author     : dexion
--%>

<header class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" id="home" href="indexMovil.jsp">CoronaTicketsUy</a>
      <button class="navbar-toggler" type="button" id="hamburguesa" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="consultarEspectaculo.jsp">Consultar espectaculos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ConsultarFuncion.jsp">Consultar funciones</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalLogout">Cerrar sesion</a> 
          </li>
        </ul>
      </div>
    </div>
</header>

<div class="modal fade" id="modalLogout" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cerrar sesion</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Desea cerrar sesion?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <form action="CerrarSesion" method="post">
            <button type="submit" class="btn btn-primary">Confirmar</button>
        </form>
      </div>
    </div>
  </div>
</div>

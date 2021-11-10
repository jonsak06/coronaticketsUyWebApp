<%-- 
    Document   : headerScript.jsp
    Created on : Oct 8, 2021, 4:48:01 PM
    Author     : dexion
--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script>
    const tipoUsuario = "<%=tipoUsuario%>";
    
    const modificarUsuario = document.getElementById("modificarUsuario");
    const consultarUsuario = document.getElementById("consultarUsuario");
    const seguirUsuario = document.getElementById("seguirUsuario");
    const dejarSeguirUsuario = document.getElementById("dejarSeguirUsuario");
    const altaEspectaculo = document.getElementById("altaEspectaculo");
    const consultaEspectaculo = document.getElementById("consultaEspectaculo");
    const altaFuncion = document.getElementById("altaFuncion");
    const consultaFuncion = document.getElementById("consultaFuncion");
    const registroAFuncion = document.getElementById("registroAFuncion");
    const crearPaquete = document.getElementById("crearPaquete");
    const agregarEspAPaq = document.getElementById("agregarEspAPaq");
    const consultaPaquete = document.getElementById("consultaPaquete");
    const compraPaquete = document.getElementById("compraPaquete");
    
    const Sorteos = document.getElementById("Sorteos");
    const addEspectaculoFaborito = document.getElementById("addEspectaculoFaborito");
    const verPremiosEspecrador = document.getElementById("verPremiosEspecrador");
    const valorarEspectaculo = document.getElementById("valorarEspectaculo");
    
    const altaUsuario = document.getElementById("altaUsuario");//boton
    const login = document.getElementById("login");//boton
    const logout = document.getElementById("logout");//boton
    const separador = document.getElementById("separador");//linea separadora en opciones de usuarios
    
    if(tipoUsuario === "Artista") {
        altaUsuario.classList.add("hide");
        registroAFuncion.classList.add("hide");
        compraPaquete.classList.add("hide");
        login.classList.add("hide");
        addEspectaculoFaborito.classList.add("hide");
        verPremiosEspecrador.classList.add("hide");
        valorarEspectaculo.classList.add("hide");
    } else if(tipoUsuario === "Espectador") {
        altaUsuario.classList.add("hide");
        altaEspectaculo.classList.add("hide");
        altaFuncion.classList.add("hide");
        crearPaquete.classList.add("hide");
        agregarEspAPaq.classList.add("hide");
        Sorteos.classList.add("hide");
        login.classList.add("hide");
    } else if(tipoUsuario === "Visitante") {
        Sorteos.classList.add("hide");
        modificarUsuario.classList.add("hide");
        altaEspectaculo.classList.add("hide");
        altaFuncion.classList.add("hide");
        registroAFuncion.classList.add("hide");
        crearPaquete.classList.add("hide");
        agregarEspAPaq.classList.add("hide");
        compraPaquete.classList.add("hide");
        seguirUsuario.classList.add("hide");
        dejarSeguirUsuario.classList.add("hide");
        logout.classList.add("hide");
        addEspectaculoFaborito.classList.add("hide");
        verPremiosEspecrador.classList.add("hide");
        valorarEspectaculo.classList.add("hide");
        separador.classList.add("hide");
    }
    
</script>



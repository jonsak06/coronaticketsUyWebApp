<%-- 
    Document   : test
    Created on : Sep 16, 2021, 10:43:40 PM
    Author     : julio
--%>

<%@page import="java.util.List"%>
<%@page import="root.entidades.Espectador"%>
<%@page import="javax.persistence.*"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% // // //
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("PERSISTENCIA");
            EntityManager em = emf.createEntityManager();
            TypedQuery<Espectador> consulta = em.createNamedQuery("Espectador.findAll",Espectador.class);
            List<Espectador> lista = consulta.getResultList();
            em.close();
            emf.close();
            %>
        <h1>Listado de Espectadores</h1>
        <% for(Espectador i: lista){
                out.print("<p>"+i.getNombre()+" "+i.getApellido()+"</p>");
            }
        %>
    </body>
</html>

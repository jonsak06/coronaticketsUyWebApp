<%-- 
    Document   : test
    Created on : Sep 16, 2021, 10:43:40 PM
    Author     : julio
--%>

<%@page import="root.fabrica.Fabrica"%>
<%@page import="root.interfaces.iUsuarios"%>
<%@page import="javax.servlet.ServletContext"%>
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
        <title>CoronaTicketsUy</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="headerStyles.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        
        <%@include file="headerScript.jsp"%>
    </body>
</html>

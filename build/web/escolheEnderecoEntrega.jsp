<%-- 
    Document   : loga
    Created on : 16/05/2019, 20:48:37
    Author     : Administrador
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="br.com.MyChoppNow.Item"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=WINDOWS-1252">
    <link rel="icon" href="_img/favicon.jpg">
    <title>JSP Page</title>
</head>

<body>

    <c:set var="endereco" value="${param.id}" scope="session"/>

<script>
    alert("Endereço de entrega selecionado! ");
    window.location = "listaCarrinho.jsp";
</script>   

</body>


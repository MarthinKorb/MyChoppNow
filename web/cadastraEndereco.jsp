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

<sql:query var="ResultadoUsuario" dataSource="${ds}">
    select id_user from usuarios where login=?
    <sql:param value="${param.usuario}" />
</sql:query>

<c:forEach items="${resultado.rows}" var="login">
    <c:set var="id_user" value="${login.id_user}" scope="session"/>
</c:forEach>  


<!-- Registra o usuario -->
<sql:update dataSource="${ds}" var="registrar"> 
    <sql:param value="${param.descricao}"/>
    <sql:param value="${param.logradouro}"/>
    <sql:param value="${param.numero}"/>
    <sql:param value="${param.complemento}"/>
    <sql:param value="${param.cidade}"/>
    <sql:param value="${param.estado}"/>
    <sql:param value="${param.cep}"/>
    <sql:param value="${param.pais}"/>
    <sql:param value="${id_user}" />
    insert into endereco(descricao, logradouto, numero, complemento, cidade, estado, cep, pais, id_user) values(?,?,?,?,?,?,?,?,?)
</sql:update>

<script>
    alert("Endereço de entrega cadastrado com sucesso! ");
    window.location = "meusEnderecos.jsp";
</script>   




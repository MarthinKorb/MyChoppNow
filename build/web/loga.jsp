<%-- 
    Document   : loga
    Created on : 16/05/2014, 20:48:37
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=WINDOWS-1252">
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <link rel="icon" href="_img/favicon.jpg">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Pesquisa o usuario -->
        <sql:query dataSource="${ds}" var="resultado">
            select * from usuarios where login=? and senha=?
            <sql:param value="${param.login}"/>
            <sql:param value="${param.senha}"/>
        </sql:query>

        <!-- Percorre o resultset e grava o nome do usuario na sessão -->    
        <c:forEach items="${resultado.rows}" var="login">
            <c:set var="usuario" value="${login.nome}" scope="session"/>
            <c:set var="id_user" value="${login.id_user}" scope="session"/>
            <c:set var="tipo" value="${login.tipo}" scope="session"/>
        </c:forEach>   

        <c:choose>    
            <c:when test="${empty tipo}">
                <script>
                    alert("Usuário e/ou senha inválidos");
                    window.location = "index.jsp";
                </script>
            </c:when>
            <c:when test="${tipo=='A'}">
                <script>
                    window.location = "home.jsp";
                </script>
            </c:when>
            <c:otherwise>
                <script>
                    window.location = "listaItens.jsp";
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>

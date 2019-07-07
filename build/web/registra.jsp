<%-- 
    Document   : loga
    Created on : 16/05/2019, 20:48:37
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

        <c:set var="usuario" value="" />
        <!-- Pesquisa o usuario -->
        <sql:query dataSource="${ds}" var="resultado">
            select * from usuarios where login=? and senha=?
            <sql:param value="${param.login}"/>
            <sql:param value="${param.senha}"/>
        </sql:query>  

        <!-- Percorre o resultset e grava o nome do usuario na sessão -->    
        <c:forEach items="${resultado.rows}" var="login">
            <c:set var="usuario" value="${login.nome}" />
        </c:forEach>   

        <c:choose>    
            <c:when test="${empty usuario}">

                <!-- Registra o usuario -->
                <sql:update dataSource="${ds}" var="registrar">  
                    <sql:param value="${param.login}"/>
                    <sql:param value="${param.senha}"/>
                    insert into usuarios(login, senha, nome, tipo) values(?,?,'${param.login}','U')
                    <c:set var="usuario" value="${param.login}" />
                </sql:update>

                <script>
                    alert("Cadastro efetuado com sucesso! ");
                    window.location = "index.jsp";
                </script>   
                <c:set var="usuario" value="${param.login}" />
            </c:when>

            <c:otherwise>
                <script>
                    alert("Usuário já cadastrado!");
                    window.location = "index.jsp";
                </script>
            </c:otherwise>
        </c:choose>


    </body>
</html>

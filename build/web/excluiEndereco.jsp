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


        <%--  <!-- Pesquisa o endereço -->
          <sql:query dataSource="${ds}" var="resultado">
              select * from endereco where logradouro=? and numero=? and complemento=? and cidade=? and estado=? and cep=? and pais=?
              <sql:param value="${param.descricao}"/>
              <sql:param value="${param.logradouro}"/>
              <sql:param value="${param.numero}"/>
              <sql:param value="${param.complemento}"/>
              <sql:param value="${param.cidade}"/>
              <sql:param value="${param.estado}"/>
              <sql:param value="${param.cep}"/>
              <sql:param value="${param.pais}"/>
          </sql:query>  

        <!-- Percorre o resultset e grava o nome do usuario na sessão -->    
         <c:forEach items="${resultado.rows}" var="v">
            <c:set var="usuario" value="${v.nome}" />
        </c:forEach>  --%> 

        <!-- Registra o usuario -->
        <sql:update dataSource="${ds}" var="excluir">              
            delete from endereco where id_endereco=?
            <sql:param value="${param.id}"/>
        </sql:update>       

        <script>
            alert("Endereço de entrega excluído com sucesso! ");
            window.location = "meusEnderecos.jsp";
        </script>   

    </body>
</html>

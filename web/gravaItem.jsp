<%-- 
    Document   : gravaItem
    Created on : 16/05/2014, 22:02:02
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Gravação Item</title>
    </head>
    <body>
        <sql:update dataSource="${ds}">
            insert into produtos (descricao,detalhes,preco,estoque) values (?,?,?,?)
            <sql:param value="${param.descricao}" />
            <sql:param value="${param.detalhes}" />
            <sql:param value= "<%=Double.parseDouble(request.getParameter("preco").replace(",", "."))%>" />
            <sql:param value="${param.estoque}" />
        </sql:update> 
        <script>
            alert("${param.descricao} Gravado com sucesso!!!");
            window.location ="manutencaoItens.jsp";
        </script>        
</body>
</html>

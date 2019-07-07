<%-- 
    Document   : altera
    Created on : 21/05/2018, 10:26:46
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:choose>
    <c:when test="${tipo =='A'}">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                <title>Gravação Item</title>
                <link rel="icon" href="_img/favicon.jpg">
            </head>
            <body>
                <sql:update dataSource="${ds}">
                    update produtos set descricao=?, detalhes=?, preco=?, estoque=? where codigo=?
                    <sql:param value="${param.descricao}" />
                    <sql:param value="${param.detalhes}" />
                    <sql:param value="<%=Double.parseDouble(request.getParameter("preco").replace(",", "."))%>" />
                    <sql:param value="${param.estoque}" />
                    <sql:param value="${param.id}" />
                </sql:update> 
                <script>
                    alert("${param.descricao} Gravado com Sucesso !!!");
                    window.location = "manutencaoItens.jsp";
                </script>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>

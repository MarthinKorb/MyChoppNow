<%-- 
    Document   : excluiItem
    Created on : 18/05/2018, 11:38:53
    Author     : marci
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<c:choose>
    <c:when test="${tipo =='A'}">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Exclusão de Aluno</title>
            </head>
            <body>
                <sql:update dataSource="${ds}">
                    delete from produtos where codigo=?
                    <sql:param value="${param.id}" />
                </sql:update>
                <c:redirect url="manutencaoItens.jsp"/>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>
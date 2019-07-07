<%-- 
    Document   : alteraQtde
    Created on : 20/05/2014, 21:35:50
    Author     : ADMINISTRADOR
--%>

<%@page contentType="text/html" pageEncoding="WINDOWS-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="br.com.MyChoppNow.Item"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=WINDOWS-1252">
        <title>JSP Page</title>
        <link rel="icon" href="_img/favicon.jpg">
    </head>
    <body>
        <%-- Consulta Estoque do Item --%>
    <sql:query var="Resultado" dataSource="${ds}">
        select estoque from produtos where codigo = ?
        <sql:param value="${param.id}"/>
    </sql:query>
    <c:forEach items="${Resultado.rows}" var="stq">
        <c:set var="estoque" value="${stq.estoque}"/>
    </c:forEach>
    <c:choose>
        <%-- Verifica a disponibilidade de estoque antes de colocar no carrinho --%> 
        <c:when test="${estoque>=param.qtde}">

            <%
                int id = Integer.parseInt(request.getParameter("id"));
                int qtde = Integer.parseInt(request.getParameter("qtde"));

                for (Item a : Item.carrinho) {
                    if (a.getId() == id) {
                        a.setQtd(qtde);
                    }
                }
                response.sendRedirect("listaCarrinho.jsp");

            %>
            </body>
            </html>
        </c:when>
        <c:otherwise>
            <script>
                alert("Quantidade Insufiente! Cheque estoque disponível!");
                window.location = "listaCarrinho.jsp";
            </script>
        </c:otherwise>
    </c:choose>
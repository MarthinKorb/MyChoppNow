<%-- 
    Document   : adicionaCarrinho
    Created on : 20/05/2014, 15:56:38
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
        <c:set var="qtd" value="0"/>
        <%-- Consulta Estoque do Item --%>
        <sql:query var="Resultado" dataSource="${ds}">
            select estoque from produtos where codigo = ?
            <sql:param value="${param.id}"/>
        </sql:query>
        <c:forEach items="${Resultado.rows}" var="stq">
            <c:set var="estoque" value="${stq.estoque}"/>
        </c:forEach>
        <%-- Consulta Quantidade no Carrinho --%>    
        <c:forEach items="<%=Item.carrinho%>" var="car">
            <c:if test="${car.id==param.id}">
                <c:set var="qtd" value="${car.qtd}"/>
            </c:if>
        </c:forEach>
        <c:choose>
            <%-- Verifica a disponibilidade de estoque antes de colocar no carrinho --%> 
            <c:when test="${estoque>qtd}">

                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    String descricao = request.getParameter("descricao");
                    String detalhes = request.getParameter("detalhes");
                    double preco = Double.parseDouble(request.getParameter("preco"));
                    boolean inclui = true;

                    for (Item a : Item.carrinho) {
                        if (a.getId() == id) {
                            a.setQtd(a.getQtd() + 1);
                            inclui = false;
                        }
                    }
                    if (inclui) {
                        Item a = new Item();
                        a.setId(id);
                        a.setDescricao(descricao);
                        a.setDetalhes(detalhes);
                        a.setPreco(preco);
                        a.setQtd(1);
                        Item.carrinho.add(a);
                    }
                    response.sendRedirect("listaCarrinho.jsp");
                %>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <script>
            alert("Quantidade Insufiente! Cheque estoque disponível!");
            window.location = "listaItens.jsp";
        </script>
    </c:otherwise>
</c:choose>
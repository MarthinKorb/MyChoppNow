<%-- 
    Document   : detalhes
    Created on : 21/06/2018, 20:13:30
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:choose>
    <c:when test="${tipo =='A' || tipo=='U'}">
        <html>
            <head>
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                <link href="_css/bootstrap.min.css" rel="stylesheet">
                <link rel="icon" href="_img/favicon.jpg">
                <title>Consulta de Pedidos</title>
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalho.jsp"/>
                    <sql:query var="ResultadoPedidos" dataSource="${ds}">
                        select * from pedidos ped, usuarios usu where ped.ID_USER = usu.ID_USER and ped.id_ped=?
                        <sql:param value="${param.id_ped}"/>
                    </sql:query>
                    <c:forEach var="listaPedidos" items="${ResultadoPedidos.rows}">
                        <center><h1> Consulta de Pedido Nº <c:out value="${listaPedidos.num_ped}"/> </h1></center>   
                        <h3>Cliente: <c:out value="${listaPedidos.nome}"/></h3>
                        <h3>Data Pedido: <fmt:formatDate value="${listaPedidos.dt_ped}" type="date"/></h3>

                        <sql:query var="ResultadoPedItens" dataSource="${ds}">
                            select * from pedidos ped, usuarios usu, produtos prod,itens_pedido itped where ped.ID_USER = usu.ID_USER and itped.ID_PED = ped.ID_PED and prod.CODIGO = itped.ID_PROD and ped.id_ped=?
                            <sql:param value="${param.id_ped}"/>
                        </sql:query>
                        <hr>
                        <center><h2> Lista de Itens do Pedido </h2></center>
                        <table class="table table-responsive table-hover">
                            <tr>
                                <th>Código</th>
                                <th>Descrição</th>
                                <th>Quantidade</th>
                                <th>Valor Unitário</th>
                                <th>Valor Total</th>
                            </tr> 
                            <c:forEach var="listaPedItens" items="${ResultadoPedItens.rows}">
                                <tr>
                                    <td class="col-md-1 text-danger"><c:out value="${listaPedItens.codigo}"/></td>
                                    <td class="col-md-1 text-danger"><c:out value="${listaPedItens.descricao}"/></td>
                                    <td class="col-md-1 text-danger"><fmt:formatNumber value="${listaPedItens.qtde}"  type="number"/></td>
                                    <td class="col-md-1 text-danger"><fmt:formatNumber value="${listaPedItens.vlr_unit}" minFractionDigits="2"  type="currency"/></td>
                                    <td class="col-md-1 text-danger"><fmt:formatNumber value="${listaPedItens.vlr_tot}" minFractionDigits="2"  type="currency"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <hr>
                        <center><h3>Total Pedido: <fmt:formatNumber value="${listaPedidos.tot_ped}" minFractionDigits="2"  type="currency"/></h3></center>
                        </c:forEach>
                    <hr>
                    <center><h2><a class = "btn btn-default btn-lg" href="consultaPedidos.jsp"><span class="glyphicon glyphicon-triangle-left"></span> Voltar</a></h2></center>
                                <c:import url="rodape.jsp"/>
                </div>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>
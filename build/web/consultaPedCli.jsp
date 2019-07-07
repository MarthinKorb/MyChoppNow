<%-- 
    Document   : consultaPedCli
    Created on : 21/06/2018, 19:46:35
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:choose>
    <c:when test="${tipo =='U'}">
        <html>
            <head>
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                <link href="_css/bootstrap.min.css" rel="stylesheet">
                <link rel="icon" href="_img/favicon.jpg">
                <style>
                    body{
                        text-shadow: 1px 1px 1px black;
                    }
                    td{
                        font-size: 19px;
                        text-shadow: 1px 1px 0px rgba(0,0,0,.8);
                        background-color: rgba(0,0,0,.06);
                    }
                </style>
                <title>Consulta de Pedidos</title>
            </head>
            <body>
                <div class="container">

                    <c:import url="cabecalhoCliente.jsp"/>
                    <center><h1> Consulta de Pedidos </h1></center>   
                    <hr>
                    <center><h2> Lista de Pedidos </h2></center>


                    <sql:query var="ResultadoPedidos" dataSource="${ds}">
                        select * from pedidos ped, usuarios usu where ped.ID_USER = usu.ID_USER and ped.ID_USER=?
                        <sql:param value="${id_user}"/>
                    </sql:query>
                    <table class="table table-responsive table-hover table-bordered">
                        <tr>
                            <th>Data</th>
                            <th>Pedido</th>
                            <th>Nome</th>
                            <th>Valor</th>
                            <th> </th>
                        </tr> 
                        <c:forEach var="listaPedidos" items="${ResultadoPedidos.rows}">
                            <tr>
                                <!--A tag out é responsável por gerar uma String de saída na tela -->
                                <td class="col-md-3 text-primary"><fmt:formatDate value="${listaPedidos.dt_ped}" type="date"/></td>
                                <td class="col-md-3 text-primary"><c:out value="${listaPedidos.num_ped}"/></td>
                                <td class="col-md-3 text-primary"><c:out value="${listaPedidos.nome}"/></td>
                                <td class="col-md-3 text-primary"><fmt:formatNumber value="${listaPedidos.tot_ped}" minFractionDigits="2"  type="currency"/></td>
                                <c:set var="totgeral" value="${totgeral+listaPedidos.tot_ped}"/>
                                <td> <a class = "btn btn-warning" href="detalhes2.jsp?id_ped=${listaPedidos.id_ped}"><span class="glyphicon glyphicon-eye-open"></span>  Detalhes</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>
                    <hr>
                    <center><h3>Total dos Pedidos <fmt:formatNumber value="${totgeral}" minFractionDigits="2"  type="currency"/></h3></center>
                    <center><a class = "btn btn-primary btn-lg" href="listaItens.jsp"><span class="glyphicon glyphicon-triangle-left"></span> Voltar</a></center>
                        <c:import url="rodape.jsp"/>
                </div>
            </body>

        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>

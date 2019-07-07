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
                <style>
                    body{
                        text-shadow: 1px 1px 1px black;
                    }
                    td{
                        font-size: 19px;
                        text-shadow: 1px 1px 0px rgba(0,0,0,.8);
                        background-color: rgba(0,0,0,.06);
                    }
                    tr{
                        font-size: 19px;
                    }
                    th{
                        text-shadow:0px 1px 0px black;
                    }
                </style>
                <title>Consulta de Pedidos</title>
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalhoCliente.jsp"/>
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
                                    <td class="col-md-2 text-danger"><c:out value="${listaPedItens.codigo}"/></td>
                                    <td class="col-md-2 text-danger"><c:out value="${listaPedItens.descricao}"/></td>
                                    <td class="col-md-2 text-danger"><fmt:formatNumber value="${listaPedItens.qtde}"  type="number"/></td>
                                    <td class="col-md-2 text-danger"><fmt:formatNumber value="${listaPedItens.vlr_unit}" minFractionDigits="2"  type="currency"/></td>
                                    <td class="col-md-2 text-danger"><fmt:formatNumber value="${listaPedItens.vlr_tot}" minFractionDigits="2"  type="currency"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <hr>
                        <center><h2>Total Pedido: <fmt:formatNumber value="${listaPedidos.tot_ped}" minFractionDigits="2"  type="currency"/></h2></center>
                        </c:forEach>
                    <br><br>

                    <hr>


                    <div class="container">
                        <center><h2 class="text-primary"> Endereço de Entrega </h2></center>
                        <hr>
                        <sql:query var="ResultadoItens" dataSource="${ds}">
                            select * from endereco , pedidos where endereco.ID_ENDERECO = PEDIDOS.ID_ENDERECO and PEDIDOS.id_ped=?
                            <sql:param value="${param.id_ped}" />
                        </sql:query>
                        <table class="table table-hover table-bordered table-striped">
                            <tr class="success">

                                <th>Descrição</th> 
                                <th style="padding-left: 250px;">Logradouro</th>
                                <th>Número</th>
                                <th>Complemento</th>
                                <th>Cidade</th>
                            </tr> 
                            <c:forEach var="listaItens" items="${ResultadoItens.rows}">
                                <tr>
                                    <!--A tag out é responsável por gerar uma String de saída na tela -->

                                    <td class="col-md-1 text-primary"><c:out value="${listaItens.descricao}"/></td>
                                    <td class="col-md-4 text-success"><c:out value="${listaItens.logradouto}"/></td>
                                    <td class="col-md-1 text-danger"><c:out value="${listaItens.numero}"/></td>
                                    <td class="col-md-1"><c:out value="${listaItens.complemento}"/></td>
                                    <td class="col-md-1"><c:out value="${listaItens.cidade}"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>



                    <hr>
                    <center><h2><a class = "btn btn-primary btn-lg" href="consultaPedCli.jsp"><span class="glyphicon glyphicon-triangle-left"></span> Voltar</a></h2></center>
                                <c:import url="rodape.jsp"/>
                </div>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>
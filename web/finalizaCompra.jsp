<%-- 
    Document   : finalizaCompra
    Created on : 20/05/2014, 22:11:34
    Author     : ADMINISTRADOR
--%>

<%@page contentType="text/html" pageEncoding="WINDOWS-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="br.com.MyChoppNow.Item"%>
<jsp:useBean id="data" class="java.util.Date" />
<!DOCTYPE html>
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


        <title>Finaliza Compra</title>
    </head>
    <body>
        <div class="container">
            <c:import url="cabecalhoCliente.jsp"/>
            <br><br><br><br><br>
            <%-- verificar se todos itens do carrinho ainda tem estoque --%>
            <c:forEach items="<%=Item.carrinho%>" var="car">
                <sql:query var="Resultado" dataSource="${ds}">
                    select estoque from produtos where codigo = ?
                    <sql:param value="${car.id}"/>
                </sql:query>
                <c:forEach items="${Resultado.rows}" var="stq">
                    <c:set var="estoque" value="${stq.estoque}"/>
                </c:forEach>
                <c:if test="${car.qtd>estoque}">
                    <script>
                        alert("${car.descricao} não tem estoque suficiente!!!");
                        window.location = "listaCarrinho.jsp";
                    </script>
                </c:if>
            </c:forEach>
            <%-- Inclui Pedido e descobre o seu numero --%>
            <c:set var="numped" value="0"/>
            <sql:update dataSource="${ds}">
                insert into pedidos (id_user,dt_ped,tot_ped,id_endereco) values (?,?,?,?)
                <sql:param value="${id_user}" />
                <sql:param value="${data}" />
                <sql:param value="${param.total}" />
                <sql:param value="${endereco}"/>
            </sql:update> 
            <%-- descobre o ultimo número --%>
            <sql:query var="Resultado" dataSource="${ds}">
                select max(num_ped) num from pedidos 
            </sql:query>
            <c:forEach items="${Resultado.rows}" var="ped">
                <c:set var="numped" value="${ped.num}"/>
            </c:forEach>
            <c:set var="numped" value="${numped+1}"/>    
            <%-- coloca o numero no pedido --%>            
            <sql:update dataSource="${ds}">
                update pedidos set num_ped=?  where id_user=? and dt_ped=? and tot_ped=? 
                <sql:param value="${numped}" />
                <sql:param value="${id_user}" />
                <sql:param value="${data}" />
                <sql:param value="${param.total}" />
            </sql:update> 
            <sql:query var="Resultado" dataSource="${ds}">
                select id_ped from pedidos  where num_ped=?
                <sql:param value="${numped}" />
            </sql:query>
            <c:forEach items="${Resultado.rows}" var="ped">
                <c:set var="id_ped" value="${ped.id_ped}"/>
            </c:forEach>

            <%-- adiciona os itens do pedido --%>
            <c:forEach items="<%=Item.carrinho%>" var="car">
                <sql:update dataSource="${ds}">
                    insert into itens_pedido (id_ped,id_prod,qtde,vlr_unit,vlr_tot) values (?,?,?,?,?)
                    <sql:param value="${id_ped}" />
                    <sql:param value="${car.id}" />
                    <sql:param value="${car.qtd}" />
                    <sql:param value="${car.preco}" />
                    <sql:param value="${car.preco*car.qtd}" />
                </sql:update> 

                <%--- atualiza o estoque ---%>
                <sql:query var="Resultado" dataSource="${ds}">
                    select estoque from produtos where codigo = ?
                    <sql:param value="${car.id}"/>
                </sql:query>
                <c:forEach items="${Resultado.rows}" var="stq">
                    <c:set var="estoqueatual" value="${stq.estoque - car.qtd}"/>
                </c:forEach>

                <sql:update dataSource="${ds}">
                    update  produtos set estoque=? where codigo=?
                    <sql:param value="${estoqueatual}"/>
                    <sql:param value="${car.id}" />
                </sql:update> 


            </c:forEach>

                    <h1 align="center"><b>Obrigado por comprar em nossa Loja !</b><br><br><br><br><br>
                O seu Pedido ${numped} no valor de  
                <fmt:formatNumber value="${param.total}" minFractionDigits="2" type="currency"/> foi processado com sucesso! 
            </h1>
            <% Item.carrinho.removeAll(Item.carrinho);%>
            <c:set var="total" value="0" scope="session"/>
            <hr> <br>

            <div class="container">
                <center><h2 class="text-primary"> Endereço de Entrega </h2></center>
                <hr>
                <sql:query var="ResultadoItens" dataSource="${ds}">
                    select * from endereco , pedidos where endereco.ID_ENDERECO = PEDIDOS.ID_ENDERECO and PEDIDOS.ID_ENDERECO=?
                    <sql:param value="${endereco}" />
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
            <br><br>


            <p class="text-center"><a  class="btn btn-lg btn-primary" href="listaItens.jsp"><span class="glyphicon glyphicon-triangle-left"></span>  Voltar</a></p>
            <br><br>


            <c:import url="rodape.jsp"/>
        </div>
    </body>
</html>

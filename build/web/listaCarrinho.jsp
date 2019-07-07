<%-- 
    Document   : listaCarrinho
    Created on : 20/05/2014, 16:23:58
    Author     : ADMINISTRADOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="br.com.MyChoppNow.Item"%>
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
                <title>Carrinho de Compras</title>
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
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalhoCliente.jsp"/>
                    <br>

                    <%
                        if (Item.carrinho.isEmpty()) {
                            out.println("<br><h1 align='center' style='color: black; text-shadow: 1px 1px 0px goldenrod;'> O Carrinho está vazio!</h1>");
                            out.println("<center><img class='img-responsive img-circle' src= '_img/carinhaTriste.jpg' vspace='0' align='center'><center>");
                            out.println("<br><br><div align='center'><a class='btn btn-lg btn-warning' href='listaItens.jsp'>"
                                    + "<span class='glyphicon glyphicon-shopping-cart'></span> Continuar Comprando</a></div><br><br>");
                        } else {
                            out.println("<h1 align='center'>Carrinho de Compras</h1><hr>");

                    %>
                    <table class="table table-hover table-responsive table-bordered">
                        <tr>
                            <!-- <th>Codigo</th> -->
                            <th>Descrição</th>
                            <th style="padding-left: 200px;">Detalhes</th>
                            <th>Quantidade em Litros</th>
                            <th>Preço Unitário</th>
                            <th>Total</th>
                            <th> </th>
                            <th> </th>
                        </tr> 

                        <c:forEach items="<%=Item.carrinho%>" var="i"> 
                            <form method="get" action="alteraQtde.jsp" name="altqtd">
                                <input name="id" type="hidden" value="${i.id}"></input>
                                <tr>
                                    <%--<td><c:out value="${i.id}"/></td> --%>
                                    <td class="col-md-1 text-danger"><c:out value="${i.descricao}"/></td>
                                    <td class="col-md-6 text-danger"><c:out value="${i.detalhes}"/></td>
                                    <td class="col-md-2 text-danger"><input name="qtde" id="qtde" value="${i.qtd}" size="5"></input></td>
                                    <td class="col-md-2 text-danger"><fmt:formatNumber value="${i.preco}" minFractionDigits="2" type="currency"/></td>
                                    <td class="col-md-1 text-danger"><fmt:formatNumber value="${i.qtd*i.preco}" minFractionDigits="2" type="currency"/></td>
                                    <c:set var="total" value="${total+i.qtd*i.preco}"/>
                                    <td align="right"> <a class="btn btn-danger" href="confirmaExclusaoCarrinho.jsp?id=${i.id}"> <span class="glyphicon glyphicon-trash"></span> Excluir</a> </td>
                                    <td align="right"><button class="btn btn-success" onclick="altqtd.submit()"><span class="glyphicon glyphicon-edit"></span> Recalcular</button></td>
                                </tr> 
                            </form>

                        </c:forEach>

                    </table>
                    <hr>
                    <center><h3>Total da Compra: <fmt:formatNumber value="${total}" minFractionDigits="2" type="currency"/></h3>

                        <br>               

                        <br><br><a class="btn btn-success" href="meusEnderecos.jsp"><span class="glyphicon glyphicon-backward"></span> Opção de Entrega</a>

                        <a class="btn btn-primary" href="listaItens.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Continuar Comprando</a>

                        <br><br><a class="btn btn-lg btn-warning" href="finalizaCompra.jsp?total=${total}"><span class="glyphicon glyphicon-check"></span> Finalizar Compra</a></center>
                        <%
                            }
                        %>

                    <c:import url="rodape.jsp"/>
                </div>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>
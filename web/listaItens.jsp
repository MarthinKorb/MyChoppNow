<%-- 
    Document   : listaItens
    Created on : 16/05/2014, 22:19:04
    Author     : Administrador
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
                    #icons{
                        background-color: rgba(218,165,32,.09);
                        margin-top: 50px;
                        border-radius: 10px 30px;
                        border: goldenrod 1px solid;
                        padding: 40px;
                        padding-bottom: 50px;
                        box-shadow: 0px 0px 50px rgba(0,0,0,.2);
                    }
                    #icons a{
                        color: goldenrod;
                        font-size: 22px;
                    }                   
                   
                    
                    #icons a:hover{
                        text-decoration: underline;                        
                        font-size: 23px;
                        transition: font-size .3s, text-shadow .2s;
                        text-shadow: 1px 1px 1px black;
                    }
                    
                    td{
                        font-size: 19px;
                        text-shadow: 1px 1px 0px rgba(0,0,0,.8);
                        background-color: rgba(0,0,0,.06);
                    }
                   
                    
                </style>
                
                <title>Lista de Itens</title>
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalhoCliente.jsp"/>
                    <center><h1> Adicionar Cerveja ao Carrinho </h1></center>   
                    <hr>
                    <center><h2> Lista de Produtos </h2></center>
                        <sql:query var="ResultadoItens" dataSource="${ds}">
                        select * from produtos
                    </sql:query>
                    <table class="table table-hover table-bordered table-striped">
                        <tr class="success">
                            <!-- <th>Codigo</th> -->
                            <th>Descrição</th>
                            <th style="padding-left: 270px;">Detalhes</th>
                            <th>Preço</th>
                            <th>Estoque</th>
                            <th></th>

                        </tr> 
                        <c:forEach var="listaItens" items="${ResultadoItens.rows}">
                            <tr>
                                <!--A tag out é responsável por gerar uma String de saída na tela -->
                                <%-- <td class="text-danger"><c:out value="${listaItens.codigo}"/></td> --%>
                                <td class="col-md-1 text-primary"><c:out value="${listaItens.descricao}"/></td>
                                <td class="col-md-6 text-success"><c:out value="${listaItens.detalhes}"/></td>
                                <td class="col-md-1 text-danger"><fmt:formatNumber value="${listaItens.preco}"
                                                  minFractionDigits="2" type="currency"/></td>
                                <td class="col-md-1"><c:out value="${listaItens.estoque}"/></td>
                                <td class="col-md-1"> <a class="btn btn-warning" href="adicionaCarrinho.jsp?id=${listaItens.codigo}&descricao=${listaItens.descricao}&detalhes=${listaItens.detalhes}&preco=${listaItens.preco}">
                                        <span class="glyphicon glyphicon-shopping-cart"></span> Adicionar</a> </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>
                    <hr>
                    <div class="container" id="icons">
                        <div class="col-md-4">
                            <h2><a href ="meusEnderecos.jsp"> <span class="glyphicon glyphicon-home"></span> Meus Endereços</a></h2>
                        </div>
                        <div class="col-md-4">
                            <center><h2><a href ="listaCarrinho.jsp"> <span class="glyphicon glyphicon-shopping-cart"></span> Ver Carrinho</a></h2></center>               
                        </div>
                        <div class="col-md-4">
                            <h2 align="right"><a href ="consultaPedCli.jsp"> <span class="glyphicon glyphicon-search"></span> Consulta Pedidos</a></h2>
                        </div>
                    </div>
                    <br><br>
                    <c:import url="rodape.jsp"/> 
                </div>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>
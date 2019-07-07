<%-- 
    Document   : manutencaoItens
    Created on : 21/10/2018, 21:24:06
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:choose>
    <c:when test="${tipo =='A'}">
        <html>
            <head>
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                <link href="_css/bootstrap.min.css" rel="stylesheet">
                <link rel="icon" href="_img/favicon.jpg">
                <title>Manutenção dos Produtos da Loja</title>
                <style>
                    body{
                        text-shadow: 1px 1px 1px black;
                    }
                    
                </style>
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalho.jsp"/>
                    <center><h1> Manutenção dos Produtos </h1></center>   
                    <hr>
                    <center><h2> Lista de Cervejas </h2></center>
                        <%--     <sql:setDataSource var="ds"  dataSource="jdbc/sitecompras"/> --%>

                    <sql:query var="ResultadoItens" dataSource="${ds}">
                        select * from produtos
                    </sql:query>
                    <table class="table table-responsive table-hover table-striped" class="col-lg-12">
                        <tr>
                             <th>Nome</th>  
                             <th style="padding-left: 200px;">Detalhes</th>
                             <th>Preço</th>
                             <th>Estoque</th>
                            
                        </tr> 
                        <c:forEach var="listaItens" items="${ResultadoItens.rows}">
                            <tr>
                                <!--A tag out é responsável por gerar uma String de saída na tela -->
                                <!--<td class="col-md-1 text-danger"><c:out value="${listaItens.codigo}"/></td>-->
                                <td class="col-md-1 text-danger"><c:out value="${listaItens.descricao}"/></td>
                                <td class="col-md-4 text-danger"><c:out value="${listaItens.detalhes}"/></td>
                                <td class="col-md-1 text-danger"><fmt:formatNumber value="${listaItens.preco}" minFractionDigits="2"type="currency"/></td>
                                <td class="col-md-1 text-danger"><c:out value="${listaItens.estoque}"/></td>
                                <td class="col-md-1 text-danger"> <a class="btn btn-danger" href="confirmaExclusao.jsp?id=${listaItens.codigo}"><span class="glyphicon glyphicon-trash"></span> Excluir </a> </td>
                                <td class="col-md-1"> <a class="btn btn-group-sm btn-warning" href="alteraItem.jsp?id=${listaItens.codigo}"><span class="glyphicon glyphicon-edit"></span> Alterar </a></td>
                            </tr>
                        </c:forEach>
                    </table>
                   
                    <hr>
                    <center class="well"><h2><a href ="cadastraItem.jsp"><span class="glyphicon glyphicon-barcode"></span>  Cadastrar Produtos</a></h2></center>
                                
                    <center><h3><a  style="text-shadow: 0px 1px 0px black;"class = "btn btn-primary btn-lg" href="home.jsp"><span class="glyphicon glyphicon-triangle-left"></span> Voltar</a></h3></center>
                    <c:import url="rodape.jsp"/>
                </div>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>

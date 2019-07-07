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
                <title>Meus Endereços</title>
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
                    <br>

                    <div class="container">
                        <center><h2> Endereços de Entrega </h2></center>
                        <hr>
                            <sql:query var="ResultadoItens" dataSource="${ds}">
                            select * from endereco , usuarios where endereco.ID_USER = usuarios.ID_USER and usuarios.id_user=?
                            <sql:param value="${id_user}" />
                        </sql:query>
                        <table class="table table-hover table-bordered table-striped">
                            <tr class="success">
                                
                                <th>Descrição</th> 
                                <th style="padding-left: 250px;">Logradouro</th>
                                <th>Número</th>
                                <th>Complemento</th>
                                <th>Cidade</th>
                                <th></th>
                                <th></th>

                            </tr> 
                            <c:forEach var="listaItens" items="${ResultadoItens.rows}">
                                <tr>
                                    <!--A tag out é responsável por gerar uma String de saída na tela -->
                                    
                                    <td class="col-md-1 text-primary"><c:out value="${listaItens.descricao}"/></td>
                                    <td class="col-md-4 text-success"><c:out value="${listaItens.logradouto}"/></td>
                                    <td class="col-md-1 text-danger"><c:out value="${listaItens.numero}"/></td>
                                    <td class="col-md-1"><c:out value="${listaItens.complemento}"/></td>
                                    <td class="col-md-1"><c:out value="${listaItens.cidade}"/></td>
                                    <td class="col-md-1"> <a class="btn btn-primary" href="escolheEnderecoEntrega.jsp?id=${listaItens.id_endereco}">
                                            <span class="glyphicon glyphicon-thumbs-up"></span> Entregar neste</a> </td>
                                    <td class="col-md-1"> <a class="btn btn-danger" href="confirmaExclusaoEndereco.jsp?id=${listaItens.id_endereco}">
                                            <span class="glyphicon glyphicon-trash"></span> Excluir</a> </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>


                    <br><br><center><a class="btn btn-lg btn-warning col-md-12" href="novoEndereco.jsp"><span class="glyphicon glyphicon-new-window"></span> Cadastrar Novo </a></center><br>
                    <br><br><center><a class="btn btn-lg btn-primary col-md-12" href="listaItens.jsp"><span class="glyphicon glyphicon-triangle-left"></span> Voltar </a></center>

                <c:import url="rodape.jsp"/>
            </div>
        </body>
    </html>
</c:when>
<c:otherwise>
    <c:redirect url="index.jsp"/>
</c:otherwise>
</c:choose>

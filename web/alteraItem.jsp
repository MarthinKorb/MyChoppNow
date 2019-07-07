<%-- 
    Document   : alteraItem
    Created on : 21/05/2018, 09:55:21
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                <style>
                    body{
                        text-shadow: 1px 1px 1px black;
                    }
                </style>
                <title>Cadastro de Produtos</title>
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalho.jsp"/>
                    <br><br>
                    <sql:query dataSource="${ds}" var="result">
                        select * from produtos where codigo = ?
                        <sql:param value="${param.id}"/>
                    </sql:query>
                    <h1 class="text-center">Alteração de Produto</h1>
                    <hr>
                    <br><br>
                    <c:forEach items="${result.rows}" var="item">
                        <form class="form-horizontal" method=post action="alteraI.jsp"> 
                            <input type="hidden" name="id" value="${item.codigo}"/>
                            <div class="form-group col-sm-offset-2">
                                <label  class="col-sm-2 control-label">Descrição: </label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="descricao" 
                                           value="${item.descricao}" required="required" maxlength="20"/> 
                                </div>
                            </div>
                            <div class="form-group col-sm-offset-2">
                                <label  class="col-sm-2 control-label">Detalhes: </label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="detalhes" 
                                           value="${item.detalhes}" required="required" maxlength="100"/> 
                                </div>
                            </div>
                            <div class="form-group col-sm-offset-2">
                                <label  class="col-sm-2 control-label">Preço R$ </label>
                                <div class="col-sm-4">
                                    <input class="form-control" type="text" name="preco" value="<fmt:formatNumber value="${item.preco}" minFractionDigits="2"/>" required="required"/> 
                                </div>
                            </div>
                            <div class="form-group col-sm-offset-2">
                                <label  class="col-sm-2 control-label">Estoque</label>
                                <div class="col-sm-4">
                                    <input class="form-control" type="text" name="estoque" value="${item.estoque}" required="required"/> 
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-12">
                                    <input class="btn btn-lg btn-warning" type=submit value="Altera"> 
                                </div>
                            </div>
                        </form> 
                    </c:forEach>
                    <<br><br>
                    <hr> 
                    <p class="text-center"><a  class="btn btn-lg btn-default" href="manutencaoItens.jsp"><span class="glyphicon glyphicon-triangle-left"></span>  Voltar</a></p>
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
<%-- 
    Document   : cadastraItem
    Created on : 16/05/2018, 21:53:08
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <title>Cadastro de Produtos</title>
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalho.jsp"/>
                    
                    <h1 class="text-center">Cadastro de Produtos</h1>
                    <hr>
                    <br><br>
                    <form class="form-horizontal" method=post action="gravaItem.jsp"> 
                        <div class="form-group col-sm-offset-2">
                            <label  class="col-sm-2 control-label">Descrição: </label>
                            <div class="col-sm-6">
                                <input class="form-control" type="text" name="descricao" 
                                       placeholder=" Digite a descrição do produto " required="required" maxlength="20"/> 
                            </div>
                        </div>
                        <div class="form-group col-sm-offset-2">
                            <label  class="col-sm-2 control-label">Detalhes: </label>
                            <div class="col-sm-6">
                                <input class="form-control" type="text" name="detalhes" 
                                       placeholder=" Digite os detalhes do produto " required="required" maxlength="100"/> 
                            </div>
                        </div>
                        <div class="form-group col-sm-offset-2">
                            <label  class="col-sm-2 control-label">Preço R$ </label>
                            <div class="col-sm-4">
                                <input class="form-control" type="text" placeholder="Ex: 22,90" name="preco" required="required"/> 
                            </div>
                        </div>
                        <div class="form-group col-sm-offset-2">
                            <label  class="col-sm-2 control-label">Estoque em Litros </label>
                            <div class="col-sm-4">
                                <input class="form-control" type="text" name="estoque" value="" placeholder="Ex: 10" required="required" /> 
                            </div>
                        </div><br/><br/>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-12">
                                <button class="btn btn-lg btn-default" type=submit value="Gravar"><span class="glyphicon glyphicon-ok"></span>  Gravar</button>
                                <button class="btn btn-lg btn-default" type=reset value="Limpar"><span class="glyphicon glyphicon-refresh"></span>  Limpar</button>
                            </div>
                        </div>
                    </form> 
                    <br><br>
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
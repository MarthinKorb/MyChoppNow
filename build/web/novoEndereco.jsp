<%-- 
    Document   : listaCarrinho
    Created on : 20/05/2014, 16:23:58
    Author     : ADMINISTRADOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <title>Endereço de Entrega</title>
                <style>
                    body{
                        text-shadow: 1px 1px 1px black;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalhoCliente.jsp"/>
                    <form id="formularioEndereco" method="get" action="cadastraEndereco.jsp">

                        <h2 style="color: goldenrod; text-shadow: 1px 1px 1px black">Cadastro de Endereço de Entrega</h2><br>
                        <div class="form-group col-md-12">
                            <label for="descricao">Nome</label>
                            <input type="text" required="required" name="descricao" class="form-control" id="descricao" aria-describedby="descricao" placeholder="Ex: Casa do tio Juca">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="logradouro">Endereço</label>
                            <input type="text" required="required" name="logradouro" class="form-control" id="logradouro" aria-describedby="logradouro" placeholder="Ex: Av. Sete de Setembro">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="numero">Número</label>
                            <input type="number" required="required" name="numero" class="form-control" id="numero" placeholder="Ex: 87">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="complemento">Complemento</label>
                            <input type="text" class="form-control" name="complemento" id="complemento" aria-describedby="complemento" placeholder="Ex: Apto.102">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cidade">Cidade</label>
                            <input type="text" required="required" name="cidade" class="form-control" id="cidade" aria-describedby="cidade" placeholder="Ex: Porto Alegre">
                        </div>
                         <div class="form-group col-md-3">
                            <label for="estado">Estado</label>
                            <input type="text" required="required" name="estado" class="form-control" id="estado" aria-describedby="estado " placeholder="Ex: Rio Grande do Sul">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="cep">CEP: </label>
                            <input type="text" required="required" name="cep" class="form-control" id="cep" aria-describedby="cep " placeholder="Ex: 000000-000">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="pais">País</label>
                            <input type="text" required="required" name="pais" class="form-control" id="pais" aria-describedby="pais " placeholder="Ex: Brasil">
                        </div>

                        <div class="col-md-12" align="center">
                            <button style="text-shadow: 1px 1px 1px black" type="submit" class="btn btn-lg btn-warning btn-group-justified"><span class="glyphicon glyphicon-saved"></span>  Enviar</button>
                        </div>                        
                        
                        <div class="col-md-12" align="center">
                            <br>
                            <a style="text-shadow: 1px 1px 1px black" href="listaItens.jsp" class="btn btn-lg btn-primary btn-group-justified"><span class="glyphicon glyphicon-triangle-left"></span>  Voltar</a>
                            <br><br>
                            <hr>
                        </div>                         
                    </form>
                    
                    <br><br><br><br><br><br><br><br><br>
                    <c:import url="rodape.jsp"/>
                </div>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>
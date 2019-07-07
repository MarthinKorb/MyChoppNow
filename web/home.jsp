<%-- 
    Document   : home
    Created on : 21/11/2018, 20:05:49
    Author     : Marthin
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
                <style>
                    body{text-shadow: 1px 1px 1px black}
                </style>
                <title>Manutenção dos Itens da Loja</title>
            </head>
            <body>
                <div class="container">
                    <c:import url="cabecalho.jsp"/>

                    <center><h1> Área de Administrador </h1></center>   
                    <hr>
                    <br>
                    
                    <div class="row">
                        <div class="col-xs-6 col-md-4">
                            <a href="#" class="thumbnail">
                                <img src="_img/tiposCeva.png" alt="...">
                            </a>
                        </div>
                         <div class="col-xs-6 col-md-4">
                            <a href="#" class="thumbnail">
                                <img src="_img/tiposCeva.png" alt="...">
                            </a>
                        </div>
                         <div class="col-xs-6 col-md-4">
                            <a href="#" class="thumbnail">
                                <img src="_img/tiposCeva.png" alt="...">
                            </a>
                        </div>
                    </div>

                    <%-- <center><h2><a class = "btn btn-default btn-lg" href="manutencaoItens.jsp"><span class="glyphicon glyphicon-barcode"></span> Manutenção de Produtos</a></h2></center>
                    <center><h2><a class = "btn btn-default btn-lg" href="consultaPedidos.jsp"><span class="glyphicon glyphicon-search"></span> Consulta Pedidos</a></h2></center>
                    --%>
                    
                    <c:import url="rodape.jsp"/>
                </div>
            </body>
        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp"/>
    </c:otherwise>
</c:choose>

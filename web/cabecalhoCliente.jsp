<%-- 
    Document   : cabecalho
    Created on : 20/11/2018, 14:55:17
    Author     : ADMINISTRADOR
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link href="_css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" href="_img/favicon.jpg">
         <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
        <style>
            
            a{
                color: black;
                border-radius: 10px;
            }
            a:hover {
                text-shadow: 1px 1px 1px black;
                
                box-shadow: 10px black;
                transition: .7s;                
                color: goldenrod;
                text-decoration: none ;
            }

            p {text-align: right;
               margin-right: 10px}

            body{
                font-family:  'Black Han Sans', sans-serif;
                background-color: rgba(0, 0, 0,.03);	
                color: goldenrod;
            }
            .img-responsive{
                margin-top: 15px;
                border-right: 10px;
                height: 60px;
            }
            
            th{
                color: black;
                text-shadow: 1px 1px 1px white;
            }
            
        </style>
    </head>
    <body>

        <div class="nav well">
            <img class="img-responsive img-circle" src= "_img/copo.jpg" vspace="0" height="60px" width="60px" align="left" margin-right="10px" >
            <h1 class="text-left"> A sua loja de Chopp! </h1>
            <p>Bem Vindo <span class="glyphicon glyphicon-user"> </span>  ${usuario} <a class="btn btn-default" href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>  Sair</a></p>
        </div>

        <ul class="nav nav-tabs nav-justified">
            <li role="presentation" class=""><a class="" href="listaItens.jsp"><span class="glyphicon glyphicon-home"></span>  Home</a></li> 
            <li role="presentation" class=""><a class="" href="listaCarrinho.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>  Ver Carrinho</a></li>
            <li role="presentation"><a href="consultaPedCli.jsp"><span class="glyphicon glyphicon-search"></span>  Pedidos</a></li>
        </ul>
        <br>   

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="_js/bootstrap.min.js"></script>
    </body>
</html>

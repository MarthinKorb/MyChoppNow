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
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
        <script type="text/javascript">

        </script> 
        <style>

            a{
                
                color: rgba(0,0,0,1);
                border-radius: 10px;
                text-shadow: 0px 1px 0px black;
            }
            a:hover {
                text-shadow: 1px 1px 1px black;
                box-shadow: 10px black;
                transition: .2s;                
                color: goldenrod;
                text-decoration: none ;
            }

            p {text-align: right;
               margin-right: 10px;
            }

            body{
                <%--font-family: 'Josefin Sans', sans-serif;--%>
                font-family: 'Black Han Sans', sans-serif;
                background-color: rgba(0, 0, 0,.03);	
                color: goldenrod;
            }
            .img-responsive{
                margin-top: 15px;
                border-right: 10px;
                height: 60px;
            }
            
            td{
                font-size: 19px;
                text-shadow: 1px 1px 0px rgba(0,0,0,.8);
                background-color: rgba(0,0,0,.06);
            }

        </style>
    </head>
    <body>

        <div class="nav well">
            <img class="img-responsive img-circle" src= "_img/copo.jpg" vspace="0" height="60px" width="60px" align="left" margin-right="10px" >
            <h1 class="text-left"> A sua loja de Chopp! </h1>
            <p>Bem Vindo <span class="glyphicon glyphicon-user"> </span> ${usuario} <a class="btn btn-default" href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>  Sair</a></p>
        </div>

        <ul class="nav nav-tabs nav-justified" id="animation-2">
            <li role="presentation" class=""><a class="" href="home.jsp"><span class="glyphicon glyphicon-home"></span>  Home</a></li> 
            <li role="presentation" class=""><a class="" href="manutencaoItens.jsp"><span class="glyphicon glyphicon-wrench"></span>  Manutenção de Produtos</a></li>
            <li role="presentation"><a href="consultaPedidos.jsp"><span class="glyphicon glyphicon-search"></span>  Pedidos</a></li>
        </ul>
        <br>   

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="_js/bootstrap.min.js"></script>
    </body>
</html>

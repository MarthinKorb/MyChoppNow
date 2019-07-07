<%-- 
    Document   : index
    Created on : 17/05/2018, 20:47:34
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Chopp Now!</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link href="_css/bootstrap.min.css" rel="stylesheet">
        <link href="_css/estilo.css" rel="stylesheet">
        <link rel="icon" href="_img/favicon.jpg">
        <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

      
        <style rel="stylesheet">
            body{
                font-family: 'Black Han Sans', sans-serif;
                background-image: url('_img/chopeira.jpg');
                background-repeat: no-repeat;
                background-size:100%;
                text-shadow: 1px 1px 1px black;
            }
            
            .navbar-right{
                padding-top: 7px;
                padding-left: 3px;
                padding-right: 3px;
                background-color: rgba(255,255,255,.3);
                margin-right: 0px;
                margin-top: 10px;
            }

            #h1,#h2{
                font-size: 70px;
                color: goldenrod;
                text-shadow: 0px 0px 10px white;
                text-shadow: 0px 0px 1px black;
            }
            #btCadastrar{
                position: absolute;
                margin-left: 560px;
                width: 400px;
            }



        </style>
        <sql:setDataSource var="ds"
                           driver="org.apache.derby.jdbc.ClientDriver"
                           url="jdbc:derby://localhost:1527/MyChoppNowD"
                           user="java2"
                           password="java2"
                           scope="session"/>

    </head>

    <body>
        <div class="container container-fluid">
            <nav class="navbar navbar-right">
                <form class="form form-inline" name="Formulario" action="loga.jsp" method="post">
                    <div class="form-group">
                        <label style="text-shadow: 1px 1px 1px white" class="label-control" for="login">Login</label>
                        <input class="form-control" required="required" type="text" id="login" name="login"  placeholder="Seu login">
                    </div>
                    <div class="form-group">
                        <label style="text-shadow: 1px 1px 1px white" class="label-control" for="senha">Senha</label>
                        <input class="form-control" required="required"  type="password" id="senha" name="senha"  placeholder="Sua senha">
                    </div>  
                    <button style="text-shadow: 1px 1px 1px black" class="btn btn-primary" type="submit" ><span class="glyphicon glyphicon-log-in"> </span>   Login </button>   
                </form>  
            </nav>

            <br />
            <br />
            <br/>
            <br/>
            <br/>
            <br/><br/><br/><br/><br/><br/><br/>
            <center><h1 id="h1"> My Chopp Now! </h1></center>            
            <center><h2 id="h2"> Seu chopp bem gelado em um instante! </h2></center>
        </div>
        <br>
        <div>
            <center><h4 style="color: goldenrod;">Ainda não se registrou?</h4></center>
            <center> <a href="novoUsuario.jsp" class="btn btn-lg btn-warning" type="submit" ><span class="glyphicon glyphicon-log-in"> </span>   Registrar-me </a> </center>  

        </div>

    </body>
</html>
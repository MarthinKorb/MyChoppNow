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


        <script language="javascript" type="text/javascript">
            function validar() {
               <%-- var login = formularioRegistrar.login.value; --%>
                var senha = formularioRegistrar.senha.value;
                var rep_senha = formularioRegistrar.rep_senha.value;

            <%-- if (login === "") {
                    alert('Preencha o campo com seu nome');
                    formularioRegistrar.login.focus();
                    return false;
                } --%>

                if (senha !== rep_senha) {
                    alert('As senhas estão diferentes!');
                    formularioRegistrar.senha.focus();
                    return false;
                }
            }
        </script>

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

            #h1{
                font-size: 70px;
                color: goldenrod;
                text-shadow: 0px 0px 30px black;

            }
            #h2{
                font-size: 40px;
                color: goldenrod;
                text-shadow: 0px 0px 30px black;
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
        
        <br />
        <br/>
        <br/>
        <br/>
        <br/><br/><br/><br/><br/>
    <center><h1 id="h1"> My Chopp Now! </h1></center>            
    <center><h2 id="h2"> Seu chopp bem gelado em um instante! </h2></center><br/><br/><br/>
</div>
<br>
<form id="formularioRegistrar" method="get" action="registra.jsp">   
    <div class="container">

        <div class="row col-md-4" style="margin-left:380px;">

            <div class="form-group">
                <label style="color: goldenrod;font-size: 15px; text-shadow: 1px 1px 10px black;" class="label-control" for="login">Login</label>
                <input class="form-control" type="text" id="login" name="login" required="required"  placeholder="Ex: Zé do aipim">
            </div>
            <div class="form-group">
                <label style="color: goldenrod; font-size: 15px;" class="label-control" for="senha">Senha</label>
                <input class="form-control"  type="password" required="required" id="senha" name="senha"  placeholder="Sua senha...">
            </div>              
            <div class="form-group">

                <input class="form-control"  type="password" required="required" id="rep_senha" name="rep_senha"  placeholder="Confirme sua senha...">
            </div>  
            <center> <button style="text-shadow: 1px 1px 1px black" class="btn btn-lg btn-warning" data-toggle="tooltip" type="submit" onclick="return validar()" ><span class="glyphicon glyphicon-log-in"> </span>   Cadastrar-me Agora! </button> </center>  


            <br>
            <center> <a style="text-shadow: 1px 1px 1px white;" href="index.jsp" class="btn  btn-default" type="submit" ><span class="glyphicon glyphicon-triangle-left"> </span>  Voltar </a> </center>

        </div>
    </div>
</form> 

</body>
</html>
<%-- 
    Document   : confirmaExclusaoCarrinho
    Created on : 20/05/2014, 21:15:41
    Author     : ADMINISTRADOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            if (confirm("Tem certeza que deseja excluir ?")) {
                window.location = "excluiEndereco.jsp?id=${param.id}";
            } else {
                window.location = "meusEnderecos.jsp";
            }
        </script>
    </body>
</html>

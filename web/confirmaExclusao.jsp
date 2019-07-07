<%-- 
    Document   : confirmaExclusao
    Created on : 14/05/2018, 19:44:01
    Author     : marci
--%>

<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            if (confirm("Tem certeza que deseja excluir ?")) {
                window.location = "excluiItem.jsp?id=${param.id}";
            } else { 
                window.location = "manutencaoItens.jsp";
            }
        </script>
    </body>
</html>
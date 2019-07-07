<%-- 
    Document   : excluiItemCarrinho
    Created on : 20/05/2014, 21:44:06
    Author     : ADMINISTRADOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.MyChoppNow.Item"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
            int id = Integer.parseInt(request.getParameter("id"));

            for (Item a : Item.carrinho) {
                if (a.getId() == id) {
                    Item.carrinho.remove(a);
                    break;
                }
            }
            response.sendRedirect("listaCarrinho.jsp");
            
            %>
    </body>
</html>

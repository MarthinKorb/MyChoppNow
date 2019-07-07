<%-- 
    Document   : logout
    Created on : 21/05/2018, 19:13:33
    Author     : marci
--%>

<%@page import="br.com.MyChoppNow.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="usuario" value="" scope="session"/>
        <c:set var="id_user" value="" scope="session"/>
        <c:set var="tipo" value="" scope="session"/>
        <c:set var="endereco" value="" scope="session" />
        <% Item.carrinho.clear();%>
        <c:redirect url="index.jsp"/>
    </body>
</html>

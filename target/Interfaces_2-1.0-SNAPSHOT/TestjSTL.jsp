<%-- 
    Document   : TestjSTL
    Created on : 14 may. 2020, 23:04:15
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JSTL JSP Tag Library</h1>

        <!-- tag out -->
        <c:out value="Hola Mundo JSTL!"/>
        <br>

        <!-- tag set declarar una variable -->
        <c:set var="variable" scope="request" value="Texto" />
        <c:out value="${variable}"/>
        <br>

        <!-- tag if -->
        <c:set var="miVariable" scope="request" value="100" />

        <c:if test="${ miVariable == '100'}" >
            <c:out value="miVariable es igual a 100" />
        </c:if>

        <c:if test="${!(miVariable == '100')}" >
            <c:out value="miVaribale NO es igual a 100" />
        </c:if>

        <!-- Parámetros de entrada -->
        <c:if test="${param.saludar}" >
            <h1>Hola ${param.nombre}!</h1>
        </c:if>

        <!-- Estructura for -->
        <%--Itera desde 10 al 20 saltando de a dos --%>
        <c:forEach var="i" begin="10" end="20" step="2">
            <c:out value="${i}"/><br>
        </c:forEach>

        <hr>

        <c:forEach var="i" begin="10" end="20" varStatus="status" step="5">
            indice: <c:out value="${status.index}"/>
            iteracion #: <c:out value="${status.count}"/><br>
        </c:forEach>

        <hr>

        <!-- Recorrer la lista de clientes -->
        <jsp:useBean id="cliente" scope="request" 
                     class="ar.org.centro8.curso.java.web.manager.ClienteManager"/>

        <table border="1">
            <thead><th>id</th><th>nombre</th><th>apellido</th></thead>
                <c:forEach var="c" items="${cliente.all}">
            <tr>
                <td><c:out value="${c.id}" /> </td>
                <td><c:out value="${c.nombre}"/> </td>
                <td><c:out value="${c.apellido}"/> </td>
            <tr>
            </c:forEach>
    </table>

    <%-- JSTL SQL --%>
    <sql:setDataSource
        var="ds"
        driver="com.mysql.cj.jdbc.Driver"
        url:"jdbc:mysql://localhost:3306/negocioWeb?serverTimezone"
        user:"root"
        password="centro8"
    />
    
        



    </body>
</html>

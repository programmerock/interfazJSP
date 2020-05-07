<%-- 
    Document   : ArticulosAlta
    Created on : 6 may. 2020, 23:24:28
    Author     : USER
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Articulo"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ArticuloRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ArticuloRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet href=css/screen.css type=text/css >
        <title>Alta de Artículos</title>
    </head>
    <body>
        <div id="footer" >
            <%
                try{
                    String descripcion = request.getParameter("descripcion");
                    float costo = Float.parseFloat(request.getParameter("costo"));
                    float precio = Float.parseFloat(request.getParameter("precio"));
                    int stock = Integer.parseInt(request.getParameter("stock"));
                    int stockMin = Integer.parseInt(request.getParameter("stockMin"));
                    int stockMax = Integer.parseInt(request.getParameter("stockMax"));
                    I_ArticuloRepository ar=new ArticuloRepository(Connector.getConnection());
                    Articulo articulo = new Articulo(descripcion, costo, precio, stock, stockMin, stockMax);
                    ar.save(articulo);
                    out.println("<h3>Se dio de alta el artículo de id: "+articulo.getId()+"</h3>");
                } catch (Exception e) {
                    out.println("<h3>Faltan completar datos</h3>");
                    System.out.println("************************");
                    System.out.println(LocalDateTime.now());
                    e.printStackTrace();
                    System.out.println("************************");
                }
            %>
        </div>
        <form action="Articulos.jsp" >
            <input type="submit" value="Volver" />
        </form>
    </body>
</html>

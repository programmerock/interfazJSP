<%-- 
    Document   : FacturasAlta
    Created on : 7 may. 2020, 01:14:33
    Author     : USER
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Factura"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.FacturaRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_FacturaRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enumerados.Letra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel=stylesheet href=css/screen.css type=text/css >
    </head>
    <body>
        <div id="footer" >
            <%
                try{
                    Letra letra = Letra.valueOf(request.getParameter("letra"));
                    int numero = Integer.parseInt(request.getParameter("numero"));
                    String fecha = request.getParameter("fecha");
                    double monto = Double.parseDouble(request.getParameter("monto"));
                    int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                    I_FacturaRepository fr=new FacturaRepository(Connector.getConnection());
                    Factura factura = new Factura(letra, numero, fecha, monto, idCliente);
                    fr.save(factura);
                    out.println("<h3>Se dio de alta la factura de id: "+factura.getId()+"</h3>");
                } catch (Exception e) {
                    out.println("<h3>Faltan completar datos</h3>");
                    System.out.println("************************");
                    System.out.println(LocalDateTime.now());
                    e.printStackTrace();
                    System.out.println("************************");
                }
            %>
        </div>
        <form action="Facturas.jsp" >
            <input type="submit" value="Volver" />
        </form>
    </body>
</html>

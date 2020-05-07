<%-- 
    Document   : Facturas
    Created on : 19 abr. 2020, 23:19:45
    Author     : USER
--%>

<%@page import="ar.org.centro8.curso.java.interfaces.utils.TableHTML"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Factura"%>
<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.FacturaRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_FacturaRepository"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facturas</title>
        <link rel=stylesheet href=css/screen.css type=text/css >
    </head>

    <body>
        <div id="header">
            <h1>Mantenimiento de Facturas</h1>
        </div>

        <div id="main" >
            <form action="FacturasAlta.jsp" method="GET">
                <table>
                    <caption>Formulario para el ingreso de nuevas facturas</caption>
                    <tr>
                        <td>Letra</td>     
                        <td>
                            A <input type="radio" name="letra" value="A"/>
                            B <input type="radio" name="letra" value="B"/>
                            C <input type="radio" name="letra" value="C"/>
                        </td>
                    </tr>
                    <tr><td>Numero</td>         <td><input type="text" name="numero"/></td></tr>
                    <tr><td>Fecha</td><td>      <input type="date" name="fecha"/></td></tr>
                    <tr><td>Monto</td>          <td><input type="text" name="monto"/></td></tr>
                    <tr><td>Id Cliente</td>     <td><input type="text" name="idCliente"/></td></tr>
                    <tr>
                        <td><input type="reset" value="BORRAR" /></td>
                        <td><input type="submit" value="GUARDAR" /></td>
                    </tr>
                </table>
            </form>
        </div>        

        <div id="main" >
            <form>
                Buscar por id de cliente
                <input type="text" name="buscarIdCliente" />
            </form>
        </div>

        <div id="footer" >
            <%
                String buscar="";
                try {
                    buscar = request.getParameter("buscarIdCliente");                  
                } catch (Exception e) {
                }
                try{
                    I_FacturaRepository fr=new FacturaRepository(Connector.getConnection());
                    List<Factura> lista=new ArrayList();
                    if(buscar==null || buscar=="") lista=fr.getAll();
                    else lista=fr.getByIdCliente(Integer.parseInt(buscar));
                    out.println(new TableHTML<Factura>().getTable(lista));
                } catch (Exception e) {
                    out.println("<h3>Faltan completar datos</h3>");
                    System.out.println("************************");
                    System.out.println(LocalDateTime.now());
                    e.printStackTrace();
                    System.out.println("************************");
                }
            %>
        </div>
    </body>
</html>

<%-- 
    Document   : Articulos
    Created on : 18 abr. 2020, 16:53:20
    Author     : USER
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="ar.org.centro8.curso.java.interfaces.utils.TableHTML"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Articulo"%>
<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ArticuloRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ArticuloRepository"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Articulos</title>
        <link rel=stylesheet href=css/screen.css type=text/css >
    </head>

    <body>
        <div id="header">
            <h1>Mantenimiento de Artículos</h1>
        </div>
        
        <div id="main" >
            <form action="ArticulosAlta.jsp" method="GET">
                <table>
                    <caption>Formulario para el ingreso de nuevos artículos</caption>
                    <tr><td>Descripción</td>    <td><input type="text" name="descripcion"/></td></tr>
                    <tr><td>Costo</td>  <td><input type="text" name="costo"/></td></tr>
                    <tr><td>Precio</td> <td><input type="text" name="precio"/></td></tr>
                    <tr><td>Stock</td>  <td><input type="text" name="stock"/></td></tr>
                    <tr><td>Stock Mínimo</td>   <td><input type="text" name="stockmin"/></td></tr>
                    <tr><td>Stock Máximo</td>   <td><input type="text" name="stockmax"/></td></tr>
                    <tr>
                        <td><input type="reset" value="BORRAR"/></td>
                        <td><input type="submit" value="GUARDAR"/></td>                
                    </tr>            
                </table>
            </form>
        </div>        

        <div id="main" >
            <form>
                Buscar por descripción:
                <input type="text" name="buscarDescripcion" />
            </form>
        </div>

        <div id="footer" >
            <%
                String buscar="";
                try {
                    buscar = request.getParameter("buscarDescripcion");
                } catch (Exception e) {e.printStackTrace();}
                
                try{
                    I_ArticuloRepository ar= new ArticuloRepository(Connector.getConnection());
                    List<Articulo> lista=new ArrayList();
                    if(buscar==null || buscar=="") lista=ar.getAll();
                    else lista=ar.getLikeDescripcion(buscar);
                    out.println(new TableHTML<Articulo>().getTable(lista));
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

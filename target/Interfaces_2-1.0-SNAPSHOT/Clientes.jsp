<%-- 
    Document   : Clientes
    Created on : 15 abr. 2020, 23:24:39
    Author     : USER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ar.org.centro8.curso.java.interfaces.utils.TableHTML"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ClienteRepository"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enumerados.TipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel=stylesheet href=css/screen.css type=text/css >
    </head>

    <body>
        <div id="header">
            <h1>Mantenimiento de Clientes</h1>
        </div>

        <div id="main" >
            <form action="ClientesAlta.jsp" method="GET">
                <table>
                    <caption>Formulario para el ingreso de nuevos clientes</caption>
                    <tr><td>Nombre</td>              <td><input type="text" name="nombre"/></td></tr>
                    <tr><td>Apellido</td>            <td><input type="text" name="apellido"/></td></tr>
                    <tr><td>Tipo de Documento</td>   
                        <td>
                            <select name="tipoDocumento">
                                <%
                                    for (TipoDocumento t : TipoDocumento.values()) {
                                        out.println("<option value=" + t + ">" + t + "</option>");
                                    }
                                %>
                            </select>                            
                        </td></tr>
                    <tr><td>Número de Documento</td> <td><input type="text" name="nroDocumento"/></td></tr>
                    <tr><td>Dirección</td>           <td><input type="text" name="direccion"/></td></tr>
                    <tr><td>Comentarios</td>         <td><textarea name="comentarios"></textarea></td></tr>
                    <tr><td><input type="reset" value="BORRAR"/></td>
                        <td><input type="submit" value="AGREGAR"/></td>
                    </tr>
                </table>
            </form>
        </div>        

        <div id="main" >
            <form>
                Buscar Apellido:
                <input type="text" name="buscarApellido"/>
            </form>
        </div>

        <div id="footer" >
            <%
                String buscar="";
                try {
                    buscar = request.getParameter("buscarApellido");
                } catch (Exception e) {
                }
                try{
                    I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());
                    List<Cliente> lista = new ArrayList();
                    if(buscar== null || buscar=="") lista=cr.getAll();
                    else lista=cr.getLikeApellido(buscar);
                    out.println(new TableHTML<Cliente>().getTable(lista));
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

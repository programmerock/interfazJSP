<%-- 
    Document   : Test
    Created on : 15 abr. 2020, 21:40:25
    Author     : USER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <!-- Comentarios -->
        <% 
            //código JSP o Java
            out.println("<h1>Hola Mundo JSP</h1>");
            List<String>lista=new ArrayList();
            lista.add("Lunes");
            lista.add("Martes");
            lista.add("Miércoles");
            lista.add("Jueves");
            lista.add("Viernes");
            for(String st:lista) out.println(st + "<br>");    
            
            try{
                String nro1=request.getParameter("numero1");
                String nro2=request.getParameter("numero2");
                int n1=Integer.parseInt(nro1);
                int n2=Integer.parseInt(nro2);
                int resultado=n1+n2;
                out.println("<h3>Total: "+resultado+"</h3>");
            }catch (Exception e){out.println("<h3>Faltan ingresar parámetros</h3>");}
        %>
        
        <hr>
        <% 
            int total=20;
            {
                int total2=40;
                out.println(total2+"<br>");
            }
        %>
        
        <hr>
        <%
            out.println(total+"<br>");
        %>
        
        <hr>
        <% 
            //armar una tabla sobre lista en un solo bloque
//            out.println("<table border=1>");
//            for(String st:lista){
//                out.println("<tr>");
//                out.println("<td>");
//                out.println(st);
//                out.println("</td>");
//                out.println("</tr>");
//                    out.println("<tr><td>"+st+"</td></tr>");
//            }            
//            out.println("</table>");
        %>
        
        <table>
            <% for(String st:lista){%>
            <tr>
                <td>
                    <% out.println(st);%>
                </td>
            </tr>
            <% } %>            
        </table>
            
    </body>
</html>

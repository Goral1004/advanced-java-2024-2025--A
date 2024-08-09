<%-- 
    Document   : display
    Created on : 31 Jul, 2024, 11:52:03 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, java.sql.*" %>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c"%> 
<%@taglib uri ="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function confirmGo(m,u){
            
                if (confirm(m)){
                 window.location =u;   
                }
            }
            
        </script>
    </head>
    <body>
         <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
         <sql:query dataSource= "${dbsource}" var ="result">
             SELECT * FROM productdetails_09
         </sql:query>
                <table border ="2"><tr>
                        <th> product id </th>
                        <th> product name</th>
                        <th> quantity </th>
                        <th col ="2"> action </th>
                        </tr>
                        <c:forEach var = "row" items ="${result.rows}">
                            <tr>
                             <td> <c:out value ="${row.pid}"/></td>
                             <td><c:out value ="${row.pname}"/></td>   
                              <td><c:out value ="${row.quantity}"/></td>
                              <td> <a href ="update.jsp?pid=<c:out value ="${row.pid}"/>"> update</a></td>
                              <td> <a href ="javascript:confirmGo('sure delete this?', 'deletedb.jsp?pid=<c:out value="${row.pid}"/>')">delete</a></td>
                            </tr>
                         </c:forEach>
                 </table>

                            
    </body>
</html>

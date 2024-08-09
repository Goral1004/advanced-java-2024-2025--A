
<%-- 
    Document   : insert
    Created on : 31 Jul, 2024, 11:49:57 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action ="insertdb.jsp">
        <table>
            <tr>
                <th colspan="2">purchase product</th>
            </tr>
            <tr> 
                <td>Product id </td>
                <td><input type ="text" name="pid" ></td>  
            </tr>
            <tr>
            <td>Product name </td>
            <td><input type ="text" name="pname" ></td>
            </tr>
             <tr>
            <td>Quantity</td>
            <td><input type ="text" name="quantity" ></td>
            </tr>
            <tr>
              <td><input type ="submit" value="submit" ></td>
               <td><input type ="button" value="reset" ></td>
            </tr>
                
        </table>
    </form>
        <font color ="red">
        <c:if test ="${not empty param.errMsg}">
         <c:out value ="${param.errMsg}"/>
         <a href="index.html"> go back </a>
        </c:if>
         </font>
         <font color ="green">
         <c:if test ="${not empty param.susMsg}">
           <c:out value ="${param.susMsg}"/>  
           <a href="index.html"> go back </a>
         </c:if>
          </font>
        
    </body>
</html>

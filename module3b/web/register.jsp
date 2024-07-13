<%-- 
    Document   : register
    Created on : 12 Jul, 2024, 12:40:36 PM
    Author     : Admin
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import= "javax.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("Uname");
            String password = request.getParameter("pass");
            String reEnter = request.getParameter("pass1");
            String email = request.getParameter("email");
             String country = request.getParameter("country");

          if (password.equals(reEnter)){
              //database connectivity code
              try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                PreparedStatement pst=con.prepareStatement("INSERT INTO registeration_h1 values(?,?,?,?)");
                pst.setString(1,username);
                 pst.setString(2,password);
                 pst.setString(3,email);
                 pst.setString(4,country);
                 //pst.setString(5,"1");
                  // pst.setString(6,"sleeping");
                 int rows=pst.executeUpdate();
                 if (rows ==1){
                     out.print("registeration successful ");
                 }
                 else {
                     out.print("registeration failed");
                }
              }
              catch(Exception e){
                  out.print("exception detail" +e);
              }
              
          }
            else{
              out.print("password mistcahed");
          
            %>
            <jsp:include page ="registeration.html"></jsp:include>
            <% 
              }  
                
                %>
    </body>
</html>

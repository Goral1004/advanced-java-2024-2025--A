<%-- 
    Document   : login
    Created on : 12 Jul, 2024, 12:41:15 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String username = request.getParameter("uname");
            String password = request.getParameter("pass");
           
            try{
            Class.forName("com.mysql.jdbc.Driver");
             Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement pst=con.prepareStatement("SELECT * from registeration_h1 where name=? and password=?");
                pst.setString(1,username);
                pst.setString(2,password);
                ResultSet rs = pst.executeQuery();
                if(rs.next()){
                    out.print("Login sucess!");
                }else{
                out.print("Login Unsucess!");
                }
            }catch(Exception e){
                out.print(e);
            }
            
            %>
    </body>
</html>

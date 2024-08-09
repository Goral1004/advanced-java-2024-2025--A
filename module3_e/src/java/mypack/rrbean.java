/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.Stateful;

/**
 *
 * @author Admin
 */
@Stateful
public class rrbean {
    public rrbean(){}
    
    public String roombooking(String cn, String cm,String rt) throws ClassNotFoundException, SQLException
    {
        String message ="";
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
        String query ="SELECT * FROM roombook WHERE roomtype = ? and statusroom='not booked'";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1,rt);
        ResultSet rs= pst.executeQuery(); 
        if(rs.next())
        {String rno=rs.getString(1);
        PreparedStatement psmt1=con.prepareStatement("UPDATE roombook SET cust=? WHERE roomid=?");
        psmt1.setString(1,cn);
        psmt1.setString(2,rno);
        psmt1.executeUpdate();
        psmt1=con.prepareStatement("UPDATE roombook SET mob = ? WHERE roomid= ?");
         psmt1.setString(1,cm);
        psmt1.setString(2,rno);
        psmt1.executeUpdate();
        psmt1=con.prepareStatement("UPDATE roombook SET statusroom = ? WHERE roomid= ?");
         psmt1.setString(1,"booked");
        psmt1.setString(2,rno);
        psmt1.executeUpdate();
         message ="Room"+rno+"BOOKED AND CHARGES ="+rs.getString(3);
        }
        else
        {message ="Room"+rt+"currently not available";
        }
        }
    
        catch(Exception e){message=""+e;}
        return message;
    }}
            

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")


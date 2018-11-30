
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<form method="post">

<table border="2">
   <tr>
       
      <td>ID</td>
       
        <td>CollegeName</td>
		 <td>District</td>
       
   </tr>
   <%
   try
   {
	   Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://digitalsummit.cwyafhmsarvs.us-east-1.rds.amazonaws.com:3306/miracle?useSSL=false";
       String username="miracle";
       String password="Miracle123";
       String query="select * from tblDS18Colleges";
       
            
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
         
           <tr><td><%out.println(rs.getInt("ID")); %></td>
         
           <td><%out.println(rs.getString("CollegeName")); %></td>
		    <td><%out.println(rs.getString("District")); %></td>
			</tr>
          

   <%
       }
   %>
   </table>
   <%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
</form>
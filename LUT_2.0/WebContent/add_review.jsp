<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext" %>
	
<%
String school_id = request.getParameter("school_id");
//String school_id = Integer.parseInt(school_id_string);
String name = request.getParameter("name");
String review = request.getParameter("review");


System.out.println("Name: " + name + " review: " + review + " idnr " + school_id);	


//check if the boxes are empty.
if(name!=null && review!=null){
	  if(name!="" && review!="") {
		  System.out.println("kommer hit ja");
         // try {
           	    String url ="jdbc:mysql://mysql.stud.ntnu.no/sigurdul_db1";
        		String userDB = "sigurdul_ps";
      			String pwDB ="123456";
    		    System.out.println("Innenfor try");
    		    InitialContext ctx = new InitialContext();
    		    DataSource ds = (DataSource) ctx.lookup("jdbc/lut2");
    		    Connection connection = ds.getConnection();
    		    if (connection == null)
    		    {
    		   	 throw new SQLException("Error establishing connection!");
    		    }
    		    		
				System.out.println("kommer forbi connection");
				String query = "INSERT INTO user_reviews(school_id, user_id, review) VALUES (?, ?, ?)";
				System.out.println(query);
				PreparedStatement ps = connection.prepareStatement(query);
				ps.setString(1, school_id);
				ps.setString(2, name);
				ps.setString(3, review);

				ps.executeUpdate();
				/*
				try {
					ps.executeUpdate();
				}
				catch(Exception e){
					out.println("executeUpdate FAILER");
				}
				*/
				
				connection.close();
		        System.out.println("tullball");	  
 			//}
//	catch (Exception ex) {
  //     out.println("Unable to connect to database.");
    // }
  }
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1;url=index.jsp"> 
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>Review added!</title>
    </head>
    <body>
    <% session.invalidate();%>
        <h1>Thanks ${param.name}!</h1>
        Your contribution is appreciated.<br>
        You will be redirected to the LUT2.0 main page in a few seconds.
</body>
</html>

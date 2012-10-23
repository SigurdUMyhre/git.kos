<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext" %>

<%
String school_id = request.getParameter("school_id");
String name = request.getParameter("name");
String review = request.getParameter("review");
InitalContext ctx = new InitialContext();
Datasource ds = (DataSource) ctx.lookup("jdbc/lut2");

Connection connection = ds.getConnection();
PreparedStatement pstatement = null;
int updateQuery = 0;

System.out.println("Name: " + name + " review: " + review);

//check if the boxes are empty.
if(name!=null && review!=null){
	  if(name!="" && review!="") {
          try {
/* Create a connection by using getConnection()
method that takes parameters of string type 
connection url, user name and password to connect 
 to database. */
 System.out.println("before");

System.out.println("her er vi");
             // sql query to insert values in the secified table.
String queryString = "INSERT INTO user_reviews(school_id, name, review) VALUES (?, ?, ?)";
 /* createStatement() is used for create statement object that is used for 
 sending sql statements to the specified database. */
System.out.println("queryString: "+ queryString);
pstatement = connection.prepareStatement(queryString);
pstatement.setString(1, school_id);
pstatement.setString(2, name);
pstatement.setString(3, review);
pstatement.executeUpdate();
          }
	catch (Exception ex) {
       out.println("Unable to connect to database.");
                 }
    finally {
                  // close all the connections.
                  pstatement.close();
                  connection.close();
     }
         
  }
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="5;url=index.jsp"> 
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>Review added!</title>
    </head>
    <body>
        <h1>Thanks ${param.name}!</h1>
        Your contribution is appreciated.<br>
        You will be redirected to the LUT2.0 main page in a few seconds.
</body>
</html>

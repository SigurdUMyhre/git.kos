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
/* InitalContext ctx = new InitialContext();
Datasource ds = (DataSource) ctx.lookup("jdbc/lut2"); */

/* Connection connection = ds.getConnection();
PreparedStatement pstatement = null;
int updateQuery = 0; */

System.out.println("Name: " + name + " review: " + review);

//check if the boxes are empty.
if(name!=null && review!=null){
	  if(name!="" && review!="") {
          try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
		        Connection con = DriverManager.getConnection("jdbc:mysql://mysql.stud.ntnu.no/sigurdul_db1", "", ""); 
/* 		        InitalContext ctx = new InitialContext();
				Datasource ds = (DataSource) ctx.lookup("jdbc/lut2");
		        Connection con = ds.getConnection(); */
		        Statement st = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
		        ps = con.prepareStatement("INSERT INTO user_reviews(school_id, name, review) VALUES (?, ?, ?)");
/* String queryString = "INSERT INTO user_reviews(school_id, name, review) VALUES (?, ?, ?)";
 */
/* System.out.println("queryString: "+ queryString);
pstatement = connection.prepareStatement(queryString); */
ps.setString(1, school_id);
ps.setString(2, name);
ps.setString(3, review);
/* pstatement.executeUpdate(); */
int result = ps.executeUpdate();
          }
	catch (Exception ex) {
       out.println("Unable to connect to database.");
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

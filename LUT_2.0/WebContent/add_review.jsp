<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext" %>
	
<%
String school_id = request.getParameter("school_id");
String name = request.getParameter("name");
String review = request.getParameter("review");

//check if the boxes are empty.
if(name!=null && review!=null){
	  if(name!="" && review!="") {
    		    InitialContext ctx = new InitialContext();
    		    DataSource ds = (DataSource) ctx.lookup("jdbc/lut2");
    		    Connection connection = ds.getConnection();
    		    if (connection == null)
    		    {
    		   	 throw new SQLException("Error establishing connection!");
    		    }
    		    		
				String query = "INSERT INTO user_reviews(school_id, user_id, review) VALUES (?, ?, ?)";
				PreparedStatement ps = connection.prepareStatement(query);
				ps.setString(1, school_id);
				ps.setString(2, name);
				ps.setString(3, review);

				ps.executeUpdate();
				
				connection.close();
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

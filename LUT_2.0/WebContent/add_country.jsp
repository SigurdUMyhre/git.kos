<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext" %>

<%
String short_name = request.getParameter("short_name");
String full_name = request.getParameter("full_name");

//check if the boxes are empty.
if(short_name!=null && full_name!=null){
	  if(short_name!="" && full_name!="") {
    		    InitialContext ctx = new InitialContext();
    		    DataSource ds = (DataSource) ctx.lookup("jdbc/lut2");
    		    Connection connection = ds.getConnection();
    		    if (connection == null)
    		    {
    		   	 throw new SQLException("Error establishing connection!");
    		    }
    		    		
				String query = "INSERT INTO country(short_name, full_name) VALUES (?, ?)";
				PreparedStatement ps = connection.prepareStatement(query);
				ps.setString(1, short_name);
				ps.setString(2, full_name);

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
        <meta http-equiv="refresh" content="5;url=adminindex.jsp"> 
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>Country registrated!</title>
    </head>
    <body>
        <h1>Thanks ${param.name}!</h1>
        Your contribution is appreciated.<br>
        You will be redirected to the LUT2.0 main page in a few seconds.
    </tr>
</body>
</html>

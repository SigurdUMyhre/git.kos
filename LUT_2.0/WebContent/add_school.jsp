<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext" %>


<%-- <sql:query var="countr" dataSource="jdbc/lut2">
	SELECT short_name FROM country
	WHERE full_name = ? <sql:param value="${param.country}"/>
</sql:query>

<c:set var="countryID" value="${countr.rows[0]}"/> --%>

<%
String name= (String) session.getAttribute("name"); 
String full_name = request.getParameter("full_name");
String short_name = request.getParameter("short_name");
String place = request.getParameter("place");
String zip = request.getParameter("zip");
String country = request.getParameter("country");
String countryID = "XX";

System.out.println("alle parametere: " + full_name + " , " + short_name + " , " + place + " , " + zip + " , " + countryID);
//check if the boxes are empty.
if (full_name!=null && short_name!=null){
	  if(full_name!="" && short_name!="") {
     		    InitialContext ctx = new InitialContext();
    		    DataSource ds = (DataSource) ctx.lookup("jdbc/lut2");
    		    Connection connection = ds.getConnection();
				String query = "INSERT INTO school(full_name, short_name, place, zip, country) VALUES (?, ?, ?, ?, ?)";
				PreparedStatement ps = connection.prepareStatement(query);
				ps.setString(1, full_name);
				ps.setString(2, short_name);
				ps.setString(3, place);
				ps.setString(4, zip);
				ps.setString(5, countryID);
				ps.executeUpdate();
				connection.close(); 
 	}
}
%>




<%-- String con = getAttribute("countryID"); --%>

<%-- <sql:transaction dataSource="jdbc/lut2">
    <sql:update var="count">
        INSERT INTO school(full_name, short_name, place, zip, country)
         VALUES ('${param.full_name}', '${param.short_name}', '${param.place}', 
         '${param.zip}', '${countryID.short_name}');
    </sql:update>
</sql:transaction> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="5;url=adminindex.jsp"> 
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>School registrated!</title>
    </head>
    <body>
        <h1>Thanks <%=name %></h1>
        Your contribution is appreciated.<br>
        You will be redirected to the LUT2.0 main page in a few seconds.
</body>
</html>

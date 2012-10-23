<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
String name=(String) session.getAttribute("name"); 
%>


<sql:query var="countr" dataSource="jdbc/lut2">
	SELECT short_name FROM country
	WHERE full_name = ? <sql:param value="${param.country}"/>
</sql:query>

<c:set var="countryID" value="${countr.rows[0]}"/>

<%-- String con = getAttribute("countryID"); --%>

<sql:transaction dataSource="jdbc/lut2">
    <sql:update var="count">
        INSERT INTO school(full_name, short_name, place, zip, country)
         VALUES ('${param.full_name}', '${param.short_name}', '${param.place}', 
         '${param.zip}', '${countryID.short_name}');
    </sql:update>
</sql:transaction>
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

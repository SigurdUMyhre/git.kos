<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="country" dataSource="jdbc/lut2">
    SELECT full_name FROM country
</sql:query>

<% 
 
 int role = (Integer) session.getAttribute("role"); 
	
 
 if (role == 2){
		response.sendRedirect("fail.jsp"); 
 }		

%> 

<% 
String name=(String) session.getAttribute("name"); 
%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>LUT 2.0 - Help Students Conquer the World</title>
    </head>
    <body>
    <p align=right> Logged in as <%=name %> </p>
    <p align=right> <a href='logout.jsp'><font size="3">Log out</font></a></p>
      <p align=right> <a href='changepwd.jsp'><font size="3">Change password</font></a></p>
   
        <h1>Hi!</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>LUT 2.0 provides information about approved international schools</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>To view information about schools in a country, please select a country below:</td>
                </tr>
                <tr>
                    <td><form action="schools.jsp">
                            <strong>Select a country:</strong>
                            <select name="country">
                                <c:forEach var="row" items="${country.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select>
                            <input type="submit" value="submit" />
                        </form></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>

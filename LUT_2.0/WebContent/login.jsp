<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
String name=request.getParameter("username"); 
session.setAttribute("name",name); 
%>

<sql:query var="users" dataSource="jdbc/lut2">
    SELECT * FROM admin_users
    WHERE  uname = ? <sql:param value="${param.username}" /> 
    AND pw = ${param.password}
</sql:query>

<sql:query var="adminusers" dataSource="jdbc/lut2">
    SELECT * FROM admin_users
    WHERE  uname = ? <sql:param value="${param.username}" /> 
    AND admin = 1
</sql:query>
    
<c:set var="userDetails" value="${users.rows[0]}"/>
<c:set var="adminuserDetails" value="${adminusers.rows[0]}"/>

<%--Nå SKAL det funke!! --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>LUT Login</title>
    </head>
    <body>
    <c:choose>
    <c:when test = "${param.number==4}" >
    	<c:choose>
			<c:when test="${ empty userDetails }">
                Login failed
            </c:when>
            <c:otherwise>
            	<c:choose>
           			<c:when test="${ empty adminuserDetails }">
            			<c:redirect url="userindex.jsp" />
            		</c:when>
            		<c:otherwise>
            			<c:redirect url="adminindex.jsp" />
            		</c:otherwise>
            	</c:choose>
            </c:otherwise>
        </c:choose>
	</c:when>
	<c:otherwise>
        Login failed
	</c:otherwise>
	</c:choose>
	</body>
    </html>

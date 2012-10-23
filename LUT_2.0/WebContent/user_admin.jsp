<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="users" dataSource="jdbc/lut2">
    SELECT * FROM admin_users
    WHERE  uname = ? <sql:param value="${param.email}" /> 
    AND firstname = ? <sql:param value="${param.firstname}" /> 
    AND lastname = ? <sql:param value="${param.lastname}" /> 
</sql:query>

<sql:query var="adminusers" dataSource="jdbc/lut2">
    SELECT * FROM admin_users
    WHERE  uname = ? <sql:param value="${param.email}" /> 
    AND admin = 1
</sql:query>
    
<c:set var="userDetails" value="${users.rows[0]}"/>
<c:set var="adminuserDetails" value="${adminusers.rows[0]}"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make user admin</title>
</head>
<body>

<c:choose>
			<c:when test="${ empty userDetails }">
                There is no such user.
                <meta http-equiv="refresh" content="5;url=manage_users.jsp">
            </c:when>
            <c:otherwise>
            	<c:choose>
           			<c:when test="${ empty adminuserDetails }">
            			<sql:transaction dataSource="jdbc/lut2">
    						<sql:update var="count">
        						UPDATE admin_users
         						SET admin=1
         						WHERE firstname = ? <sql:param value="${param.firstname}" /> 
    							AND firstname = ? <sql:param value="${param.lastname}" /> 
    							AND uname = ? <sql:param value="${param.email}" /> 
   							 </sql:update>
						</sql:transaction>
						This is now an admin user.
						<meta http-equiv="refresh" content="5;url=manage_users.jsp">
               		</c:when>
            		<c:otherwise>
            			This is an admin user.
            			<meta http-equiv="refresh" content="5;url=manage_users.jsp">
            		</c:otherwise>
            	</c:choose>
            </c:otherwise>
        </c:choose>

</body>
</html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<% 
String name=(String) session.getAttribute("name"); 
%> 

<sql:query var="users" dataSource="jdbc/lut2">
    SELECT * FROM admin_users
    WHERE  uname = ? <sql:param value="${param.email}" /> 
    AND pw= ? <sql:param value="${param.oldpwd}" /> 
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
<link rel="stylesheet" type="text/css" href="lutstyle.css">
<title>Change password</title>
</head>
<body>


<c:choose>
	<c:when test="${ empty userDetails }">
           Wrong password and/or email!
           <meta http-equiv="refresh" content="5;url=changepwd.jsp">
    </c:when>
    <c:otherwise>
           		<sql:transaction dataSource="jdbc/lut2">
    				<sql:update var="count">
        						UPDATE admin_users
         						SET pw = ${param.oldpwd}
         						WHERE pw = ? <sql:param value="${param.oldpwd}" /> 
    							AND uname = ? <sql:param value="${param.email}" /> 
   					 </sql:update>
				</sql:transaction>
					Your password has changed.
   	</c:otherwise>
   	<%-- 
         <c:choose>
			<c:when test="${ empty adminuserDetails }">
            			<meta http-equiv="refresh" content="5;url=userindex.jsp">
            </c:when>
            <c:otherwise>
           			 <meta http-equiv="refresh" content="5;url=adminindex.jsp">
            </c:otherwise>
         </c:choose>
   	--%>
</c:choose>
</body>
</html>
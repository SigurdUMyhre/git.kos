<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<sql:query var="user" dataSource="jdbc/lut2">
	SELECT * from admin_users
	WHERE uname = ? <sql:param value="${param.email}"/> 
</sql:query>

<c:set var="userDetails" value = "${user.rows[0]}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="lutstyle.css">
<title>Add user</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty userDetails }">
			<sql:transaction dataSource="jdbc/lut2">
				<sql:update var="count">
        			INSERT INTO admin_users VALUES ('${param.email}', '${param.password1}', '${param.firstname}', '${param.lastname}');
   				 </sql:update>
			</sql:transaction>
			<h1>Congratulations!</h1>
				<p>You have been added to the database</p>
				<p>Click <a href="lutadmin.jsp">here</a> to go to the login page.</p>
		</c:when>
		<c:otherwise>
			<h1>Sorry!</h1>
				<p>The username you entered is already taken.</p>
				<p>Click <a href="register_user.jsp">here</a> if you want to try again.</p>
		</c:otherwise>
	</c:choose>

</body>
</html>
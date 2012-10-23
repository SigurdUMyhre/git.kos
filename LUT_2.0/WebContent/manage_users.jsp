<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="users" dataSource="jdbc/lut2">
    SELECT * FROM admin_users
</sql:query>

<%--<c:set var="userEmail" value="${users.rows[0].uname}"/>
<c:set var="userFirstname" value="${users.first_name}"/>
<c:set var="userLastname" value="${users.last_name}"/>
<c:set var="userAdmin" value="${users.admin}"/>
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
<title>User management</title>
</head>
<body>
<h1>User Management</h1>

	<table>
		<thead>
			<tr>
				<th>Make user admin</th>
			</tr>
		<thead>
		<tbody>
			<tr>
				<td>
					<form action="user_admin.jsp" method="post">
						<p>
							First name: <input type="text" name="firstname" size="20">
						</p>
						<p>
							Last name: <input type="text" name="lastname" size="20">
						</p>
						<p>
							Email address: <input type="text" name="email" size="20">
						</p>
						<p>
							<input type="submit" value="Submit"><input type="reset" value="Reset">
						</p>
					</form>
				</td>
			</tr>
		</tbody>
	</table>

<table>
		<thead>
			<tr>
				<th>Delete user</th>
			</tr>
		<thead>
		<tbody>
			<tr>
				<td>
					<form action="user_delete.jsp" method="post">
						<p>
							First name: <input type="text" name="firstname" size="20">
						</p>
						<p>
							Last name: <input type="text" name="lastname" size="20">
						</p>
						<p>
							Email address: <input type="text" name="email" size="20">
						</p>
						<p>
							<input type="submit" value="Submit"><input type="reset" value="Reset">
						</p>
					</form>
				</td>
			</tr>
		</tbody>
	</table>

<table>
		<thead>
			<tr>
				<th>New user</th>
			</tr>
		<thead>
		<tbody>
			<tr>
				<td>
					<a href="register_user.jsp">Create a new user</a>
				</td>
			</tr>
		</tbody>
	</table>
	
<%-- Name:	${userFirstname[1]}				Email:				Admin:
        <!-- looping through all available reviews - if there are any -->
	<c:forEach var="userDetails" items="${userDetails.rowsByIndex}">
		Name: ${userDetails[4]}
        <c:out value="${userDetails.first_name}" /><br>
        <c:out value="${userDetails[4]}" /><br>
        Email: 
        <c:out value="${userDetails[1]}" /><br>
        Admin: 
        <c:out value="${userDetails[5]}" /><br>
        <br><br>
     </c:forEach>
--%>


</body>
</html>
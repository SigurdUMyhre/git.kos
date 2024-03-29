<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="users" dataSource="jdbc/lut2">
    SELECT * FROM admin_users
</sql:query>

<% 
String name = (String) session.getAttribute("name"); 



int role = (Integer) session.getAttribute("role"); 

if (role == 0){
		response.sendRedirect("url_fail.jsp");
}		

%> 


<%--<c:set var="userEmail" value="${users.rows[0].uname}"/>
<c:set var="userFirstname" value="${users.first_name}"/>
<c:set var="userLastname" value="${users.last_name}"/>
<c:set var="userAdmin" value="${users.admin}"/>
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="lutstyle.css">

<title>User management</title>
</head>
<body>
	 <script language="javascript">
	 	
	 	function ValidateAdminForm(){
	 		var firstname = document.makeuseradmin.firstname.value.trim();
	 		var lastname = document.makeuseradmin.lastname.value.trim();
	 		var lastname = document.makeuseradmin.email.value.trim();
	 		if (ValidateString(firstname) == false || ValidateString(lastname) == false || ValidateString(email) == false){
	 			return false;
	 		}
	 		else {
	 			return false;
	 		}
	 	}
	 	
	 	function ValidateDeleteForm(){
	 		var firstname2 = document.deleteuser.firstname.value.trim();
	 		var lastname2 = document.deleteuser.lastname.value.trim();
	 		var lastname2 = document.deleteuser.email.value.trim();
	 		if (ValidateString(firstname2) == false || ValidateString(lastname2) == false || ValidateString(email2) == false){
	 			return false;
	 		}
	 		else {
	 			return false;
	 		}
	 	}
	 	
		function ValidateString(string){
	 		//var validate = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789;
		   	if (! /^[a-zA-Z0-9@.]+$/.test(string)) {
		 		alert ("You have entered illegal characters or you have not entered anything in every field");
	    		return false;
			}
		    else {
		    	return true;
		    }
		}
	 </script>
 <p align=right> Logged in as <%=name %> </p>
 <p align=right> <a href='logout.jsp'><font size="3">Log out</font></a></p>
 <p align=right> <a href='changepwd.jsp'><font size="3">Change password</font></a></p>

<h1>User Management</h1>


<%--	
	<c:set var="review" value="${users.rows[0]}"/>
	<c:choose>
		<c:when test="${ empty review }">
			<p>Currently no users in the database<p>
			<br><br>
		</c:when>
		<c:otherwise>
			<c:forEach var="review" items="${users.rowsByIndex}">
                    <c:out value="${users[1]}" /><br>
                    <i>${users[1]}</i>
                    <br><br>
                </c:forEach>
		</c:otherwise>
	</c:choose>
 --%>

	<table>
		<thead>
			<tr>
				<th>Make user admin</th>
			</tr>
		<thead>
		<tbody>
			<tr>
				<td>
					<form action="user_admin.jsp" method="post" name="makeuseradmin" onsubmit="return ValidateAdminForm()">
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
					<form action="user_delete.jsp" method="post" name="deleteuser" onsubmit="return ValidateDeleteForm()">
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


</body>
</html>
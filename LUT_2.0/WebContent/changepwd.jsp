
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Change your password</h1>
	<table>
		<thead>
			<tr>
				<th>New password</th>
			</tr>
		<thead>
		<tbody>
			<tr>
				<td>
					<form action="change_pwd.jsp" method="post">
						<p>
							Old password: <input type="password" name="oldpwd" size="20">
						</p>
						<p>
							New password: <input type="password" name="newpwd" size="20">
						</p>
						<p>
							Retype new password: <input type="password" name="newpwd" size="20">
						</p>
						
						<p>
							<input type="submit" value="submit"><input type="reset">
						</p>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
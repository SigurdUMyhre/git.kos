
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
<title>Change password</title>
</head>
<body>
<script language="javascript">
	
	/* Validates that the two password strings are equal. The must must also contain more than 3 characters, but no more than 20. */
	function ValidatePassword(){
		var email = document.pwform.email.value;
		var oldpwd = document.pwform.oldpwd.value;
		var pw1 = document.pwform.newpwd.value;
		var pw2 = document.pwform.renewpwd.value;
		if (email.length < 1){
			alert("You must enter your email address");
			return false;
		}
		if (oldpwd.length < 1){
			alert("You must enter your old password");
			return false;
		}
		
		if (pw1.length < 4){
			alert("The password must contain more than 3 characters");
			return false;
		}
		if (pw1.length > 20 ){
			alert("The password cannot be longer than 20 characters");
			return false;
		}
		if (pw1.length != pw2.length){
			alert("The passwords must be equal");
			return false;
		}
		for (var i = 0; i < pw1.length; i++){
			if (pw1[i] != pw2[i]){
				alert("The passwords must be equal");
				return false;
			}
		}
		return true;
		
	}
</script>

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
					<form name="pwform" action="change_pwd.jsp" method="post" onsubmit="return ValidatePassword()">
						<p>
							Email: <input type="text" name="email" size="20">
						</p>
						<p>
							Old password: <input type="password" name="oldpwd" size="20">
						</p>
						<p>
							New password: <input type="password" name="newpwd" size="20">
						</p>
						<p>
							Retype new password: <input type="password" name="renewpwd" size="20">
						</p>
						<p>
							<input type="submit" value="Submit"><input type="reset" value = "Reset">
						</p>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
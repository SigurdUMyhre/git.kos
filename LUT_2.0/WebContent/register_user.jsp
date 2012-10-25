<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.applet.Applet" %>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="lutstyle.css">
<title>Register new user</title>
</head>
<body>

<%--  
<applet id="app"
code ="Hashing"></applet> 
--%>

<script language = "javascript">
/* This is code to check valid email using java script. */
/*The emailCheck(str) and ValidateEmailField is taken and adopted form: http://www.roseindia.net/jsp/valid-email-jsp.shtml*/
		function emailCheck(str) {
                var at="@"
                var dot="."
                var lat=str.indexOf(at)
                var lstr=str.length
                var ldot=str.indexOf(dot)
       			 // check if '@' is at the first position or at last position or absent in given email 
                if (str.indexOf(at)==-1 || str.indexOf(at)==0 ||
                str.indexOf(at)==lstr){
                   alert("Invalid E-mail ID")
                   return false
                }
                // check if '.' is at the first position or at last position or absent in given email
                if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 ||
                str.indexOf(dot)==lstr){
                    alert("Invalid E-mail ID")
                    return false
                }
                // check if '@' is used more than one times in given email
                if (str.indexOf(at,(lat+1))!=-1){
                    alert("Invalid E-mail ID")
                    return false
           		}
           		// check for the position of '.'
                if (str.substring(lat-1,lat)==dot || 
                str.substring(lat+1,lat+2)==dot){
                   alert("Invalid E-mail ID")
                   return false
                }
                // check if '.' is present after two characters from location of '@'
                if (str.indexOf(dot,(lat+2))==-1){
                    alert("Invalid E-mail ID")
                    return false
                }
                
              	// check for blank spaces in given email
             	if (str.indexOf(" ")!=-1){
          		    alert("Invalid E-mail ID")
                    return false
                }
                return true                                    
        }
		
		function ValidateEmailField(){
        	var emailID = document.myform.email;
        	if ((emailID.value==null)||(emailID.value=="")){
                alert("Please Enter your Email ID")
                emailID.focus();
                return false;
    		}
        	if (emailCheck(emailID.value)==false){
                emailID.value="";
                emailID.focus()
                return false
        	}
        	else{
	          	return true
        	}
 		}
		
		function ValidateEmail() { 
			var email = document.myform.email.value.trim();
			var atpos= email.indexOf("@");
			var dotpos=email.lastIndexOf(".");
			if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {
				alert("Not a valid e-mail address!");
				return false;
			}
			else {
				alert("Returnerer true");
				return true;
			}
		}  
		
		/* Validates that the two password strings are equal. The must must also contain more than 3 characters, but no more than 20. */
		function ValidatePassword(){
			var pw1 = document.myform.password1.value.trim();
			var pw2 = document.myform.password2.value.trim();
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

		/* Validate That there are text in the firstname field and the lastname fiels */
		function ValidateNameFields(){
			var firstname = document.myform.firstname.value.trim();
			var lastname = document.myform.lastname.value.trim();
			if (firstname.length <= 0 || lastname.length <= 0){
				alert("You must enter a firstname and a lastname");
				document.myform.firstname.focus();
				return false;
			}
			else {
				return true;
			}
		}
		
		/* Runs all the validation methods to ensure that the form is filled out correctly */
		
	
		
		function ValidateForm(){
			
			
			
			if (ValidateNameFields() == false){
				return false;
			}
			else if (ValidateEmailField() == false){
				return false;
			}
			else if(ValidatePassword() == false){
				return false;
			}
			
			
			 
			else {
				
				var pwd = document.myform.password1.value; 
				  // var ran=document.loginForm.ran.value; 
				   var hash = hex_md5(pwd);   // MD5 Hash of user input password  
				   alert(hash);
				   console.log('bjarne')
				 //  var saltedhash=hex_md5(hash+ran);  // Added with salt and the MD5 hash
				   document.myform.password1.value = "itChanged";  // sent to the server 
				<%-- var hashedPwd = app.generateHash(document.myform.password1.value);
				document.myform.password1.value = hashedPwd; --%>
				return true;
			}
			
		}
</script>

<h1>Register as a new user</h1>
	<table>
		<thead>
			<tr>
				<th>New user</th>
			</tr>
		<thead>
		<tbody>
			<tr>
				<td>
					<form name="myform" action="add_user.jsp" method="post" onsubmit="return ValidateForm()">
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
							Password: <input type="password" name="password1" size="20">
						</p>
						<p>
							Retype password: <input type="password" name="password2" size="20">
						</p>
						<p>
							<input type="submit" value="Submit"><input type="reset">
						</p>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
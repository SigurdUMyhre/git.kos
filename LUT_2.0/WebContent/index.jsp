

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>LUTAdmin</title>
    </head>
    <body>
    	
    	<script language="javascript">
	    	function ValidateForm(){
	    		var uname = document.myform.username.value.trim();
	    		var pw = document.myform.password.value.trim();
	    		var ans = document.myform.number.value.trim();
	    		
	    		if (ValidateString(uname)==false || ValidateString(pw) == false || ValidateString(ans) == false){
	    			return false;
	    		}
	    		if (uname.length < 1){
	    			alert("You have to enter a username")
	    			document.myform.username.focus();
	    			return false;
	    		}
	    		else if (pw.length < 1){
	    			alert("You must enter a password");
	    			document.myform.password.focus();
	    			return false;
	    		}
	    		else if (ans.length < 1){
	    			alert("You must enter the rigth number");
	    			document.myform.number.focus();
	    			return false;
	    		}
	    	}
	    	
	    	function ValidateString(string){
	    		//var validate = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789;
	    		if (! /^[a-zA-Z0-9@.]+$/.test(string)) {
	    			alert ("You have either not entered anything, or you have entered illegal characters");
    				return false;
				}
	    		else {
	    			return true;
	    		}
	    	}
    	</script>
        
        <h1>Welcome to LUT!</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>Log in</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><form name="myform" method="post" action="login.jsp" onsubmit="return ValidateForm()">
                            <p>
                                Username:<input type="text" name="username" size="20"></p>
                            <p>
                                Password:<input type="password" name="password" size="20"></p>
                            <p>
                            	Hva blir dette? <img src="expression.png" width="100" height="35" alt="Expression"><input type= "text" name="number" size="2"></p>
                            <p><input type="submit" value="submit" name="login"></p>
                       
                        </form></td>
                </tr>
                <tr><td> <a href="register_user.jsp">Create a new user</a></td></tr>
            </tbody>
        </table>
    </body>
</html>

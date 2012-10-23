

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>LUTAdmin</title>
    </head>
    <body>
        <h1>Welcome to LUT!</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>Log in</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><form method="post" action="login.jsp">

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

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="javax.crypto.spec.DESKeySpec" %>
<%@page import="javax.crypto.SecretKeyFactory" %>
<%@page import="javax.crypto.SecretKey" %>
<%@page import="sun.misc.BASE64Encoder" %>
<%@page import="javax.crypto.Cipher" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"%>




<%
DESKeySpec keySpec = new DESKeySpec("YourSecr".getBytes("UTF8")); 
SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
SecretKey key = keyFactory.generateSecret(keySpec);
sun.misc.BASE64Encoder base64encoder = new BASE64Encoder();


String name = request.getParameter("username"); 
session.setAttribute("name",name); 

String uname = request.getParameter("username");

String plainTextPassword = request.getParameter("password");
byte[] cleartext = plainTextPassword.getBytes("UTF8");      

Cipher cipher = Cipher.getInstance("DES"); // cipher is not thread safe
cipher.init(Cipher.ENCRYPT_MODE, key);
String encryptedPassword = base64encoder.encode(cipher.doFinal(cleartext));


InitialContext ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup("jdbc/lut2");
Connection connection = ds.getConnection();
if (connection == null)
{
throw new SQLException("Error establishing connection!");
}
String query = "SELECT * FROM admin_users WHERE  uname = ?  AND pw = ?";

// String query = "INSERT INTO admin_users VALUES (?, ?, ?, ?, ?)";
PreparedStatement statement = connection.prepareStatement(query);
statement.setString(1, uname);
statement.setString(2, encryptedPassword);

ResultSet queryResult = statement.executeQuery();

connection.close();


queryResult.beforeFirst();

String foundType;

if (queryResult.next()){
	   foundType = queryResult.getString(1);

	  	if (foundType.contains("1") ) {
			response.sendRedirect("userindex.jsp");
		}

		else if (foundType != null ) {
			response.sendRedirect("adminindex.jsp");
		}
}





else {
	response.sendRedirect("url_fail.jsp");
}





%>
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
<link rel="stylesheet" type="text/css" href="lutstyle.css">
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
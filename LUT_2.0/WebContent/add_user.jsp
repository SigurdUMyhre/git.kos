<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.crypto.spec.DESKeySpec" %>
<%@page import="javax.crypto.SecretKeyFactory" %>
<%@page import="javax.crypto.SecretKey" %>
<%@page import="sun.misc.BASE64Encoder" %>
<%@page import="javax.crypto.Cipher" %>


<% DESKeySpec keySpec = new DESKeySpec("YourSecr".getBytes("UTF8")); 
SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
SecretKey key = keyFactory.generateSecret(keySpec);
sun.misc.BASE64Encoder base64encoder = new BASE64Encoder();


//ENCODE plainTextPassword String
     

//DECODE encryptedPwd String  %>

<%

String plainTextPassword = request.getParameter("password1");
byte[] cleartext = plainTextPassword.getBytes("UTF8");      

Cipher cipher = Cipher.getInstance("DES"); // cipher is not thread safe
cipher.init(Cipher.ENCRYPT_MODE, key);
String password = base64encoder.encode(cipher.doFinal(cleartext));

String uname = request.getParameter("email");
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");

InitialContext ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup("jdbc/lut2");
Connection connection = ds.getConnection();
if (connection == null)
{
throw new SQLException("Error establishing connection!");
}
String query = "INSERT INTO admin_users VALUES (?, ?, ?, ?, ?)";
PreparedStatement statement = connection.prepareStatement(query);
statement.setString(1, uname);
statement.setString(2, password);
statement.setString(3, firstname);
statement.setString(4, lastname);
statement.setInt(5, 0);

statement.executeUpdate();

/*
try {
statement.executeUpdate();
}
catch(Exception e){
response.sendRedirect("index.jsp");
}
*/

connection.close();
%>
 
 
<sql:query var="user" dataSource="jdbc/lut2">
	SELECT * from admin_users
	WHERE uname = ? <sql:param value="${param.email}"/> 
</sql:query>



	<c:choose>
		<c:when test="${empty userDetails }">
		<%-- 
			<sql:transaction dataSource="jdbc/lut2">
				<sql:update var="count">
        			<%  %> ;
        			
        			INSERT INTO admin_users VALUES ('${param.email}', '${param.password1}', '${param.firstname}', '${param.lastname}', '0'); 
   				 </sql:update>
			</sql:transaction> --%>
			<h1>Congratulations!</h1>
				<p>Your user has been added to the database</p>
				<%	session.invalidate();%>
				<p>Click <a href="index.jsp">here</a> to go to the login page.</p>
		</c:when>
		<c:otherwise>
			<h1>Sorry!</h1>
				<p>The username you entered is already taken.</p>
				<p>Click <a href="register_user.jsp">here</a> if you want to try again.</p>
		</c:otherwise>
	</c:choose>

</body>
</html>
package test


public class HAsging extends Applet { 
	
}

String encryptedPassword = request.getParameter("password1") ;
 
Statement stmt = null ;

String strQuery = "INSERT INTO admin_users VALUES ('${param.email}'," + encryptedPassword + ",  '${param.firstname}', '${param.lastname}', '0');";


stmt = conn.createStatement(strQuery);
String rs = stmt.executeQuery(strQuery);

system.out.Println
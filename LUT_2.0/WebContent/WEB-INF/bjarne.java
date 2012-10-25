package test

import javax.crypto.spec.DESKeySpec;
javax.crypto.SecretKeyFactory
sun.misc.BASE64Decoder
javax.crypto.Cipher
%>

public class HAsging extends Applet { 
	
}

String encryptedPassword = request.getParameter("password1") ;
 
Statement stmt = null ;

String strQuery = "INSERT INTO admin_users VALUES ('${param.email}'," + encryptedPassword + ",  '${param.firstname}', '${param.lastname}', '0');";


stmt = conn.createStatement(strQuery);
String rs = stmt.executeQuery(strQuery);

//only the first 8 Bytes of the constructor argument are used 
//as material for generating the keySpec
DESKeySpec keySpec = new DESKeySpec("YourSecr".getBytes("UTF8")); 
SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
SecretKey key = keyFactory.generateSecret(keySpec);
sun.misc.BASE64Encoder base64encoder = new BASE64Encoder();
sun.misc.BASE64Decoder base64decoder = new BASE64Decoder();
.........

//ENCODE plainTextPassword String
byte[] cleartext = plainTextPassword.getBytes("UTF8");      

Cipher cipher = Cipher.getInstance("DES"); // cipher is not thread safe
cipher.init(Cipher.ENCRYPT_MODE, key);
String encrypedPwd = base64encoder.encode(cipher.doFinal(cleartext));
//now you can store it 
......

//DECODE encryptedPwd String
HUSK DENNE: sun.misc.BASE64Decoder base64decoder = new BASE64Decoder();


byte[] encrypedPwdBytes = base64decoder.decodeBuffer(encryptedPwd);

Cipher cipher = Cipher.getInstance("DES");// cipher is not thread safe
cipher.init(Cipher.DECRYPT_MODE, key);
byte[] plainTextPwdBytes = (cipher.doFinal(encrypedPwdBytes));
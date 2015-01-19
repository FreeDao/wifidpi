import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import sun.misc.BASE64Decoder;

import java.net.URLDecoder;
import java.security.Key;
import java.security.SecureRandom;
public class EC {
	public static void main(String[] args) throws Exception{
		String input="JQGFsYoKBmFj9Pv5QbAfGGDnq+1lSyLxOo3yuaYiDqQvbPQcOgGTi7kzp8hhNThaGWTX2RKKhMex\n2ghT3g5jdpnDiLLINA3HxVxQu3+ClEhu+JtnadnmLUc8jjXfRTxNCw8qc8ulg2UzYjv9hlwVUKAF\nAhSdyZZH/rtmS1YFupYZiipMSx423Ycpu7QhOkOmslOR2GulqhdPJugrR4QPWwk5UDiwx8EAMQpV\nOw90+xgt/YVvdHWha+9z73amgNyTPe6scquSYqP0hBJ7y8euhwhwri1bewTEux+MQ02QrgynGVtI\nr1sBD21VAyY7Vz9NU12iTeehN5KnuorcPbHhYfXkoGhws03Le5m0Ig7Z6Ad2HaMyUoKnnnVKR/6V\nPCvN0YWpR1z6q+dxdWphl5LoFSA1sE2SuaqokBQW7MCgLlw=\n";
		String output = URLDecoder.decode(input); 
		byte[] bsp =Base64.decode(input);
		byte[] bsp2 = new BASE64Decoder().decodeBuffer(input);
		byte[] plainText="hello word".getBytes("UTF8");     
		//通过KeyGenerator形成一个key    
		System.out.println("\nStart generate AES key");    
		String key1 = "1234567812345678";
		KeyGenerator keyGen=KeyGenerator.getInstance("AES");  
		keyGen.init(128,new SecureRandom(key1.getBytes()));    
		SecretKey  secretKey=keyGen.generateKey(); 
		System.out.println(key1.toString());
		byte[] enCodeFormat = secretKey.getEncoded();
		//String s3 = new BASE64Decoder().decodeBuffer(arg0)(enCodeFormat);
		String s2 = new sun.misc.BASE64Encoder().encode(enCodeFormat);
		byte[] bs3 = new BASE64Decoder().decodeBuffer(s2);
		System.out.println(s2);
		System.out.println(s2.getBytes());
		byte[] bs4=s2.getBytes();
		SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
		//SecretKeySpec key = new SecretKeySpec("770A8A65DA156D24EE2A093277530142".getBytes(), "AES");
		System.out.println(key);
		System.out.println("Finish generating DES key");     
		//获得一个私鈅加密类Cipher，ECB是加密方式，PKCS5Padding是填充方法    
		Cipher cipher=Cipher.getInstance("AES/ECB/PKCS5Padding");   
		System.out.println("\n"+cipher.getProvider().getInfo());     
		//使用私鈅加密    
		System.out.println("\nStart encryption:");   
		cipher.init(Cipher.ENCRYPT_MODE,key);    
		byte[] cipherText=cipher.doFinal(plainText);  
		String s = new sun.misc.BASE64Encoder().encode(cipherText);
		System.out.println(s);
		//String estr = Base64.encodeToString(cipherText, Base64.DEFAULT);
		System.out.println("Finish encryption:");    
		System.out.println(new String(cipherText,"UTF8"));     
		System.out.println("\nStart decryption:");  
		cipher.init(Cipher.DECRYPT_MODE,key);   
		byte[] newPlainText=cipher.doFinal(cipherText);   
		byte[] newPlainText2=cipher.doFinal(bsp);   
		System.out.println("Finish decryption:");     
		System.out.println(new String(newPlainText,"UTF8"));
		System.out.println(new String(newPlainText2,"UTF8"));
	}
}

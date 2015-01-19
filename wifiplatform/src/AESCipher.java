import java.net.URLDecoder;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;

import com.sun.org.apache.xml.internal.security.utils.Base64;

public class AESCipher {
	public static byte[] encrypt(String input, String key) throws Exception {
		byte[] crypted = null;
		SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "AES");
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, skey);
		crypted = cipher.doFinal(input.getBytes());
		return crypted;
	}
	
	public static byte[] decrypt(byte[] content, String key) throws Exception {
		byte[] output = null;
		SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "AES");
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.DECRYPT_MODE, skey);
		output = cipher.doFinal(content);
		return output;
	}
	public static void main(String args[]) {
		try {
			String key = "01234567890123456789012345678912";
			byte[] e = AESCipher.encrypt("hello word", key);
			String estr = Base64.encode(e);
			System.out.println("estr:"+estr);
			byte[] d = AESCipher.decrypt(e, key);
			String dstr = new String(d);
			System.out.println("dstr:"+dstr);
			String dt="+JOrkpnXha9LiPHr9Cz0bF2mXNggTZchkKCFx/3/JQls6sxxyrGRP7DSRyDuJVV0Efj3SoNNKXM5PiQPOiamoTZuYbP/MAC02ax1FMBIs+hfvwj3xLyd16Z6YjEIrfeEDzVTz7jxae4yy+Y2yxkUR/kZkRTo6s4UBI0PtuMly8SM2PdB5iAcVAtH3Ck/mUKZSBCeWmW2XxkrnYFMnZDOlAyMCManm/mHLMf75UcH9PXwbtYcakfLW6j9kYlNBUnL+Ib2eS8aArFD0cI+0hG+gKSoeU3iuBM7RuefzU16wZpJY9PoHCl7HpsTzhmFD4rIxgZuB4Vz0uha0gnToIdCdENo4hXdA0RRbDpERdnOKv/VtdmL2aNKX7LeSbs3Y16v0/qNnI1qa5tFr1JytrwXKXTL/dvWqLqr8sQbkfhWXvs=";
			//String output = URLDecoder.decode(dt); 
			byte[] bsp =Base64.decode(dt);
			byte[] d1 = AESCipher.decrypt(bsp, key);
			System.out.println("dstr:"+new String(d1));
		} catch (Exception e) {
			/**java平台注意：
			 * http://blog.sina.com.cn/s/blog_4c03369c0101oc4l.html
			 * @param args
			 */
			e.printStackTrace();
		}
	}
}

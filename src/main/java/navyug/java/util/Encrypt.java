package navyug.java.util;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class Encrypt {
	public static String encode(String value) throws UnsupportedEncodingException {
		Base64.Encoder e=Base64.getEncoder();
		return e.encodeToString(value.getBytes("utf-8"));
	}
	public static String decode(String value) throws  UnsupportedEncodingException {
		byte[] b = Base64.getMimeDecoder().decode(value);
		return new String(b,"utf-8");
	}
//	public static void main(String[] args) throws UnsupportedEncodingException {
//		System.out.println(decode("YWJDQDEyMzQ="));
//	}
}

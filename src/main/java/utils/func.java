/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.binary.Base64;

/**
 *
 * @author DTP000
 */
public class func {

//    /**
//    * Create MD5
//    * Hàm tạo ra mã MD5
//    * 
//    * @param md5 string Truyền vào chuỗi cần chuyển sang md5
//    * @return String trả về mã md5 được tạo ra từ chuỗi
//    * https://stackoverflow.com/questions/415953/how-can-i-generate-an-md5-hash-in-java
//    */
//    public static String MD5(String md5) {
//        try {
//            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
//            byte[] array = md.digest(md5.getBytes());
//            StringBuilder sb = new StringBuilder();
//            for (int i = 0; i < array.length; ++i) {
//                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
//            }
//            return sb.toString();
//        } catch (java.security.NoSuchAlgorithmException e) {
//        
//        }
//        return null;
//    }

	public static String md5(String plainText) throws NoSuchAlgorithmException {
		return md5(null, plainText);
	}

	public static String md5(String salt, String plainText) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");

		if (salt != null) {
			md.update(salt.getBytes());
		}
		md.update(plainText.getBytes());

		byte byteData[] = md.digest();

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}

	/**
	 * check is email Hàm kiểm tra có phải email không
	 * https://mailtrap.io/blog/java-email-validation/
	 * 
	 * @param email
	 * 
	 * @return String return email if email or return null Trả về email nếu email
	 *         đúng hoặc null
	 */
	public static String isEmail(String email) {
		Pattern pattern = Pattern.compile(config.REGEX_MAIL);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches() ? email : null;
	}

	/**
	 * show log debbugger Hiển thị ra lỗi khi đang ở chế độ sửa lỗi
	 * 
	 * @param str string
	 * 
	 */
	public static void show(String str) {
		if (config.DEBUG) {
			System.out.println(str);
		}
	}

	/**
	 * generateUUID Hàm tạo ra UUID UUID là gì thì tra google nhé
	 * 
	 * @return String UUID
	 */
	public static String generateUUID() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}

	/**
	 * 
	 * @param minimum
	 * @param maximum
	 * @return int
	 */
	public static int randInt(int minimum, int maximum) {
		return minimum + (int) (Math.random() * maximum);
	}

	/**
	 * base64_encode Mã hoá base64
	 * 
	 * @param String Truyền vào chuỗi cần chuyển sang base64
	 * @return String trả về mã base64 được tạo ra từ chuỗi
	 *         https://www.baeldung.com/java-base64-encode-and-decode
	 */
	public static String base64_encode(String str) {
		Base64 base64 = new Base64();
		String encodedString = new String(base64.encode(str.getBytes()));
		return encodedString;
	}

	/**
	 * base64_decode Giải mã base64
	 * 
	 * @param String Truyền vào chuỗi base64 cần giải mã
	 * @return String trả về chuỗi base64 được giải mã
	 *         https://www.baeldung.com/java-base64-encode-and-decode
	 */
	public static String base64_decode(String str) {
		Base64 base64 = new Base64();
		String decodedString = new String(base64.decode(str.getBytes()));
		return decodedString;
	}

//	public static void main(String[] args) throws NoSuchAlgorithmException {
//		System.out.println(md5("1234"));
//	}
	
	public static String showPrice(double price) {
		DecimalFormat formatter = new DecimalFormat("###,###,###");
        return String.valueOf(formatter.format(price)+"").replaceAll(",", ".");
	}
	
//	public static void main(String[] args) {
//		System.out.println(showPrice(9999999999.0));
//	}
	
	public static boolean isNumeric(String strNum) {
	    if (strNum == null) {
	        return false;
	    }
	    try {
	        double d = Double.parseDouble(strNum);
	    } catch (NumberFormatException nfe) {
	        return false;
	    }
	    return true;
	}
}

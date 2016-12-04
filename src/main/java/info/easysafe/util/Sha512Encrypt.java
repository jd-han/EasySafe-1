package info.easysafe.util;


import java.security.MessageDigest;

/**
@class Sha512Encrypt
 @section 상세설명
 - SHA-512 단방향 암호화 모듈
*/
public class Sha512Encrypt {
	/**
	 @fn encrypt
	 @brief 함수 간략한 설명 : hash 값 추출
	 @remark
	 - 함수의 상세 설명 : hash 값 추출
	 @param plainText
	 @return 
	*/
	public static String hash(String plainText) {
		// one way 함수 집합
		String tempPassword = "";
		MessageDigest md = null;

		try {
			// SHA-256알고리즘 사용
			if (md == null)
				md = MessageDigest.getInstance("SHA-512");
				
			// 문자열로 받아들임
			md.update(plainText.getBytes("UTF-8"));

			byte[] mb = md.digest();
			for (int i = 0; i < mb.length; i++) {
				byte temp = mb[i];
				String s = Integer.toHexString(new Byte(temp));

				while (s.length() < 2) {
					s = "0" + s;
				}

				s = s.substring(s.length() - 2);
				tempPassword += s;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tempPassword;
	}

	/**
	 @fn match
	 @brief 함수 간략한 설명 : hashText 와  plainText 비교 메소드
	 @remark
	 - 함수의 상세 설명 : hashText 와  plainText 비교 메소드
	 @param plainText
	 @param hashText
	 @return 
	*/
	public static boolean match(String plainText, String hashText) {
		String tmpText = hash(plainText);
		
		return tmpText.equals(hashText);
	}
	
	public static void main(String[] args) {
		System.out.println(hash("aaaa"));
		
	}
}

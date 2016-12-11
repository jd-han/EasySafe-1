package info.easysafe.util;

import java.security.MessageDigest;
import java.util.Random;

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
		
		tempPassword = tempPassword.substring(0, 10);
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
	
	public static String genTempPass(){
		char[] tempAlpha = {'A','1','B','2','C','3','F','4','G','5','H','6','I','7','J','8','K','9','L','0','M'};
		Random r = new Random();
		String tempStr = ""; 
		for(int i = 0 ; i < 7 ; i++)
		{
			tempStr += tempAlpha[r.nextInt(tempAlpha.length)];
		}
		System.out.println("생성된 임시 비번 : " + tempStr);
		System.out.println("해시된 임시 비번 : " + hash(tempStr));
		return tempStr;
	}
	
	public static void main(String[] args) {
		System.out.println(hash("aaaa"));
		
	}
}

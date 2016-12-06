package info.easysafe.util;

import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class TokenUtil {
	public static String createJWT(String uid, String upw, String apiKey) {
		// 토큰 암호와 알고리즘 선택
		SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

		// 유효 기간 1주 >> 주 * 일 * 시간 * 분 * 초 * 1000
		long ttlMillis = 1 * 7 * 24 * 60 * 60 * 1000;
		System.out.println("ttlMillis : "+ ttlMillis);

		// 현재 날짜 추출
		long nowMillis = System.currentTimeMillis();
		Date now = new Date(nowMillis);

		// apiKey를 기준으로한 토큰 생성
		byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(apiKey);
		Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
		// 토큰 내부 설정(토큰 내 정보 저장)
		JwtBuilder builder = Jwts.builder().setId(uid).setIssuedAt(now).setSubject("EasySafe")
				.signWith(signatureAlgorithm, signingKey).claim("password", upw);

		// 유효시간 설정
		if (ttlMillis >= 0) {
			long expMillis = nowMillis + ttlMillis;
			Date exp = new Date(expMillis);
			builder.setExpiration(exp);
		}
	
		// Builds the JWT and serializes it to a compact, URL-safe string
		return builder.compact();
	}

	// 토큰 정보 확인
	public static Claims parseJWT(String token, String apiKey) {

		// This line will throw an exception if it is not a signed JWS (as
		// expected)
		Claims claims = Jwts.parser()
				.setSigningKey(DatatypeConverter.parseBase64Binary(apiKey))
				.parseClaimsJws(token)
				.getBody();
		
		return claims;
	}

	// 토큰 유효성 확인
	public static boolean tokenVerify(String token, String apiKey) {
		/*System.out.println("token : " + token);
		System.out.println("apiKey : " + apiKey);

		System.out.println("parseJWT : " + parseJWT(token, apiKey).getExpiration().getTime());
		System.out.println("Jwts.parser() : " + parseJWT(token, apiKey).getSubject().equals("EasySafe"));*/
		
		if (parseJWT(token, apiKey).getExpiration().getTime() < System.currentTimeMillis()
				|| !(parseJWT(token, apiKey).getSubject().equals("EasySafe"))) {
			return false;
		} else {
			return true;
		}
	}


	// 토큰에 접근하기 위한 apiKey 생성 메소드
	public static String apiKeyCreate() {
		// create new key
		SecretKey secretKey = null;
		try {
			secretKey = KeyGenerator.getInstance("AES").generateKey();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// get base64 encoded version of the key
		String encodedKey = Base64.getEncoder().encodeToString(secretKey.getEncoded());
		return encodedKey;
	}

}

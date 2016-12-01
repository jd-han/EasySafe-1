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
	public static String createJWT(String uid, String upw, String ourApiKey){
		// 토큰 암호와 알고리즘 선택
				SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
				
				// 유효 기간 4주 >> 주 * 일 * 시간 * 분 * 초 * 1000
				long ttlMillis = 4*7*24*60*60*1000;
				
				// 현재 날짜 추출
				long nowMillis = System.currentTimeMillis();
				Date now = new Date(nowMillis);
				
				// ourApiKey를 기준으로한 토큰 생성
				byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(ourApiKey);
				Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
				// 토큰 내부 설정(토큰 내 정보 저장)
				JwtBuilder builder = Jwts.builder().setId(uid)
						.setIssuedAt(now)
						.setSubject("give")
						.signWith(signatureAlgorithm, signingKey)
						.claim("password", upw);
				
				//유효시간 설정
				if (ttlMillis >= 0) {
					long expMillis = nowMillis + ttlMillis;
					Date exp = new Date(expMillis);
					builder.setExpiration(exp);
				}
				
				//Builds the JWT and serializes it to a compact, URL-safe string
				return builder.compact();
			}
	
	//토큰 정보 확인
		public static Claims parseJWT(String ourToken, String ourApiKey) {
			//This line will throw an exception if it is not a signed JWS (as expected)
			Claims claims = Jwts.parser()         
					.setSigningKey(DatatypeConverter.parseBase64Binary(ourApiKey))
					.parseClaimsJws(ourToken).getBody();
			return claims;
		}
		// 토큰 유효성 확인 
		public static boolean tokenVerify(String ourToken, String ourApiKey){
			if(parseJWT(ourToken, ourApiKey).getExpiration().getTime() < System.currentTimeMillis() ||
			!(Jwts.parser().setSigningKey(ourApiKey).parseClaimsJws(ourToken).getBody().getSubject().equals("give"))){
				return false;
			}else{
				return true;
			}
		}
		// 토큰 디코더
		public static Map<String, Object> tokenDecoder(String ourApiKey, String ourToken){
			Claims claims = parseJWT(ourApiKey, ourToken);
			String email = claims.getId();
			String password = (String)claims.get("password");
			Date limitTime = claims.getExpiration();
			
			Map<String, Object> mapTokenInfo = new HashMap<String, Object>();
			mapTokenInfo.put("email", email);
			mapTokenInfo.put("password", password);
			mapTokenInfo.put("limitTime", limitTime);
			return mapTokenInfo;
		}
		// 토큰에 접근하기 위한 apiKey 생성 메소드
		public static String apiKeyCreate(){
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

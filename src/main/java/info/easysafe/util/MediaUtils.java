package info.easysafe.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {

	private static Map<String, MediaType> mediaMap;
	
	//이 형식 이미지들 지원.
	static{
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	
	//미디어 타입 대문자로 얻어옴.
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}

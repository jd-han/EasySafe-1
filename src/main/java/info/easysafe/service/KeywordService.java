package info.easysafe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import info.easysafe.domain.KeywordVO;

public interface KeywordService {
	public List<KeywordVO> listKeywordKorName(String korKey) throws Exception;
	public KeywordVO readKeywordKorName(KeywordVO kVO) throws Exception;
	public void createKeywordKorName(KeywordVO kVO) throws Exception;
	public void updateCount(KeywordVO kVO) throws Exception;
	public List<String> listAllDate() throws Exception;
	public List<String> listAllKeyword() throws Exception;
	public List<KeywordVO> listStatAdminKeywordKorName(String regDate) throws Exception;
	public List<Map<String, Object>> listStatUserKeywordKorName(String userName) throws Exception;
	public List<KeywordVO> selectKeywordByUser(String user);
}

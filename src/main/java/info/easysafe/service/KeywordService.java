package info.easysafe.service;

import java.util.List;

import info.easysafe.domain.KeywordVO;

public interface KeywordService {
	public List<KeywordVO> listKeywordKorName(String korKey) throws Exception;
	public KeywordVO readKeywordKorName(KeywordVO kVO) throws Exception;
	public void createKeywordKorName(KeywordVO kVO) throws Exception;
	public void updateCount(KeywordVO kVO) throws Exception;
}

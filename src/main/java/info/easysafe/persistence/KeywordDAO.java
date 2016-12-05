package info.easysafe.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import info.easysafe.domain.KeywordVO;

public interface KeywordDAO {
	// 검색어에 해당하는 모든 내역을 리스트로 출력.
	public List<KeywordVO> selectListKeywordKorName(String korKey) throws Exception;
	// 해당 검색어의 키워드와 현재 날짜로 DB 등록 여부를 조회.
	public KeywordVO selectOneKeywordKorName(KeywordVO kVO) throws Exception;
	// 해당 검색어로 새로 등록.
	public void insertKeywordKorName(KeywordVO kVO) throws Exception;
	// 해당 검색어의 조회수를 증가.
	public void updateCount(KeywordVO kVO) throws Exception;
	// 관리자용 통계 산출 조회
	public List<KeywordVO> selectListStatAdminKeywordKorName(String regDate) throws Exception;
	// 유저용 검색 내역 조회
	public List<Map<String, Object>> selectListStatUserKeywordKorName(String userName) throws Exception;
	public List<String> selectListAllDate() throws Exception;
	public List<String> selectListAllKeyword() throws Exception;
}

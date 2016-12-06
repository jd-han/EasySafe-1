package info.easysafe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import info.easysafe.domain.KeywordVO;
import info.easysafe.persistence.KeywordDAO;

@Service
public class KeywordServiceImpl implements KeywordService {

	@Inject
	private KeywordDAO dao;
	
	@Override
	public List<KeywordVO> listKeywordKorName(String korKey) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListKeywordKorName(korKey);
	}

	@Override
	public KeywordVO readKeywordKorName(KeywordVO kVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOneKeywordKorName(kVO);
	}
	
	@Override
	public void createKeywordKorName(KeywordVO kVO) throws Exception {
		// TODO Auto-generated method stub
		dao.insertKeywordKorName(kVO);
	}

	@Override
	public void updateCount(KeywordVO kVO) throws Exception {
		// TODO Auto-generated method stub
		dao.updateCount(kVO);
	}

	@Override
	public List<KeywordVO> listStatAdminKeywordKorName(String regDate) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListStatAdminKeywordKorName(regDate);
	}

	@Override
	public List<Map<String, Object>> listStatUserKeywordKorName(String userName) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListStatUserKeywordKorName(userName);
	}

	@Override
	public List<String> listAllDate() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListAllDate();
	}

	@Override
	public List<String> listAllKeyword() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListAllKeyword();
	}

	@Override
	public List<KeywordVO> selectKeywordByUser(String user) {
		// TODO Auto-generated method stub
		return dao.selectKeywordByUser(user);
	}
}

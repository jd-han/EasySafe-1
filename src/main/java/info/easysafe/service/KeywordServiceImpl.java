package info.easysafe.service;

import java.util.List;

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
}

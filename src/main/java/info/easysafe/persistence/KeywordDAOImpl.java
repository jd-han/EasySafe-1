package info.easysafe.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.KeywordVO;

@Repository
public class KeywordDAOImpl implements KeywordDAO {

	@Inject
	private SqlSession session;
	private static String namespace ="info.easysafe.mappers.KeywordMapper";
	
	@Override
	public List<KeywordVO> selectListKeywordKorName(String korKey) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectListKeywordKorName", korKey);
	}

	@Override
	public KeywordVO selectOneKeywordKorName(KeywordVO kVO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectOneKeywordKorName", kVO);
	}
	
	@Override
	public void insertKeywordKorName(KeywordVO kVO) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertKeywordKorName", kVO);
	}

	@Override
	public void updateCount(KeywordVO kVO) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".updateKeywordCount", kVO);
	}

}

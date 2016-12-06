package info.easysafe.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<KeywordVO> selectListStatAdminKeywordKorName(String regDate) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectStatAdminKeywordKorName", regDate);
	}

	@Override
	public List<Map<String, Object>> selectListStatUserKeywordKorName(String userName) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println(session.selectList(namespace + ".selectStatUserKeywordKorName", userName));
		return session.selectList(namespace + ".selectStatUserKeywordKorName", userName);
		//return session.selectMap(namespace + ".selectStatUserKeywordKorName", userName, "keyword");
	}

	@Override
	public List<String> selectListAllDate() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectAllDate");
	}

	@Override
	public List<String> selectListAllKeyword() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectAllKeyword");
	}

	@Override
	public List<KeywordVO> selectKeywordByUser(String user) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".selectKeywordByUser", user);
	}

}

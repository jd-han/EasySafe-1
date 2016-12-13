package info.easysafe.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.IssueVO;
import info.easysafe.domain.SearchCriteria;

@Repository
public class IssueDAOImpl implements IssueDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="info.easysafe.mapper.IssueMapper";
	
	 @Override
	  public void create(IssueVO vo) throws Exception {
	    session.insert(namespace + ".create", vo);
	  }

	  @Override
	  public IssueVO read(Integer ino) throws Exception {
	    return session.selectOne(namespace + ".read", ino);
	  }

	  @Override
	  public void update(IssueVO vo) throws Exception {
	    session.update(namespace + ".update", vo);
	  }

	  @Override
	  public void delete(Integer ino) throws Exception {
	    session.delete(namespace + ".delete", ino);
	  }

	  @Override
	  public List<IssueVO> listAll() throws Exception {
	    return session.selectList(namespace + ".listAll");
	  }

	  @Override
	  public List<IssueVO> listPage(int page) throws Exception {

	    if (page <= 0) {
	      page = 1;
	    }

	    page = (page - 1) * 10;

	    return session.selectList(namespace + ".listPage", page);
	  }

	  @Override
	  public List<IssueVO> listCriteria(Criteria cri) throws Exception {

	    return session.selectList(namespace + ".listCriteria", cri);
	  }

	  @Override
	  public int countPaging(Criteria cri) throws Exception {

	    return session.selectOne(namespace + ".countPaging", cri);
	  }

	  @Override
	  public List<IssueVO> listSearch(SearchCriteria cri) throws Exception {

	    return session.selectList(namespace + ".listSearch", cri);
	  }

	  @Override
	  public int listSearchCount(SearchCriteria cri) throws Exception {

	    return session.selectOne(namespace + ".listSearchCount", cri);
	  }

	  @Override
	  public void updateReplyCnt(Integer ino, int amount) throws Exception {

	    Map<String, Object> paramMap = new HashMap<String, Object>();

	    paramMap.put("ino", ino);
	    paramMap.put("amount", amount);

	    session.update(namespace + ".updateReplyCnt", paramMap);
	  }

	  @Override
	  public void updateViewCnt(Integer ino) throws Exception {
	    
	    session.update(namespace+".updateViewCnt", ino);
	    
	  }


	  @Override
	  public void addAttach(String fullName) throws Exception {
	    
	    session.insert(namespace+".addAttach", fullName);
	    
	  }
	  
	  @Override
	  public List<String> getAttach(Integer ino) throws Exception {
	    
	    return session.selectList(namespace +".getAttach", ino);
	  }
	 

	  @Override
	  public void deleteAttach(Integer ino) throws Exception {

	    session.delete(namespace+".deleteAttach", ino);
	    
	  }

	  @Override
	  public void replaceAttach(String fullName, Integer ino) throws Exception {
	    
	    Map<String, Object> paramMap = new HashMap<String, Object>();
	    
	    paramMap.put("ino", ino);
	    paramMap.put("fullName", fullName);
	    
	    session.insert(namespace+".replaceAttach", paramMap);
	    
	  }
	


}

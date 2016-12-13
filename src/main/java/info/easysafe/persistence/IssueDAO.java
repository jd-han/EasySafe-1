package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.IssueVO;
import info.easysafe.domain.SearchCriteria;

public interface IssueDAO {
	
	public void create(IssueVO vo) throws Exception;

	  public IssueVO read(Integer ino) throws Exception;

	  public void update(IssueVO vo) throws Exception;

	  public void delete(Integer ino) throws Exception;

	  public List<IssueVO> listAll() throws Exception;

	  public List<IssueVO> listPage(int page) throws Exception;

	  public List<IssueVO> listCriteria(Criteria cri) throws Exception;

	  public int countPaging(Criteria cri) throws Exception;
	  
	  //use for dynamic sql
	  
	  public List<IssueVO> listSearch(SearchCriteria cri)throws Exception;
	  
	  public int listSearchCount(SearchCriteria cri)throws Exception;
	  
	  
	  public void updateReplyCnt(Integer ino, int amount)throws Exception;
	  
	  
	  public void updateViewCnt(Integer ino)throws Exception;
	  
	  public void addAttach(String fullName)throws Exception;
	  
	  public List<String> getAttach(Integer ino)throws Exception;  
	   
	  public void deleteAttach(Integer ino)throws Exception;
	  
	  public void replaceAttach(String fullName, Integer ino)throws Exception;
	
}

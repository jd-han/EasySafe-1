package info.easysafe.service;

import java.util.List;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.IssueVO;
import info.easysafe.domain.SearchCriteria;

public interface IssueService {
	  public void regist(IssueVO board) throws Exception;

	  public IssueVO read(Integer ino) throws Exception;

	  public void modify(IssueVO vo) throws Exception;

	  public void remove(Integer ino) throws Exception;

	  public List<IssueVO> listAll() throws Exception;

	  public List<IssueVO> listCriteria(Criteria cri) throws Exception;

	  public int listCountCriteria(Criteria cri) throws Exception;

	  public List<IssueVO> listSearchCriteria(SearchCriteria cri) 
	      throws Exception;

	  public int listSearchCount(SearchCriteria cri) throws Exception;
	  
	  
	  public List<String> getAttach(Integer ino)throws Exception;
}

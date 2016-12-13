package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.IssueVO;
import info.easysafe.domain.SearchCriteria;
import info.easysafe.persistence.IssueDAO;

@Service
public class IssueServiceImpl implements IssueService{
	
	@Inject
	private IssueDAO dao;

	 @Transactional
	  @Override
	  public void regist(IssueVO vo) throws Exception {
	  
	    dao.create(vo);
	    
	    String[] files = vo.getFiles();
	    
	    if(files == null) { return; } 
	    
	    for (String fileName : files) {
	      dao.addAttach(fileName);
	    }   
	  }
	  
 


	  @Transactional(isolation=Isolation.READ_COMMITTED)
	  @Override
	  public IssueVO read(Integer ino) throws Exception {
	    dao.updateViewCnt(ino);
	    return dao.read(ino);
	  }

 
	  @Transactional
	  @Override
	  public void modify(IssueVO vo) throws Exception {
	    dao.update(vo);
	    
	    Integer ino = vo.getIno();
	    
	    dao.deleteAttach(ino);
	    
	    String[] files = vo.getFiles();
	    
	    if(files == null) { return; } 
	    
	    for (String fileName : files) {
	      dao.replaceAttach(fileName, ino);
	    }
	  }
	  

 
	  
	  @Transactional
	  @Override
	  public void remove(Integer ino) throws Exception {
	    dao.deleteAttach(ino);
	    dao.delete(ino);
	  } 

	  @Override
	  public List<IssueVO> listAll() throws Exception {
	    return dao.listAll();
	  }

	  @Override
	  public List<IssueVO> listCriteria(Criteria cri) throws Exception {

	    return dao.listCriteria(cri);
	  }

	  @Override
	  public int listCountCriteria(Criteria cri) throws Exception {

	    return dao.countPaging(cri);
	  }

	  @Override
	  public List<IssueVO> listSearchCriteria(SearchCriteria cri) throws Exception {

	    return dao.listSearch(cri);
	  }

	  @Override
	  public int listSearchCount(SearchCriteria cri) throws Exception {

	    return dao.listSearchCount(cri);
	  }
	  

	  @Override
	  public List<String> getAttach(Integer ino) throws Exception {
	    
	    return dao.getAttach(ino);
	  }   

}

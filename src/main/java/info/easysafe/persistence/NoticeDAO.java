package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.NoticeVO;
import info.easysafe.domain.SearchCriteria;
import info.easysafe.domain.UserVO;

public interface NoticeDAO {
	
	public void create(NoticeVO vo) throws Exception;
	public NoticeVO read(Integer no) throws Exception;
	public void update(NoticeVO vo) throws Exception;
	public void delete(Integer no) throws Exception;
	
	public List<NoticeVO> listAll () throws Exception;
	
	public List<NoticeVO> listCriteria (Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;

	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;

}

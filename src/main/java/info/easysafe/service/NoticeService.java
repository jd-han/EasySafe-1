package info.easysafe.service;

import java.util.List;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.NoticeVO;
import info.easysafe.domain.SearchCriteria;

public interface NoticeService {

	public List<NoticeVO> listNotice() throws Exception;
	
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	public int listCountCriteria(Criteria cri) throws Exception;

	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	
	public NoticeVO readNotice(int no) throws Exception;
	public void updateNotice(NoticeVO vo) throws Exception;
	public void deleteNotice(Integer no) throws Exception;
	public void createNotice(NoticeVO vo) throws Exception;
}

package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.NoticeVO;
import info.easysafe.domain.SearchCriteria;
import info.easysafe.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	private NoticeDAO dao;

	@Override
	public List<NoticeVO> listNotice() throws Exception {
		return dao.listAll();
	}

	@Override
	public NoticeVO readNotice(int no) throws Exception {
		return dao.read(no);
	}

	@Override
	public void updateNotice(NoticeVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void deleteNotice(Integer no) throws Exception {
		dao.delete(no);
	}

	@Override
	public void createNotice(NoticeVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	@Override
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}

}

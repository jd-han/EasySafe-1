package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import info.easysafe.domain.NoticeVO;
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

}

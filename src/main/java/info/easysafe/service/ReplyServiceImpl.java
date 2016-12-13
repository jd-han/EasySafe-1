package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.ReplyVO;
import info.easysafe.persistence.IssueDAO;
import info.easysafe.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO dao;
	
	@Inject
	private IssueDAO issuedao;

	@Override
	@Transactional
	public void addreply(ReplyVO vo) throws Exception {
		dao.create(vo);
		issuedao.updateReplyCnt(vo.getIno(), 1);
	}

	@Override
	public List<ReplyVO> list(int ino) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(ino);
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	@Transactional 
	public void deleteReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		int ino = dao.getIno(rno);
		dao.delete(rno);
		System.out.println(rno+"번 댓글이 달려 있었던"+ino+"번 이슈 게시물에서 댓글 갯수를 하나 지운다. ");
		issuedao.updateReplyCnt(ino, -1);
	}

	@Override
	public List<ReplyVO> listReplyPage(int ino, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(ino, cri);
	}

	@Override
	public int count(Integer ino) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(ino);
	}

	@Override
	public void deleteWholeReply(int ino) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteWholeReply(ino);
		
	}
	
	
	
}

package info.easysafe.service;

import java.util.List;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.ReplyVO;

public interface ReplyService {

	public void addreply(ReplyVO vo) throws Exception;
	public List<ReplyVO> list(int ino) throws Exception;
	public void updateReply(ReplyVO vo) throws Exception;
	public void deleteReply(int rno) throws Exception;
	public void deleteWholeReply(int ino) throws Exception;
	
	
	public List<ReplyVO> listReplyPage(int ino, Criteria cri) throws Exception;
	public int count(Integer ino) throws Exception;
}

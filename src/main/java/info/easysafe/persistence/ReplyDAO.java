package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> list(int ino) throws Exception;
	
	public List<ReplyVO> listPage(int ino, Criteria cri) throws Exception;
	public int count(int ino) throws Exception;
	public void deleteWholeReply(int ino) throws Exception;
	
	public void create(ReplyVO vo) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(int rno) throws Exception;
	
	public int getIno(int rno) throws Exception;
	
	
	
}

package info.easysafe.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "info.easysafe.mapper.ReplyMapper";

	@Override
	public List<ReplyVO> list(int ino) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list", ino);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", rno);
	}

	@Override
	public List<ReplyVO> listPage(int ino, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("ino", ino);
		paramMap.put("cri", cri);
		return session.selectList(namespace+".listPage");
	}

	@Override
	public int count(int ino) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".count", ino);
	}

	@Override
	public int getIno(int rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getIno", rno);
	}

	@Override
	public void deleteWholeReply(int ino) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteWholeReply", ino);
	}

}

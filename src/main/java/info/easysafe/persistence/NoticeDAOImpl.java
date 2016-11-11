package info.easysafe.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "info.easysafe.mappers.NoticeMapper";
	
	@Override
	public void create(NoticeVO vo) throws Exception {
		session.insert(namespace+".insert", vo);
	}

	@Override
	public NoticeVO read(Integer nno) throws Exception {
		return session.selectOne(namespace+".read", nno);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		System.out.println("vo from DAO : "+ vo);
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(Integer nno) throws Exception {
		session.delete(namespace+".delete", nno);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		System.out.println("listAll()");
		List<NoticeVO> list = session.selectList(namespace+".listAll");
		System.out.println("list result : " + list.size());
		return session.selectList(namespace+".listAll");
	}

}

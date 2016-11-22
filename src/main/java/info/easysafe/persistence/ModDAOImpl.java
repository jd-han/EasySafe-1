package info.easysafe.persistence;

import javax.inject.Inject;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.UserVO;

@Repository
public class ModDAOImpl implements ModDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace = "info.easysafe.mappers.UserMapper";
	@Override
	public List<UserVO> selectUserList(String userKey) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<UserVO> List() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAccount");
	}



}

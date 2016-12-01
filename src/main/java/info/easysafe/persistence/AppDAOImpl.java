package info.easysafe.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;

@Repository
public class AppDAOImpl implements AppDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace ="info.easysafe.mappers.AppMapper";
	
	@Override
	public int joinMember(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public UserVO loginMember(String uid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public UserVO getMemberByInfo(String uid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public UserVO getMemberByToken(String ourToken) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int modifyMember(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void exitMember(String id) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void modifyMemberOurToken(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int getMemberByNo(String id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}

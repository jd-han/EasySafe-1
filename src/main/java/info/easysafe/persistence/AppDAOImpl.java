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
	public int registerUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("registerUser", vo);
	}
	@Override
	public UserVO loginUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public UserVO getUserById(String uid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("AppDAOImpl uid : " + uid);
		return session.selectOne(namespace+".selectUserById", uid);
	}
	@Override
	public UserVO getUserByToken(String token) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Daoimp token : " + token);
		return session.selectOne(namespace + ".getUserByToken", token);
	}
	@Override
	public int modifyUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void deleteUser(String id) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".deleteUserById", id);
		
	}
	@Override
	public void updateUserToken(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".updateUserToken", vo);
	}
	@Override
	public int getUserByNo(String id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public UserVO getUserByMail(String umail) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectUserByMail", umail);
	}
	

	
}

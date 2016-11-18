package info.easysafe.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace = "info.easysafe.mappers.UserMapper";

	@Override
	public List<UserVO> listAll() throws Exception {
		return session.selectList(namespace+".listAccount");
	}

	@Override
	public void create(UserVO vo) throws Exception {
		System.out.println("VO daoimpl:" + vo);
		session.insert(namespace+".createAccount", vo);
	}

	@Override
	public UserVO view(UserVO vo) throws Exception {
		UserVO uvo = session.selectOne(namespace+".readAccount", vo);
		uvo.setUpw(null);
		return uvo;
	}

	@Override
	public void deleteAccount(UserVO vo) throws Exception {
		session.delete(namespace+".deleteAccount", vo);
	}

	@Override
	public void updateAccount(UserVO vo) throws Exception {
		session.update(namespace+".updateAccount", vo);
	}

	@Override
	public void updatePW(UserVO vo) throws Exception {
		session.update(namespace+".updateAccountpw", vo);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		UserVO uvo = session.selectOne(namespace+".login", vo);
		uvo.setUpw("");
		return uvo;

	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		UserVO uvo = session.selectOne(namespace+".login", dto);
		System.out.println("UserDAOImpl uvo : "+ uvo);
		if (uvo != null) {
			uvo.setUpw(""); }
		return uvo;

	}

}

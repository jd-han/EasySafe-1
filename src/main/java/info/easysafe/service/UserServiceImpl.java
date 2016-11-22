package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;
import info.easysafe.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO dao;

	
	@Override
	public List<UserVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public void regist(UserVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public UserVO view(UserVO vo) throws Exception {
		return dao.view(vo);
	}

	@Override
	public void deleteAccount(UserVO vo) throws Exception {
		dao.deleteAccount(vo);
	}

	@Override
	public void updateAccount(UserVO vo) throws Exception {
		dao.updateAccount(vo);
	}

	@Override
	public void updatePW(UserVO vo) throws Exception {
		dao.updatePW(vo);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void updateLevel(UserVO vo) throws Exception {
		dao.updateLevel(vo);
		
	}

}

package info.easysafe.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;
import info.easysafe.persistence.AppDAO;

@Service
public class appServiceImpl implements appService{

	@Inject
	private AppDAO dao;

	@Override
	public int registerUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.registerUser(vo);
	}

	@Override
	public UserVO loginUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.loginUser(uid);
	}

	@Override
	public UserVO getUserById(String uid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("appServiceImpl uid : " + uid);
		return dao.getUserById(uid);
	}

	@Override
	public UserVO getUserByToken(String token) throws Exception {
		// TODO Auto-generated method stub
		return dao.getUserByToken(token);
	}

	@Override
	public int modifyUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyUser(vo);
		return 0;
	}

	@Override
	public void deleteUser(String id) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteUser(id);
	}

	@Override
	public void updateUserToken(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateUserToken(vo);
	}

	@Override
	public int getUserByNo(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getUserByNo(id);
	}

	@Override
	public UserVO getUserByMail(String umail) {
		// TODO Auto-generated method stub
		return dao.getUserByMail(umail);
	}

	

}

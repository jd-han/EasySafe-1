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

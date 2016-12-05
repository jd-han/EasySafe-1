package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import info.easysafe.domain.Criteria;
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
	public List<UserVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public void regist(UserVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public UserVO view(String uid) throws Exception {
		return dao.view(uid);
	}

	@Override
	public void deleteAccount(int no ) throws Exception {
		dao.deleteAccount(no);
	}

	@Transactional
	@Override
	public void updateAccount(UserVO vo) throws Exception {
		System.out.println("updateAccount service. : "+vo);
		
		String file = vo.getFile();
		if(file ==null) {
			dao.updateAccountNoPic(vo);
		}else{
			dao.updateAccount(vo);
		}
		System.out.println("dao addpic : "+file);
//		dao.addPic(vo);
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
	public UserVO viewEmail(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.viewEmail(vo);
	}




}

package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.UserVO;

public interface UserDAO {

	public List<UserVO> listAll () throws Exception;
	public void create(UserVO vo) throws Exception;
	public void view(UserVO vo) throws Exception;
	public void deleteAccount(UserVO vo) throws Exception;
	
	public void updateAccount(UserVO vo) throws Exception;
	public void updatePW(UserVO vo) throws Exception;
}

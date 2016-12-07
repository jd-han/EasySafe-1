package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.SearchCriteria;
import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;

public interface UserDAO {

	public List<UserVO> listAll () throws Exception;
	public List<UserVO> listPage (int page) throws Exception;
	public List<UserVO> listSearch (SearchCriteria cri) throws Exception;
	
	
	public List<UserVO> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public void create(UserVO vo) throws Exception;
	public UserVO view(String uid) throws Exception;
	public void deleteAccount(int no) throws Exception;
	public UserVO viewEmail(UserVO vo) throws Exception;
	
	public void updateAccount(UserVO vo) throws Exception;
	public void updateAccountNoPic(UserVO vo) throws Exception;
//	public void addPic(UserVO vo) throws Exception;
	
	public void updatePW(UserVO vo) throws Exception;
	public UserVO login(UserVO vo) throws Exception;
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void updateLevel(UserVO vo) throws Exception;
	
	public void applogin(UserVO vo) throws Exception;
	public List<String> viewAllRequest();
	
}

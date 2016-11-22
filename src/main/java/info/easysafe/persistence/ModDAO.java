package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.UserVO;

public interface ModDAO {
	public List<UserVO> selectUserList(String userKey) throws Exception;
	public List<UserVO> List() throws Exception;
}

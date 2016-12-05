package info.easysafe.service;

import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;

public interface appService {
	
//	회원가입
	public int registerUser(UserVO vo) throws Exception;
	
//	로그인
	public UserVO loginUser(String uid) throws Exception;
	
//	1인 조회 - 아이디
	public UserVO getUserById(String uid) throws Exception;
	
//	토큰관련 (로그인)
	public UserVO getUserByToken(String token) throws Exception;
	
//	회원수정
	public int modifyUser(UserVO vo) throws Exception;

//	회원탈퇴
	public void deleteUser(String id) throws Exception;
	
//  토큰 업데이트
	public void updateUserToken(UserVO vo) throws Exception;
	
//	회원넘버로 가져오기
	public int getUserByNo(String id) throws Exception;
//	메일 확인하기
	public UserVO getUserByMail(String umail);

}

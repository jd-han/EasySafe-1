package info.easysafe.persistence;

import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;

public interface AppDAO {
	
	/*패스워드 재발급*/
	public void sendEmail(String emailUrl) throws Exception;
	
//	회원가입
	public int joinMember(UserVO vo) throws Exception;
	
//	로그인
	public UserVO loginMember(String uid) throws Exception;
	
//	1인 조회 - 아이디
	public UserVO getMemberByInfo(String uid) throws Exception;
	
//	토큰관련 (로그인)
	public UserVO getMemberByToken(String ourToken) throws Exception;
	
//	회원수정
	public int modifyMember(UserVO vo) throws Exception;

//	회원탈퇴
	public void exitMember(String id) throws Exception;
	
//  토큰 업데이트
	public void modifyMemberOurToken(UserVO vo) throws Exception;
	
//	회원넘버로 가져오기
	public int getMemberByNo(String id) throws Exception;
		
//	// 파일 리스트 (회원정보 이미지)
//	public List<FileVO> searchFileBymember(int no) throws Exception;
//
//	// 사진 url 수정
//	public void modMemberByPictureUrl(UserVO UserVO) throws Exception;
//	
//	// 분야 검색 - 멤버넘버
//	public List<FieldVO> getFieldByMember(int memberNo) throws Exception;
//	
//	// 아이디 찾기
//	public String getMemberEmail(MemberVO memberVO) throws Exception;
	
}
package info.easysafe.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import info.easysafe.domain.UserVO;
import info.easysafe.service.appService;
import info.easysafe.util.Sha512Encrypt;
import info.easysafe.util.TokenUtil;

@Controller
@RequestMapping("/appuser")
public class AppUserController {

	private static final Logger logger = LoggerFactory.getLogger(AppUserController.class);

	@Inject
	private appService service;
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String joinPost(UserVO vo) throws Exception{
		String ourApiKey = TokenUtil.apiKeyCreate();
		vo.setApikey(ourApiKey);
		service.joinMember(vo);
		return "success";		
	}
	
	
Map<String, Object> mapMemberInfo = null;
	
	

	//  회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public Map<String, Object> joinMember(@RequestBody UserVO vo, HttpSession session) {
		System.out.println("aaaaabbbbbb");
		System.out.println(vo.toString());
		try {
			if(vo.getUpw() != null || vo.getUpw() == ""){
				System.out.println("비밀번호 있음 ::: 일반 로그인");
				if(!idCheck(vo.getUid())){
					// 기존 회원가입
					if(vo.getJoinFlag() != null){
						if(vo.getJoinFlag().equals("joinGive")){
							// 인증 완료.
							System.out.println("이메일 ? 인증중..");
							vo.setJoinFlag("addInfomation");
							mapMemberInfo.put("vo", vo);
							return mapMemberInfo;
						}else if(vo.getJoinFlag().equals("addInfomation")){
							// 추가정보 입력
							System.out.println("추가정보 입력");
							vo.setJoinFlag("joinSuccess");
							mapMemberInfo.put("vo", vo);
							return mapMemberInfo;
						}else if(vo.getJoinFlag().equals("joinSuccess")){
							System.out.println("간다간다 가입하러 숑 간다!!");
							vo.setJoinFlag("letJoin");
							mapMemberInfo.put("vo", vo);
							return mapMemberInfo;
						}else{
							throw new Exception();
						}
					}else{
						System.out.println("웹 로그인이 아님...");
						vo.setJoinFlag("fail");
						mapMemberInfo.put("vo", vo);
					}
					vo.setUpw(Sha512Encrypt.hash(vo.getUpw()));
					System.out.println("닉네임 :::::::::: " + vo.getUname());
					String ourApiKey = TokenUtil.apiKeyCreate();
					vo.setApikey(ourApiKey);
					service.joinMember(vo);
					System.out.println("회원가입 성공!!!");
					mapMemberInfo.put("ourToken", "success");
				}
			}else{
				// 외부 접속
				System.out.println("외부 접속");
				System.out.println(vo.toString());
				if(vo.getToken() == null){
					// 외부 회원가입
					if(!idCheck(vo.getUid())){
						System.out.println("외부 로그인 아이디 없음.");
						if(vo.getJoinFlag() != null){
							if(vo.getJoinFlag().equals("joinSuccess")){
								System.out.println("외부 가입하러 숑 간다!!");
//								vo.setJoinFlag("letJoin");
								mapMemberInfo.put("vo", vo);
								System.out.println("=================================================");
								System.out.println("vo ::::::::"+vo.toString());
								System.out.println("mapMemberInfo ::::::::"+mapMemberInfo.get("vo").toString());
								System.out.println("=================================================");
								return mapMemberInfo;
							}
						}
						String ourApiKey = TokenUtil.apiKeyCreate();
						vo.setApikey(ourApiKey);
						service.joinMember(vo);
					}else{
						System.out.println("넌 이미 가입되어 있다!!");
						service.modifyMember(vo);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			mapMemberInfo.put("ourToken", "Fail");
			return mapMemberInfo;
		}
		return loginCommonMember(vo, session);
//		System.out.println("로그인 가는중....막긔!");
//		return mapMemberInfo;
	}
		
	// 로그인 메소드
	public Map<String, Object> loginCommonMember(UserVO voSub, HttpSession session){
		String tempToken = null;
		UserVO vo = null; 
		try {
			if(voSub.getUpw() != null){
				vo = service.getMemberByInfo(voSub.getUid());
//				System.out.println(vo.getPassword());
//				System.out.println(voSub.getPassword());
				if(vo.getUpw().equals(voSub.getUpw())){
					System.out.println("패스워드 맞음");
					// 일반 로그인
					// 토큰 생성
					tempToken = makeToken(vo);
					vo.setToken(tempToken);
				}else{
					System.out.println("패스워드 안맞음!!");
					// 패스워드 안맞음.
					throw new Exception();
				}
//			}else if(voSub.getFacebookId() != null || voSub.getGoogleId() != null){
//				// 외부 로그인
//				// 토큰 생성
//				vo = service.getMemberByInfo(voSub.getUid());
//				tempToken = makeToken(vo);
//				vo.setToken(tempToken);
			}else if(voSub.getToken() != null){
				// 토큰 로그인 - 자동 로그인 - app - 토큰 생성 안함.
				vo = service.getMemberByToken(voSub.getToken());
				if(TokenUtil.tokenVerify(voSub.getToken(), vo.getApikey())){
					tempToken = voSub.getToken();
				}else{
					// 다시 로그인 해야함.
					mapMemberInfo.put("ourToken", "reLoginRequest");
				}
			}else{
				// 그외 던짐
				throw new Exception();
			}
			mapMemberInfo.put("ourToken", tempToken);
			// 로그인 세션 처리
			session.setAttribute("member", vo);
			return mapMemberInfo;
		} catch (Exception e) {
			e.printStackTrace();
			mapMemberInfo.put("ourToken", "Fail");
			return mapMemberInfo;
		}
	}
	
	//	 로그인 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Map<String, Object> loginMember(@RequestBody UserVO vo, HttpSession session) {
		// 변형된 암호를 비교하기 위한 작업
		if(vo.getUpw() != null){
			vo.setUpw(Sha512Encrypt.hash(vo.getUpw()));
		}
		mapMemberInfo = loginCommonMember(vo, session);
		return mapMemberInfo;
	}

	// 토큰 생성 메소드
	public String makeToken(UserVO vo){
		// 토큰 생성후 ourApiKey 와  ourToken 을 DB에 update 또는 insert한다.
		String ourToken = TokenUtil.createJWT(vo.getUid(), vo.getUpw(), vo.getApikey());
		vo.setToken(ourToken);
		try {
			service.modifyMemberOurToken(vo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("컨트롤러 서비스 진입 에러");
		}
		return ourToken;
	}
	
//	//	전체 유저 조회 
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public List<UserVO> listMember() {
//		List<UserVO> list = null;
//		try {
//			list = service.listMember();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}

	//	1인 조회 - 아이디 
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public UserVO getByInfoMember(String uid) {
		UserVO voInfo = null;
		try {
			System.out.println("id(email) ::: " + uid);
			voInfo = service.getMemberByInfo(uid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return voInfo;
	}
	
	//	아이디 존재 여부 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean emailCheckMember(@RequestBody UserVO vo){
		System.out.println("id :: " + vo.getUid());
		return idCheck(vo.getUid());
	}
	
	//	아이디 존재 여부 체크 메소드
	public boolean idCheck(String uid){
		System.out.println("id(email) ::: " + uid);
		try {
			if(service.getMemberByInfo(uid) != null){
				return true;
			}else{
				throw new Exception();
			}
		} catch (Exception e) {
			//			e.printStackTrace();
			return false;
		}
	}


	/* 로그아웃 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public Map<String, Object> logoutMember(HttpSession session) {
		// 전부를 지워주는 단계
		// session.invalidate();
		session.removeAttribute("member");
		mapMemberInfo.put("ourToken", "logout Success");
		return mapMemberInfo;
	}

	
	
	/* 회원수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ResponseEntity<String> modifyMember(@RequestBody UserVO vo) {
		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		try {
			if(vo.getUpw() != null){
				vo.setUpw(Sha512Encrypt.hash(vo.getUpw()));
			}
			
			service.modifyMember(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}

	/* 회원탈퇴 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> exitMember(@RequestBody UserVO vo) {
		System.out.println(vo.getUid());
		ResponseEntity<String> entity = null;
		try {
			service.exitMember(vo.getUid());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	//마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void memberMypage(int memberNo){
		
	}
	
//	//추가 정보 입력
//	@RequestMapping(value = "/addInfo", method = RequestMethod.POST)
//	public void addInfo(MultipartHttpServletRequest mRequest, HttpServletResponse response, HttpSession session) throws Exception{
//		UserVO vo = (UserVO)session.getAttribute("member");
//		int memberNo = Integer.parseInt(mRequest.getParameter("memberNo"));
//		String name = mRequest.getParameter("name");
//		String nickName = mRequest.getParameter("nickName");
//		List<FileVO> fileList = fService.fileUpload(mRequest, Integer.parseInt(mRequest.getParameter("parentNum")), Integer.parseInt(mRequest.getParameter("parentType")));
//		vo.setMemberNo(memberNo);
//		vo.setName(name);
//		vo.setNickName(nickName);
//		
//		for(FileVO file : fileList){
//			vo.setPictureUrl(file.getFilePath()+"s_"+file.getRealFileName());
//		}
//		service.modifyMember(vo);
//	}
//	
	// 아이디 비밀번호 확인하고 submit 하기 위한 flag값 넘겨주는 메소드
	@RequestMapping(value = "/confirmMember", method = RequestMethod.POST)
	public boolean confirmMember(UserVO vo){
		boolean flag = false;
		String password = new String();
		try {
			if(idCheck(vo.getUid())){
				password = service.getMemberByInfo(vo.getUid()).getUpw();
				if(password == null && vo.getUpw().length()==0){
					flag = true;
				}else{
					vo.setUpw(Sha512Encrypt.hash(vo.getUpw()));
					if(password.equals(vo.getUpw())){
						flag = true;
					}else{
						flag = false;
					}
				}
			}else{
				flag = false;
			}
		} catch (Exception e) {
			System.out.println("confirmMember :::: 회원정보가 없음.");
			e.printStackTrace();
			return false;
		} 
		return flag;
	}
	
//	// 아이디 찾기
//	@RequestMapping(value = "/findId", method = RequestMethod.POST)
//	public String findMemberId(@RequestBody UserVO vo){
//		String email = "";
//		System.out.println("findId :::::::" + vo.toString());
//		try {
//			email = service.getMember(vo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return email;
//	}
	// 비밀번호 찾기
//	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
//	public int findMemberPw(@RequestBody UserVO vo){
//		System.out.println("vo :::::::::::::: " + vo.toString());
//		SendMail sendMail = new SendMail();
//		Random r = new Random();
//		String rNum = String.format("%08d", r.nextInt(99999998)+1);
//		vo.setPassword(Sha512Encrypt.hash(rNum));
//		int confirm = 0;
//		try {
//			confirm = service.modMemberPw(vo);
//			if(confirm == 1){
//				sendMail.joinMailSend(vo.getEmail(), rNum, "비밀번호 찾기 서비스", "임시비밀번호 :: ");
//			}
//			System.out.println("confirm ::::::: " + confirm);
//		} catch (Exception e) {
//			System.out.println("findPw 오류 :::: 정보 없어요~");
//			e.printStackTrace();
//			return 0;
//		}
//		return confirm;
//	}
	
	@RequestMapping(value="/getInfo", method = RequestMethod.POST)
	@ResponseBody
	public UserVO getInfo(@RequestBody UserVO vo) throws Exception{
		
		
//		vo.setOurToken("Fail");
		return service.getMemberByToken(vo.getToken());
	}
	
	
	
	
	
	

}

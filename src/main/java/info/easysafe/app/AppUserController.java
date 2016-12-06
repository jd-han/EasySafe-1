package info.easysafe.app;

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
	
	
	//	아이디 존재 여부 체크 true : 
	
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public @ResponseBody String idCheck(@RequestBody UserVO vo){
		logger.info("input UserVO : " + vo);
		System.out.println("idCheck : id : " + vo.getUid());
		return idChecker(vo.getUid())? "true" : "false";
	}
	
	//	아이디 존재 여부 체크 메소드
	public boolean idChecker(String uid){
		System.out.println("idChecker : id : " + uid);
		try {
			System.out.println("try inner uid : " + uid);
				service.getUserById(uid);
				System.out.println("after");
			
			if(service.getUserById(uid) != null){
				System.out.println("아이디 있음");
				return true;
			}else{
				throw new Exception();
			}
		} catch (Exception e) {
			//			e.printStackTrace();
			return false;
		}
	}

	// 메일 중복체크
	@ResponseBody
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.POST)
	public String emailCheck(@RequestBody UserVO vo){
		return emailChecker(vo.getUmail())? "true" : "false";
	}
	
	public boolean emailChecker(String umail){
		try {
			if(service.getUserByMail(umail) != null){
				System.out.println("메일 있음");
				return true;
			}else{
				throw new Exception();
			}
		} catch (Exception e) {
			//			e.printStackTrace();
			return false;
		}
	}
	
	
	//자체 회원가입
	@ResponseBody
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public UserVO register(@RequestBody UserVO vo) throws Exception{
		String apiKey = TokenUtil.apiKeyCreate();
		vo.setApikey(apiKey);
		System.out.println("회원가입 들어옴 ");
		if(service.registerUser(vo) == 1){
			System.out.println("회원가입 성공, 로그인을 통한 토큰 돌려주기 시도");
			
			return loginAppUser(vo);
		}
		System.out.println("회원가입 실패");
		return null;		
	}
	
	// 자체 로그인
	@ResponseBody
	@RequestMapping(value="/ourlogin.do", method=RequestMethod.POST)
	public UserVO loginAppUser(@RequestBody UserVO voSub){
		String tempToken = null;
		UserVO vo = null;
		System.out.println("자체 로그인 들어옴");
		try{
			vo = service.getUserById(voSub.getUid());
			if(vo.getUpw().equals(voSub.getUpw())){
				tempToken = makeToken(vo);
				vo.setToken(tempToken);
			}else{
				logger.info("로그인 실패 : 받은 vo : " + voSub);
				logger.info("로그인 실패 : 꺼낸 vo : " + vo);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return vo;
	}
	
	// 토큰으로 정보 가져오기(로그인)
	@RequestMapping(value="/getUserByToken.do", method = RequestMethod.POST)
	@ResponseBody
	public UserVO getUserByToken(@RequestBody UserVO voSub) throws Exception{
		String tempToken = null;
		UserVO vo = null;
		logger.info("getUserByToken : 받은 토큰 : " + voSub.getToken());
		vo = service.getUserByToken(voSub.getToken());
		logger.info("꺼낸 vo : " + vo);
		if(TokenUtil.tokenVerify(voSub.getToken(), vo.getApikey())){
			//토큰 사용 가능
			tempToken = voSub.getToken();
		}else{
			//토큰 새로 만들들기
			tempToken = makeToken(vo);
		}
		
		return service.getUserByToken(vo.getToken());
	
	}

	
		/*try {
			//외부로그인은 비번이 없다.
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
<<<<<<< HEAD
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
=======
		}*/

	
	// 토큰 생성 메소드
	public String makeToken(UserVO vo){
		// 토큰 생성후 ourApiKey 와  ourToken 을 DB에 update 또는 insert한다.
		String ourToken = TokenUtil.createJWT(vo.getUid(), vo.getUpw(), vo.getApikey());
		vo.setToken(ourToken);
		try {
			service.updateUserToken(vo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("컨트롤러 서비스 진입 에러");
		}
		return ourToken;
	}

	
/*	 회원수정 
	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
	public ResponseEntity<String> updateUser(@RequestBody UserVO vo) {
		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		try {
			if(vo.getUpw() != null){
				vo.setUpw(Sha512Encrypt.hash(vo.getUpw()));
			}
			
			service.modifyUser(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}

	// 회원탈퇴 
	@RequestMapping(value = "/deleteUser.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteUser(@RequestBody UserVO vo) {
		System.out.println(vo.getUid());
		ResponseEntity<String> entity = null;
		try {
			service.deleteUser(vo.getUid());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}*/
	
	
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
	@RequestMapping(value = "/confirmMember.do", method = RequestMethod.POST)
	public boolean confirmMember(UserVO vo){
		boolean flag = false;
		String password = new String();
		try {
			if(idChecker(vo.getUid())){
				password = service.getUserById(vo.getUid()).getUpw();
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
	
	
	

}

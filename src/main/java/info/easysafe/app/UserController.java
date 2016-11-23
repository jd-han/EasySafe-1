package info.easysafe.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;
import info.easysafe.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	// 외부 API 아이디로 회원가입 하는지 여부를 체크하는 변수
	private boolean isAPI = false;
	// 아이디 중복체크를 통과했는지 체크하는 변수
	private boolean isDuId = false;
	// 비밀번호 체크를 통과했는지 체크하는 변수
	private boolean isPass = true;
	// 이메일 중복체크를 통과했는지 체크하는 변수
	private boolean isDuEmail = false;
	// 이메일 형식을 통과했는지 체크하는 변수
	private boolean isEmail = false;
	// 이름을 입력했는지 체크하는 변수
	private boolean isName = false;
	
	@Inject
	private UserService service;
	
<<<<<<< HEAD
	@RequestMapping(value="/registform", method=RequestMethod.GET)
=======
	@RequestMapping(value="/listAccount", method=RequestMethod.GET)
	@ResponseBody
	public List<UserVO> listAccount () throws Exception{
		return service.listAll();
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public void registGet () throws Exception {
		logger.info("회원가입 과정에 진입...");
		//return "redirect:/register";
	}
	
	@RequestMapping(value="/registerForm.do", method=RequestMethod.POST)
	@ResponseBody
	public String registPost(UserVO vo) throws Exception{
		if(!vo.getUname().equals(""))
		{
			isName = true;
			logger.info("가입 유형 : \nAPI: " + isAPI + "\nID: " + isDuId + "\nEmail: " + isDuEmail + isEmail + 
						"\nPASS: " + isPass + "\nName: " + isName);
			if(isDuId && isDuEmail && isPass && isEmail && isName)
			{
				// 이름이 공백이 아니고 상기 4가지 조건이 모두 참일때 가입 실행.
				service.regist(vo);
				return "OK";
			}
		}

		return "NO";
	}
	
	/**
	 * 아이디 중복 체크 확인
	 * @param id : 입력된 아이디
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> isDuplicateId(String id) throws Exception{
		Map<String, String> resultMap = new HashMap<String, String>();
		
		UserVO vo = new UserVO();
		vo.setUid(id);
		if(id.equals(""))
		{
			resultMap.put("show", "hidden");
			isDuId = false;			
		}
		else if(service.view(vo) != null)	// 아이디 조회결과 있음 : 중복 아이디 
		{
			resultMap.put("show", "visible");
			resultMap.put("removeClass", "alert-success");
			resultMap.put("addClass", "alert-danger");
			resultMap.put("msg", "중복되는 아이디 입니다.");
			isDuId = false;
			return resultMap;
		}
		else if(service.view(vo) == null)	// 조회결과 없음 : 중복되지 않은 아이디
		{
			resultMap.put("show", "visible");
			resultMap.put("removeClass", "alert-danger");
			resultMap.put("addClass", "alert-success");
			resultMap.put("msg", "아이디 사용 가능합니다.");
			isDuId = true;			
			return resultMap;
		}
		return resultMap;
	}
	
	/**
	 * API 로 가입하는지 마는지 여부 체크 함수
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/onAPIRegist.do", method=RequestMethod.POST)
	@ResponseBody
	public String onAPIRegist() throws Exception{
		isAPI = true;
		logger.info("API로 가입되는 모드 설정");
		return "API Regist ON";
	}
	@RequestMapping(value="/offAPIRegist.do", method=RequestMethod.POST)
	@ResponseBody
	public String offAPIRegist() throws Exception{
		isAPI = false;
		logger.info("API로 가입되는 모드 해제");
		return "API Regist OFF";
	}	
	
	/**
	 * 비밀번호 일치 여부를 확인하는 AJAX 통신 부분.
	 * @param oriPass : 비밀번호
	 * @param checkPass : 비밀번호 확인
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/checkPass.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkPass(String oriPass, String checkPass) throws Exception{
		Map<String, String> resultMap = new HashMap<String, String>();
		
		if(isAPI == false)	// API 가입모드가 아닐때만 비밀번호 체크 활성화
		{
			if(oriPass.contains(" ") || checkPass.contains(" "))
			{
				resultMap.put("show", "visible");
				resultMap.put("msg", "비밀번호에 공백 문자를 포함할수 없습니다.");
				isPass = false;
				return resultMap;
			}		
			if(!oriPass.equals("") && checkPass.equals(""))
			{
				resultMap.put("show", "visible");
				resultMap.put("msg", "비밀번호를 확인하세요.");
				isPass = false;
				return resultMap;			
			}
			if(oriPass.equals("") && !checkPass.equals(""))
			{
				resultMap.put("show", "visible");
				resultMap.put("msg", "비밀번호를 입력하세요.");
				isPass = false;
				return resultMap;
			}
			if(!oriPass.equals("") && !checkPass.equals("") && !oriPass.equals(checkPass))
			{
				resultMap.put("show", "visible");
				resultMap.put("msg", "비밀번호가 일치하지 않습니다.");
				isPass = false;
				return resultMap;
			}
		}
				
		// 모든 불가 조건에 걸리지 않으면 비밀번호 입력 허용
		resultMap.put("show", "hidden");
		isPass = true;
		
		return resultMap;
	}
		
	/**
	 * 이메일 중복 체크 확인
	 * @param email : 입력된 이메일
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/checkEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> isDuplicateEmail(String email) throws Exception{
		Map<String, String> resultMap = new HashMap<String, String>();
		
		UserVO vo = new UserVO();
		vo.setUmail(email);
		if(email.equals(""))
		{
			resultMap.put("show", "hidden");
			isDuEmail = false;
			isEmail = false;
		}
		else if(!checkEmail(email))
		{
			resultMap.put("show", "visible");
			resultMap.put("removeClass", "alert-success");
			resultMap.put("addClass", "alert-danger");
			resultMap.put("msg", "올바른 이메일 형식이 아닙니다.");
			isEmail = false;
			return resultMap;
		}
		else if(service.viewEmail(vo) != null)	// 이메일 조회결과 있음 : 중복 이메일 
		{
			resultMap.put("show", "visible");
			resultMap.put("removeClass", "alert-success");
			resultMap.put("addClass", "alert-danger");
			resultMap.put("msg", "중복되는 이메일 입니다.");
			isDuEmail = false;
			isEmail = false;
			return resultMap;
		}
		else if(service.viewEmail(vo) == null)	// 조회결과 없음 : 중복되지 않은 이메일
		{
			resultMap.put("show", "visible");
			resultMap.put("removeClass", "alert-danger");
			resultMap.put("addClass", "alert-success");
			resultMap.put("msg", "이메일 사용 가능합니다.");
			isDuEmail = true;
			isEmail = true;
			return resultMap;
		}
		return resultMap;
	}
	
	/**
	 * 이메일 유효성 검사
	 * @param email : 입력된 이메일
	 * @return
	 */
	public boolean checkEmail(String email){
		String regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(email);
		boolean isNormal = m.matches();
		return isNormal;
	}
	
	// 2016.11.21 : 회원가입 관련 일단 주석 처리. 새로 만들것임.
	/*@RequestMapping(value="/registform", method=RequestMethod.GET)
>>>>>>> PKJ
	public String registGet () throws Exception {
		logger.info("���� GET........ ");
		return "redirect:/app/static/registform.html";
	}

	@ResponseBody
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registPost (UserVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("���� POST.......create����.");
		logger.info(vo.toString());
		

		service.regist(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		 return "redirect:/login";
	}*/
	
	@ResponseBody
	@RequestMapping(value="/viewAccount", method=RequestMethod.GET)
	public UserVO viewUser(UserVO vo) throws Exception{
		//���������ΰ� ������ ����. 
		return service.view(vo);
	}
	//����ڰ� �н����带 �Ҿ���� ���. 
//	@ResponseBody
//	@RequestMapping(value="/viewAccount", method=RequestMethod.GET)
//	public UserVO viewUser(UserVO vo) throws Exception{
//		
//		return service.view(vo);
//	}
	
	@ResponseBody
	@RequestMapping(value="/updateAccount", method=RequestMethod.POST)
	public String updateAccountPost(UserVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("������Ʈ POST. ");
		logger.info(vo.toString());
		service.updateAccount(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");
		 return "redirect:/viewAccount";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateAccount", method=RequestMethod.GET)
	public UserVO updateAccountGet(UserVO vo) throws Exception{
		logger.info("update Account GET.... ");
		return service.view(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/updatePWWeb", method=RequestMethod.POST)
	public String updatePWPost(LoginDTO dto, UserVO vo, String newPW ,RedirectAttributes rttr) throws Exception{
		logger.info("��� ���� POST. ");
		logger.info(vo.toString());
		
		UserVO uvo = service.login(dto); //����� Ʋ�� ���� null �̴�. 
		if(uvo != null) {
			uvo.setUpw(newPW);
			service.updatePW(uvo);
			rttr.addFlashAttribute("msg", "SUCCESS");
		}
		else {
			rttr.addFlashAttribute("msg", "FAIL");
		}
		return "redirect:/viewAccount";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/updatePWWeb", method=RequestMethod.GET)
//	public UserVO updatePWGet(UserVO vo) throws Exception{
//		logger.info("��� ���� GET.... ");
//		return service.view(vo);
//		
//	}
	
	@RequestMapping(value="/updatePWWeb", method=RequestMethod.GET)
	public void updatePWWebGet(UserVO vo, Model model ) throws Exception{
		System.out.println("비번 업데이트 페이지 겟");
		UserVO uvo = service.view(vo);
		model.addAttribute("userVO", uvo);
	}
	
	
	@RequestMapping(value="/deleteAccount", method = RequestMethod.POST)
	public void deleteAccount(int userNo) throws Exception{
		System.out.println("탈퇴 서비스 호출.");
		service.deleteAccount(userNo);
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET) //void �̸� /user/login.jsp ã�ư�.
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception{		}
	
	
	@RequestMapping(value="/loginPost.do", method = RequestMethod.POST)
	public String loginPOST (LoginDTO dto, HttpSession session, Model model) throws Exception{
		
		UserVO vo = service.login(dto);
		System.out.println("loginpost :"+vo);
		if (vo == null){
			System.out.println("vo null.");
			return "redirect:login.do" ; //login.jsp
		}
		session.setAttribute("uvo", vo);
		System.out.println("/loginpost에서 보내는 vo : "+vo);
		return "index";
	}
	
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception{
		
		Object obj = session.getAttribute("login");
		
		if (obj != null) {
			UserVO vo = (UserVO) obj;
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(req, "logincookie");
			
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				resp.addCookie(loginCookie);
			}
		}
		System.out.println("세션에 있는 로그인 쿠키 invalidated.");
		System.out.println("로그아웃됨.");
		return "redirect:../index.do";
	}
	
	
	
	
}

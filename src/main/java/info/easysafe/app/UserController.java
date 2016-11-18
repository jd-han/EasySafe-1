package info.easysafe.app;

import java.util.List;

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
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/listAccount", method=RequestMethod.GET)
	@ResponseBody
	public List<UserVO> listAccount () throws Exception{
		return service.listAll();
	}
	
	@RequestMapping(value="/registform", method=RequestMethod.GET)
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
	}
	
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
	public void deleteAccount(UserVO vo) throws Exception{
		System.out.println("탈퇴 서비스 호출.");
		service.deleteAccount(vo);
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
		return "index";
	}
	
	
	
	
}

package info.easysafe.app;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD
=======
//import org.apache.catalina.User;
>>>>>>> EasySafe/master
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
		logger.info("가입 GET........ ");
		return "redirect:/app/static/registform.html";
	}

	@ResponseBody
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registPost (UserVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("가입 POST.......create서비스.");
		logger.info(vo.toString());
		

		service.regist(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		 return "redirect:/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/viewAccount", method=RequestMethod.GET)
	public UserVO viewUser(UserVO vo) throws Exception{
		//유저스스로가 내정보 보기. 
		return service.view(vo);
	}
	//사용자가 패스워드를 잃어버린 경우. 
//	@ResponseBody
//	@RequestMapping(value="/viewAccount", method=RequestMethod.GET)
//	public UserVO viewUser(UserVO vo) throws Exception{
//		
//		return service.view(vo);
//	}
	
	@ResponseBody
	@RequestMapping(value="/updateAccount", method=RequestMethod.POST)
	public String updateAccountPost(UserVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("업데이트 POST. ");
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
		logger.info("비번 번경 POST. ");
		logger.info(vo.toString());
		
		UserVO uvo = service.login(dto); //비번이 틀린 경우는 null 이다. 
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
	
	@ResponseBody
	@RequestMapping(value="/updatePWWeb", method=RequestMethod.GET)
	public UserVO updatePWGet(UserVO vo) throws Exception{
		logger.info("비번 번경 GET.... ");
		return service.view(vo);
		
	}
	
	@RequestMapping(value="/updatePWWeb", method=RequestMethod.GET)
	public void updatePWWebGet(UserVO vo, Model model ) throws Exception{
		logger.info("비번 번경 GET webPage.... ");
		UserVO uvo = service.view(vo);
		model.addAttribute("userVO", uvo);
	}
	
	
	@RequestMapping(value="/deleteAccount", method = RequestMethod.POST)
	public void deleteAccount(UserVO vo) throws Exception{
		logger.info("탈퇴데스! ");
		service.deleteAccount(vo);
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET) //void 이면 /user/login.jsp 찾아감.
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception{		}
	
	
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public String loginPOST (LoginDTO dto, HttpSession session, Model model) throws Exception{
		UserVO vo = service.login(dto);
		if (vo == null){
			return "login" ; //login.jsp
		}
		session.setAttribute("uvo", vo);
		System.out.println("/loginpost에서 보내는 vo : "+vo);
		return "index";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
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
		return "user/logout";
	}
	
	
	
	
}

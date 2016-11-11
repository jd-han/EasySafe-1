package info.easysafe.app;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import info.easysafe.domain.UserVO;
import info.easysafe.service.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/listAccount", method=RequestMethod.GET)
	@ResponseBody
	public List<UserVO> listAccount () throws Exception{
		return service.listAll();
	}
	
	@ResponseBody
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registGet (UserVO vo, RedirectAttributes rttr) throws Exception{
		System.out.println("VO controller : "+vo);
		service.regist(vo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/app/login";
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void registPost () throws Exception {
		
	}
	
	
	
	
}

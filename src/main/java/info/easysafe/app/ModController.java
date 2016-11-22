package info.easysafe.app;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import info.easysafe.domain.UserVO;
import info.easysafe.service.UserService;

@Controller
@RequestMapping("/mod")
public class ModController {

	@Inject
	private UserService service;
	
	@RequestMapping(value="/listAccount.do", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView listAccount (ModelAndView mav, Model model) throws Exception{
		System.out.println("회원 전체 리스트 보기");
		List<UserVO> uList = service.listAll();
		mav.addObject("userList", uList);
		model.addAttribute("list", uList);
		
		return mav;
	}
	
	
	
	
}

package info.easysafe.app;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.PageMaker;
import info.easysafe.domain.UserVO;
import info.easysafe.service.UserService;
import sun.util.logging.resources.logging;

@Controller
@RequestMapping("/mod")
public class ModController {
	
	private static final Logger logger = LoggerFactory.getLogger(ModController.class);

	@Inject
	private UserService service;
	
	@RequestMapping(value="/listPage.do", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")Criteria cri, Model model) throws Exception{
		
		System.out.println("회원 페이징하기. ");
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(131);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
//	@RequestMapping(value="/listAccount.do", method=RequestMethod.GET)
//	@ResponseBody
//	public ModelAndView listAccount (ModelAndView mav, Model model) throws Exception{
//		System.out.println("회원 전체 리스트 보기");
//		List<UserVO> uList = service.listAll();
//		mav.addObject("userList", uList);
//		model.addAttribute("list", uList);
//		
//		return mav;
//	}
	
	@RequestMapping(value="/updateLevel.do", method = RequestMethod.GET)
	@ResponseBody
	public void updateLevel (@RequestParam(value = "no") String no, @RequestParam(value = "ulevel")String ulevel) throws Exception{
		UserVO userVo = new UserVO();
		userVo.setNo(Integer.parseInt(no));
		userVo.setUlevel(ulevel);
		
		System.out.println("유저레벨 바꾸기");
		service.updateLevel(userVo);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteUser.do", method=RequestMethod.POST)
	public void deleteUser (@RequestParam(value="no") String no) throws Exception{
		int uno = Integer.parseInt(no);
		System.out.println("유저 딜리트");
		service.deleteAccount(uno);
	}
	
	
	
	
}

package info.easysafe.app;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import info.easysafe.domain.NoticeVO;
import info.easysafe.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	@ResponseBody
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView listAllNotice (ModelAndView mav, Model model ) throws Exception{
		System.out.println("공지사항 리스트 보기");
		List<NoticeVO> nList = service.listNotice();
		mav.addObject("noticeList", nList);
		model.addAttribute("list", nList);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public NoticeVO readNotice(int no) throws Exception{
		return service.readNotice(no);
	}
	
	//여기부터는 관리자만!
	
	@ResponseBody
	@RequestMapping(value="/update", method= RequestMethod.POST )
	public void updateNotice(NoticeVO vo) throws Exception{
		System.out.println("vo from controller : "+ vo);
		service.updateNotice(vo);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public String deleteNotice(Integer no) throws Exception{
		service.deleteNotice(no);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/create", method= RequestMethod.POST)
	public String createNotice(NoticeVO vo) throws Exception{
		service.createNotice(vo);
		return "";
	}
	
	
	
}

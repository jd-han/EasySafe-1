package info.easysafe.app;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView listAllNotice (ModelAndView mav, Model model ) throws Exception{
		System.out.println("공지사항 리스트 보기");
		List<NoticeVO> nList = service.listNotice();
		mav.addObject("noticeList", nList);
		model.addAttribute("list", nList);
		
		return mav;
	}
	
	@RequestMapping(value="/read.do", method = RequestMethod.GET)
	public ModelAndView readNotice(int no, Model model, ModelAndView mav) throws Exception{
		System.out.println(no+"번 공지사항 상세 보기");
		NoticeVO vo = service.readNotice(no);
		model.addAttribute("notice", vo);
		mav.addObject("noticeOb", vo);
		return mav;
	}
	
	//여기부터는 관리자만!
	
	@RequestMapping(value="/updatePost.do", method= RequestMethod.POST )
	public String updateNotice(NoticeVO vo) throws Exception{
		System.out.println("vo from controller : "+ vo);
		service.updateNotice(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="/update.do")
	public void updateNoticeGet(@RequestParam("no")int no, Model model) throws Exception{
		/*model.addAttribute(service.readNotice(no));*/
		
		NoticeVO vo = service.readNotice(no);
		model.addAttribute("notice", vo);
		
		System.out.println("수정페이지에 service.readNotice: "+no+"해서 원래 내용 올려주기.");
	}
	
	@RequestMapping(value = "/delete.do", method=RequestMethod.GET)
	public String deleteNotice(int no) throws Exception{
		service.deleteNotice(no);
		System.out.println("지울 공지 번호 딜리트 서비스에 넣었음.");
		return "redirect:list.do";
	}
	
	@RequestMapping(value = "/create.do", method= RequestMethod.GET)
	public void createNoticeGet(NoticeVO vo, Model model) throws Exception{
		System.out.println("공지 작성 페이지");
	}
	
	@RequestMapping(value = "/noticePost.do", method= RequestMethod.POST)
	public String createNotice(NoticeVO vo) throws Exception{
		service.createNotice(vo);
		System.out.println("notice에서 보내는 vo : "+vo);
		return "redirect:list.do";
	}
	
	
	
}

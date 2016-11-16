package info.easysafe.app;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import info.easysafe.domain.NoticeVO;
import info.easysafe.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	@ResponseBody
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public List<NoticeVO> listAllNotice () throws Exception{
		return service.listNotice();
	}
	
	@ResponseBody
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public NoticeVO readNotice(int no) throws Exception{
		return service.readNotice(no);
	}
	
	@ResponseBody
	@RequestMapping(value="/update", method= RequestMethod.POST )
	public void updateNotice(NoticeVO vo) throws Exception{
		System.out.println("vo from controller : "+ vo);
		service.updateNotice(vo);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public String deleteNotice(Integer no) throws Exception{
		service.deletNotice(no);
		return "success";
	}
}

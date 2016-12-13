package info.easysafe.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.PageMaker;
import info.easysafe.domain.ReplyVO;
import info.easysafe.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public ResponseEntity<String> register (@RequestBody ReplyVO vo) {
		System.out.println("댓글 등록 들어옴");
		ResponseEntity<String> entity = null;
		try {
			service.addreply(vo);
			entity = new ResponseEntity<String>("success.", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{ino}.do", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list (@PathVariable("ino") int ino) {
		ResponseEntity<List<ReplyVO>> entity = null;
		logger.info("list all replies ");
		try {
			entity = new ResponseEntity<>(service.list(ino), HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/{rno}.do", method={RequestMethod.PUT, RequestMethod.PATCH} )
	public ResponseEntity<String> update(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.updateReply(vo);
			entity = new ResponseEntity<String>("success.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/delete{rno}.do", method=RequestMethod.POST)
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) {
		ResponseEntity<String> entity = null;
		try {
			System.out.println(rno+"번 댓글 삭제");
			service.deleteReply(rno);
			entity= new ResponseEntity<String>("susccess~", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	public ResponseEntity<Map<String, Object>> listPage (
//			@PathVariable("ino") int ino, @PathVariable("page") int page) {
//		ResponseEntity<Map<String, Object>> entity = null;
//		
//		try{
//			Criteria cri = new Criteria();
//			cri.setPage(page);
//			
//			PageMaker pageMaker = new PageMaker();
//			pageMaker.setCri(cri);
//			
//			Map<String, Object> map = new HashMap<String, Object>();
//			List<ReplyVO> list = service.listReplyPage(ino, cri);
//			
//			map.put("list", list);
//			
//			int replyCount = service.count(ino);
//			pageMaker.setTotalCount(replyCount);
//			
//			map.put("pageMaker", pageMaker);
//			
//			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
	
}


package info.easysafe.app;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import info.easysafe.domain.IssueVO;
import info.easysafe.domain.PageMaker;
import info.easysafe.domain.SearchCriteria;
import info.easysafe.service.IssueService;
import info.easysafe.service.ReplyService;
import info.easysafe.util.MediaUtils;

@Controller
@RequestMapping("/issue")
public class IssueController {

	private static final Logger logger = LoggerFactory.getLogger(IssueController.class); 
	
	@Inject
	private IssueService service;
	
	@Inject
	private ReplyService replyService;
	
	@Resource(name = "issueUploadPath")
	private String uploadPath;
	
	@ResponseBody
	@RequestMapping(value = "/displayFile.do")
	public ResponseEntity<byte[]> displayFile(String filename) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME: " + filename);
		System.out.println();

		try {

			String formatName = filename.substring(filename.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + filename);

			if (mType != null) {
				headers.setContentType(mType);
			} else {

				filename = filename.substring(filename.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; fullName=\"" + new String(filename.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	
	 @RequestMapping(value = "/listPage.do", method = RequestMethod.GET)
	  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		System.out.println("이슈 페이징하기. ");
	    logger.info(cri.toString());

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("mid");
		model.addAttribute("list", service.listSearchCriteria(cri));
		logger.info("end");
	  }

	  @RequestMapping(value = "/read.do", method = RequestMethod.GET)
	  public void read(@RequestParam("ino") int ino, @ModelAttribute("cri") SearchCriteria cri, Model model)
	      throws Exception {

		  System.out.println(ino+"번 이슈 클릭했음");
	    model.addAttribute(service.read(ino));
	  }

	  @RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	  public String remove(@RequestParam("ino") int ino, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		  
		replyService.deleteWholeReply(ino);
		System.out.println("지울 이슈 번호 댓글 한꺼번에 리무브 서비스에 넣었음. ");
	    service.remove(ino);
	    System.out.println("지울 이슈 번호 리무브 서비스에 넣었음. ");

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    return "redirect:listPage.do";
	  }

	  @RequestMapping(value = "/update.do", method = RequestMethod.GET)
	  public void modifyPagingGET(int ino, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	    IssueVO vo = service.read(ino);
		model.addAttribute("issue", vo);
	    System.out.println("수정페이지로  service.read(ino); "+ino+"번에 원래 있던 내용 보내주기~");
	  }

	  @RequestMapping(value = "/updatePost.do", method = RequestMethod.POST)
	  public String modifyPagingPOST(IssueVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

	    logger.info(cri.toString());
	    logger.info("vo는? "+vo);
	    service.modify(vo);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    logger.info("rttr 이 뭐였냐면 : "+rttr.toString());

	    return "redirect:listPage.do";
	  }

	  @RequestMapping(value = "/create.do", method = RequestMethod.GET)
	  public void registGET() throws Exception {
	    logger.info("이슈 작성 페이지. ");
	  }

	  @RequestMapping(value = "/issuePost.do", method = RequestMethod.POST)
	  public String registPOST(IssueVO vo, RedirectAttributes rttr) throws Exception {

	    logger.info("이슈 포스트임ㅋ");
	    logger.info("넣은 vo"+vo.toString());

	    service.regist(vo);

	    return "redirect:listPage.do";
	  }
	  
	  
	  @RequestMapping("/getAttach/{ino}.do")
	  @ResponseBody
	  public List<String> getAttach(@PathVariable("ino")Integer ino)throws Exception{
	    
	    return service.getAttach(ino);
	  }  
	
}

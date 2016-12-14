package info.easysafe.app;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import info.easysafe.domain.MsgVO;
import info.easysafe.domain.PageMaker;
import info.easysafe.domain.SearchCriteria;
import info.easysafe.domain.UserVO;
import info.easysafe.service.MsgService;
import info.easysafe.service.UserService;
import info.easysafe.util.UploadFileUtils;

@Controller
@RequestMapping("/mod")
public class ModController {
	
	private static final Logger logger = LoggerFactory.getLogger(ModController.class);

	@Inject
	private UserService service;
	@Inject
	private MsgService mService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//ver 3.  페이징, 검색 있는 컨트롤러. 
	@RequestMapping(value="/listPage.do", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		
		System.out.println("회원 페이징과 검색. ");
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
//	ver 2.
//	@RequestMapping(value="/listPage.do", method=RequestMethod.GET)
//	public void listPage(@ModelAttribute("cri")Criteria cri, Model model) throws Exception{
//		
//		System.out.println("회원 페이징하기. ");
//		logger.info(cri.toString());
//		
//		model.addAttribute("list", service.listCriteria(cri));
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
////		pageMaker.setTotalCount(131);
//		pageMaker.setTotalCount(service.listCountCriteria(cri));
//		
//		model.addAttribute("pageMaker", pageMaker);
//	}
	
	
//	ver 1.
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
	
	@ResponseBody
	@RequestMapping(value="/listAll.do", method=RequestMethod.POST)
	public boolean listAllRequUser() throws Exception
	{
		// 쿼리 결과중에 등업 신청(R) 이 하나라도 있다면 true 반환.
		return service.listRequUser().contains("R") ? true : false;		
	}
	
	@RequestMapping(value="/askLevelUp.do", method=RequestMethod.POST)
	public String askLvUp(MultipartRequest mreq, String sendUser, String msgTitle, String msg, HttpSession session) throws Exception
	{
		logger.info("로그 : 등업신청 보냄");
		MsgVO mvo = new MsgVO();
		mvo.setSendUser(sendUser);
		mvo.setMsgTitle(msgTitle);
		mvo.setMsg(msg);
		logger.info("등업신청유저 아이디 : " + mvo.getSendUser());
		
		// 파일 첨부 있을경우.
		MultipartFile file = mreq.getFile("lvUpFile");
		if (file != null && !file.getOriginalFilename().equalsIgnoreCase("")) {
			System.out.println("등업파일을 mreq에서 가져왔다. ");
			logger.info("original name : " + file.getOriginalFilename());
			logger.info("size : " + file.getSize());
			// 증빙서류 업로드용 경로를 추가 해줌.
			uploadPath = "/usr/tomcat8/webapps/EasySafe/resources";
			uploadPath = uploadPath + "/experts";
			String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			// 업로드 패스를 위에서 변경했기 때문에 원래 값으로 강제복원 해줘야 함.
// 리눅스 경로 조심 uploadPath = "C:/easysafe/resources/"; uploadPath = "/usr/tomcat8/webapps/EasySafe/resources/";
			uploadPath = "/usr/tomcat8/webapps/EasySafe/resources/";
			logger.info("파일 이름  : " + savedName);
			mvo.setLvUpFile(savedName);
		}		
		
		// 유저가 등업신청을 하면 유저 테이블의 신청여부가 R 로 바뀌고
		UserVO uvo = new UserVO();
		//uvo.setUid(mvo.getSendUser());
		uvo.setRequest("R");
		uvo.setUid(mvo.getSendUser());
		service.updateAskLvUp(uvo);
		// msg 기반의 신청서가 날라감. 신청서엔 받는 사람은 null 이고 보내는 사람만 있음.
		mService.insertLvUpForm(mvo);
		// 운영진에겐 등업신청 유저가 있다는 알람이 뜨게 되며
		// 유저관리 페이지의 등업신청 아이콘을 누르면 제목 내용 첨부파일이 열리게 됨.
		// 테이블에서 어느 유저의 신청서가 열리는지는 sendUser 란의 id 와 받는 사람이 없는 것으로 일반 메시지가 아닌 등업신청임을판단.
		// 관리자는 수락/거부 결정해서 메시지 입력하고 결정하고
		// 유저 입장에서는 관리자부터의 메시지를 받고 여기엔 수락/거부 여부와 사유를 볼수 있음.
		// 수락이건 거부건 해당 등업신청 메시지는 삭제. 다음에 재 신청 하거나 하면 구분 못하니까.
		return "redirect:/user/mypage.do";
	}
	
	@RequestMapping(value="/requestUpUser.do", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO requestLvUp(String userId) throws Exception
	{
		MsgVO mvo = mService.selectUpMsg(userId);
		return mvo;
	}
	
	@RequestMapping(value="/completeUpUser.do", method=RequestMethod.POST)
	@ResponseBody
	public MsgVO completeLvUp(int msgNo, String msgTitle, String msgContent, String requStat, String sender, String receiver) throws Exception
	{
		MsgVO mvo = new MsgVO();
		// 메시지를 보낼 세팅
		mvo.setReceiveUser(receiver);
		mvo.setSendUser(sender);
		mvo.setMsgTitle(msgTitle);
		mvo.setMsg(msgContent);
		mvo.setReadable("A");
		mService.sendMsg(mvo);
		// 해당 유저(receiver) 의 등업 신청 상태를 requStat 으로 바꿈. N / D.
		UserVO uvo = new UserVO();
		uvo.setUid(receiver);
		uvo.setRequest(requStat);
		service.updateAskLvUp(uvo);
		// 해당 유저의 등급을 일반으로 유지하거나 전문가로 업.
		if(requStat.equalsIgnoreCase("D"))
		{
			uvo.setUlevel("pro");
			service.goPro(uvo);
		}
		// 끝으로, 받았던 등업 신청은 표식을 새겨서 저장해둠.
		mService.completeMsg(msgNo);
		return null;
	}
}

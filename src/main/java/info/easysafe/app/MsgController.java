package info.easysafe.app;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import info.easysafe.domain.MsgVO;
import info.easysafe.domain.UserVO;
import info.easysafe.service.MsgService;


@Controller
@RequestMapping("/msg")
public class MsgController {

	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@Inject
	private MsgService service;
	
	// 유저에게 온 메시지, 유저가 보낸 메시지 다 보기
	@RequestMapping(value="/msgList.do", method=RequestMethod.GET)
	public ModelAndView listAllMsg (HttpSession session, ModelAndView mav) throws Exception{		
		System.out.println("메시지함 리스트 보기");
		
		Object obj = session.getAttribute("login");
		
		if (obj != null)
		{
			UserVO uvo = (UserVO)obj;			
			List<MsgVO> msgSendList = service.listSendMsg(uvo.getUid());
			mav.addObject("msgSendList", msgSendList);
			List<MsgVO> msgReceiveList = service.listReceiveMsg(uvo.getUid());
			mav.addObject("msgReceiveList", msgReceiveList);
		}
		
		return mav;
	}
	
	// 유저에게 온 읽지않은 메시지가 있는지 여부 파악
	@ResponseBody
	@RequestMapping(value="/isMsg.do", method=RequestMethod.POST)
	public String isReceiveMsg(HttpSession session) throws Exception
	{
		// 쿼리 결과중에 열람전 (A,N) 이 하나라도 있다면 true 반환.
		Object obj = session.getAttribute("login");
		boolean A = false;
		boolean N = false;
		String result = "";
		if (obj != null)
		{
			logger.info("메시지 여부 확인");
			UserVO uvo = (UserVO)obj;
			List<MsgVO> msgReceiveList = service.listReceiveMsg(uvo.getUid());
			for(int i = 0 ; i < msgReceiveList.size() ; i++)
			{
				if(msgReceiveList.get(i).getReadable().equalsIgnoreCase("A"))
				{
					A = true;
				}else if(msgReceiveList.get(i).getReadable().equalsIgnoreCase("N"))
				{
					N = true;
				}
			}	
		}
		if(A && N){
			result = "AN";
		}else if(A && !N){
			result = "A";
		}else if(!A && N){
			result = "N";
		}
		return result;
	}
	
	// 그 중에 하나 찍어서 상세보기 -> 메시지 상세 페이지로 이동
	@RequestMapping(value="/msgDetail.do", method = RequestMethod.GET)
	public ModelAndView msgDetail(int msgNo, String isSend, ModelAndView mav) throws Exception{
		System.out.println(msgNo+" 번 메시지 들어옴");
		MsgVO mvo = service.msgDetail(msgNo);
		// 읽는 와중에 열람을 건드리게 된다.
		if(mvo.getReadable().equalsIgnoreCase("A")){
			// 운영자 메시지면 E 로 변경
			mvo.setReadable("E");
			service.onReadable(mvo);			
		}else if(mvo.getReadable().equalsIgnoreCase("N")){
			// 일반 유저면 Y 로 변경
			mvo.setReadable("Y");
			service.onReadable(mvo);
		}
		mav.addObject("msgDetail", mvo);
		if(isSend.equalsIgnoreCase("N")){ mav.addObject("replyBtn", "OFF"); }
		return mav;
	}
	
	// 대상 유저에게 메시지 보내기 -> 작성 모달창 띄우기(ajax)
	// 전문가 등업 신청은 여기서 취급하지 않는다. mod 로 가라.
	// 일반 메시지는 초록 편지 아이콘 출력, 운영자 특별 메시지는 빨간 편지 아이콘
	@RequestMapping(value="/sendMsg.do", method= RequestMethod.POST )
	public String sendMsg(MsgVO mvo) throws Exception{
		System.out.println("mvo from controller : "+ mvo);
		if(mvo.getReadable().equalsIgnoreCase("admin")){
			// 송신자가 운영자일경우 특별 메시지 모드. (readable변수:A=운영자메시지읽기전,E=메시지읽은후)
			mvo.setReadable("A");
		}else{
			// 송신자가 일반유저일경우 일반 메시지 모드. (readable변수:N=메시지읽기전,Y=메시지읽은후)
			mvo.setReadable("N");
		}
		service.sendMsg(mvo);
		return "redirect:/msg/msgList.do";
	}
	
	// 선택한 메시지 삭제, 그후 메시지 목록페이지로 이동
	@RequestMapping(value="/deleteMsg.do", method=RequestMethod.POST)
	public void deleteMsg(int msgNo) throws Exception{
				
		service.deleteMsg(msgNo);
		System.out.println(msgNo + " 를 삭제함.");
		//return "redirect:/msg/msgList.do";
	}
	
	// 유저 아이디가 DB에 있는지 조회하는 메소드
	@RequestMapping(value="/searchId.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean searchUser(String findId) throws Exception{
		logger.info("메시지 받을 유저 있는지 검색 들어옴");
		if(service.searchUser(findId))
		{
			return true;
		}
		return false;
	}
}

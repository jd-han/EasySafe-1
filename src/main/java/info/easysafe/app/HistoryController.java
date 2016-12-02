package info.easysafe.app;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.aspectj.apache.bcel.generic.SWAP;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sun.mail.pop3.POP3SSLStore;

import info.easysafe.domain.KeywordVO;
import info.easysafe.domain.UserVO;
import info.easysafe.service.KeywordService;


@Controller
@RequestMapping("/history")
public class HistoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(HistoryController.class); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Gson gs = new Gson();
	List<Integer> ids = null;
	
	@Inject
	private KeywordService service;
	
	@RequestMapping(value="/history.do", method = RequestMethod.GET)
	public String reDirectHistory(HttpSession session) throws Exception
	{
		Object obj = session.getAttribute("login");
		
		if (obj != null)
		{
			UserVO uvo = (UserVO)obj;
			// 관리자 일경우
			if(uvo.getUlevel().equalsIgnoreCase("admin"))
			{
				return "redirect:/history/historyAdmin.do";
			}else{
				return "redirect:/history/historyUser.do";
			}
		}
		// 이도 저도 아닌게 들어오면 메인으로 튕.
		return "redirect:/index.do";
	}
	
	@RequestMapping(value="/historyAdmin.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView mainViewAdmin (HttpSession session, ModelAndView mv) throws Exception{
		logger.info("Admin history Page 진입");
		// 그래프에 넣을 데이타 정리하는 부분
		List<String> dates = service.listAllDate();
		Map<String, String> graphDataMap = new HashMap<String, String>();		
		String graphData = "";		
		for(int i = 0 ; i < dates.size() ; i++)
		{
			List<KeywordVO> list = service.listStatAdminKeywordKorName(dates.get(i));
			graphDataMap.put("date", dates.get(i));
			for(int j = 0 ; j < list.size() ; j++)
			{
				graphDataMap.put(list.get(j).getKeyword(), list.get(j).getCount()+"");				
			}
			graphData += gs.toJson(graphDataMap) + ",";
			graphDataMap = new HashMap<String, String>();			
		}
		// 벌룬 세팅용 맵 설정 이것은 고칠 필요 없는 고정.
		Map<String, Object> balloonMap = new HashMap<String, Object>();
		balloonMap.put("drop", "true");
		balloonMap.put("adjustBorderColor", (Boolean)false);
		balloonMap.put("color", "#ffffff");
		// 그래프 세팅 맵 설정. 고정.
		// 표시할 그래프 수 만큼 반복문.임시.
		Map<String, Object> graphMap = null;
		List<String> keywordList = service.listAllKeyword();
		String graph = "";
		for(int i = 0 ; i < keywordList.size() ; i++)
		{
			graphMap = new HashMap<String, Object>();
			graphMap.put("id", keywordList.get(i));
			// 세팅한 벌룬 맵을 삽입.
			graphMap.put("balloon", balloonMap);
			graphMap.put("bullet", "round");
			graphMap.put("bulletBorderAlpha", "1");
			graphMap.put("bulletColor", "#FFFFFF");
			graphMap.put("bulletSize", "5");
			graphMap.put("hideBulletsCount", "50");
			graphMap.put("lineThickness", "2");
			graphMap.put("title", keywordList.get(i));
			graphMap.put("useLineColorForBulletBorder", true);
			graphMap.put("valueField", keywordList.get(i));
			graphMap.put("balloonText", "<span style='font-size:18px;'>[[" + keywordList.get(i) + "]]</span>");
			graph += gs.toJson(graphMap) + ",";			
		}			
		mv.addObject("graphs", graph);
		mv.addObject("datas", graphData);
		
		return mv;
	}
	
	@RequestMapping(value="/historyUser.do", method = RequestMethod.GET)
	//@ResponseBody
	public ModelAndView mainViewUser (HttpSession session, ModelAndView mv) throws Exception{
		logger.info("User history Page 진입");	
		
		Object obj = session.getAttribute("login");
		String pos = "";
		
		gs = new Gson();
		if (obj != null)
		{
			UserVO uvo = (UserVO) obj;
			logger.info("로그인 유저 있음: " + uvo.getUid());
			List<Map<String, Object>> list = service.listStatUserKeywordKorName(uvo.getUid());
			Map<String, Object> poss = null;
			//List<Map.Entry<String, Object>> posss = new ArrayList<Map.Entry<String,Object>>(poss.entrySet());
			
			//logger.info("내역조회유저: " + uvo.getUid());
			//logger.info(list.toString());
			//Set<Integer> set = new HashSet<Integer>();
			ids = new ArrayList<Integer>();
			for(int i = 0 ; i < list.size() ; i++)
			{
				poss = new LinkedHashMap<String, Object>();
				// id 당 포지션 잡는 배열 만드는 용도의 set. cdate 숫자를 중복제거해서 넣는다.
				//set.add(Integer.parseInt(list.get(i).get("cdate").toString()) - 1);
				/*pos += "{'id': "+modId(Integer.parseInt(list.get(i).get("cdate").toString()))+", "
					+  "'name': '"+list.get(i).get("keyword")+"', "
					+  "'r': "+modCount(Integer.parseInt(list.get(i).get("count").toString()))+"},";*/
				poss.put("id", modId(Integer.parseInt(list.get(i).get("cdate").toString())));
				poss.put("name", list.get(i).get("keyword"));
				poss.put("r", modCount(Integer.parseInt(list.get(i).get("count").toString())));
				poss.put("lastdate", sdf.format(list.get(i).get("lastdate")));
				pos += gs.toJson(poss) + ",";				
			}
			
			/*logger.info("set : " + set);*/
			logger.info("datas : " + pos);
			mv.addObject("datas", pos);
			pos = "";//"{x : 100, y: 0},";
			//System.out.println("ids IS : " + ids.toString());
			int height = 0;
			logger.info(ids.toString());
			/*if(ids.size()-1 == 0)
			{
				pos += "{x : 100, y: " + 1 * (modYPos(list, ids.get(0))+100) + "},";
				height += 1 * (modYPos(list, ids.get(0))+100);
				logger.info(height+"");
			}
			else{*/
				for(int i = 0 ; i < ids.size() ; i++)
				{
					pos += "{x : 100, y: " + (i+1) * (modYPos(list, ids.get(i))+50) / 2 + "},";
					height += (i+1) * (modYPos(list, ids.get(i))+50) / 2;
					logger.info(height+"");
				}
			//}
			if(height <= 750) { height = 750; } 
			mv.addObject("maxHeight", height);
			gs.toJson(pos);
		}			
		mv.addObject("pos", pos);
		//logger.info("pos : " + pos);
		
		return mv;
	}
	// 검색 횟수에 따른 크기 보정하는 메소드.
	// 너무 뜸하면 너무 작게 나오고 너무 잦으면 너무 크게 나오므로 조정.
	public int modCount(int oriCount)
	{
		oriCount = oriCount * 5;
		if(oriCount <= 20)
		{
			oriCount = 20;
		}/*else if(oriCount >= 200)
		{
			oriCount = 200;
		}*/
		return oriCount;
	}
	// 검색어를 입력했던 날짜 횟수만큼 내림차순으로 뽑아서
	// 횟수가 많은 순서대로 id 를 0 번 부터 부여받는 메소드.
	// 날짜 횟수는 지속적인 관심을 나타내고 검색 횟수는 이슈적인 부분을 나타낸다고 볼수 있음.
	public int modId(int id)
	{
		if(!ids.contains(id)) // 기존 리스트에 중복된 아이디가 없다면.
		{
			ids.add(id);
		}
		// 유일 숫자가 들어오면 size 가 1 증가된 숫자를 반환함.
		// 중복 숫자가 들어오면 기존 size 숫자를 반환함.
		return ids.size() - 1;
	}
	// 각 검색어가 차지하는 크기에 따라 검색어 풍선간의 Y 위치를 조정하는 메소드.
	public int modYPos(List<Map<String, Object>> list, int id)
	{		
		List<Integer> arr = new ArrayList<Integer>();
		// 리스트 사이즈 만큼 돌면서 해당 아이디에 해당하는 count 값을 다 뽑음.			
		for(int i = 0 ; i < list.size() ; i++)
		{
			// 리스트에 들어있는 id 에서 1 뺀 숫자가 비교용 아이디랑 맞다면 해당 아이디에 해당하는 count를 모조리 리스트에 담음.
			//System.out.println("eeeeeeee: "+Integer.parseInt(list.get(i).get("cdate").toString()) + "아이디는: " + id);
			if(Integer.parseInt(list.get(i).get("cdate").toString()) == id)
			{
				arr.add(Integer.parseInt(list.get(i).get("count").toString()));
				//System.out.println("카운트는: "+Integer.parseInt(list.get(i).get("count").toString()));
			}else{
				//System.out.println("없어");
			}
		}
		return modCount(Collections.max(arr));
	}
}

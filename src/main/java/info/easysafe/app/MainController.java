package info.easysafe.app;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.KeywordVO;
import info.easysafe.domain.ProductVO;
import info.easysafe.domain.UserVO;
import info.easysafe.service.ChemService;
import info.easysafe.service.KeywordService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Inject
	private ChemService service;
	@Inject
	private KeywordService kService;

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome index! The client locale is {}.", locale);
//		UserVO uvo = new UserVO();
//		uvo.setUname("user01");
//		model.addAttribute("uvo", uvo);
		return "index";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		// Date date = new Date();
		// DateFormat dateFormat =
		// DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,
		// locale);
		//
		// String formattedDate = dateFormat.format(date);
		//
		// model.addAttribute("serverTime", formattedDate );

		return "redirect:/index";
	}
	
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView searchChem(String key, String user, ModelAndView mv) throws Exception {
		logger.info("검색 실행됨.");
		logger.info("검색 파라메터 유입 : " + key + ", 검색자 : " + user);
		boolean iskor = false;
		for (int i = 0; i < key.length(); i++) {
			if (Character.getType(key.charAt(i)) == 5) {
				// 한글인 경우.
				iskor = true;
			}
		}

		List<ChemVO> cList = null;
		List<ProductVO> pList = null;
		KeywordVO kVO = new KeywordVO();
		if (iskor == true) {
			cList = service.listChemKorName(key);
			pList = service.listProductKorName(key);
			// 검색어와 현재 날짜, 검색 유저를 VO에 삽입.
			kVO.setKeyword(key);
			kVO.setRegDate(new Date());
			// 유저 아이디가 존재하지않으면 유저 아이디를 anon 으로 설정해 VO 에 삽입.
			if(user.equalsIgnoreCase("")){ kVO.setUser("anon"); }
			else{ kVO.setUser(user); }
			
			System.out.println("kVO : " + kVO.toString());
			// 검색 결과를 받을 임시 VO 선언.
			KeywordVO resultVO = kService.readKeywordKorName(kVO);
			System.out.println("ResultVO : " + resultVO);
			if(resultVO != null)	// 검색결과 있음 : 기존 검색어가 오늘 날짜로 존재함.
			{
				// 검색어에 해당하는 검색횟수를 1 증가.
				kService.updateCount(kVO);
				System.out.println("검색횟수증가");
			}else if(resultVO == null){
				// 검색결과 없으면 오늘 날짜로 검색어를 새로 등록.
				kService.createKeywordKorName(kVO);
				System.out.println("검색횟수안증가");
			}
		} else {
			// list = service.listChemEngName(key);
			System.out.println("영어 검색.");
		}
		mv.addObject("chemList", cList);
		mv.addObject("proList", pList);
		mv.addObject("keyword", key);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/chemDetail.do", method = RequestMethod.GET)
	public ModelAndView chemDetail(String compo, ModelAndView mv) throws Exception {
		System.out.println("성분상세 들어옴 : " + compo);
		boolean iskor = false;
		for (int i = 0; i < compo.length(); i++) {
			if (Character.getType(compo.charAt(i)) == 5) {
				iskor = true;
			}
		}

		ChemVO chem = null;
		List<ProductVO> prod = null;
		if (iskor == true) {
			// 성분의 이름으로 상세정보 조회.
			String name = compo;
			chem = service.readChemKorName(name);
			// 성분의 이름으로 포함 제품 조회.
			prod = service.listProductWCompo(compo);
		} else {
			// chem = service.readChemEngName(key);
			System.out.println("영어 성분 읽기"); 
		}
		mv.addObject("chemResult", chem);
		mv.addObject("productResult", prod);
		mv.addObject("keyword", compo);
		return mv;
	}

	/*@ResponseBody
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public List<ProductVO> searchProduct(String key) throws Exception {
		boolean iskor = false;
		for (int i = 0; i < key.length(); i++) {
			if (Character.getType(key.charAt(i)) == 5) {
				// 占쎈쐻占쎈뼩繹먮씮�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�
				iskor = true;
			}
		}

		List<ProductVO> list = null;
		if (iskor == true) {
			// 占쎈쐻占쎈뼩繹먮씮�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�
			list = service.listProductKorName(key);

		} else {
			// list = service.listProductEngName(key);
			System.out.println("占쎈쐻占쎈뼩疫뀐옙占쎈툡占쎈솇占쎌굲."); // 占쎈쐻占쎈뼩繹먮씮�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�
		}
		return list;
	}*/

	@ResponseBody
	@RequestMapping(value = "/productDetail.do", method = RequestMethod.GET)
	public ModelAndView productDetail(String name, String code, String seqcode, ModelAndView mv) throws Exception {
		//System.out.println("pvo" + name);
		/*boolean iskor = false;
		for (int i = 0; i < name.length(); i++) {
			if (Character.getType(name.charAt(i)) == 5) {
				iskor = true;
			}
		}*/
		//System.out.println("한글이냐?" + iskor);
		ProductVO tempPro = new ProductVO();
		tempPro.setCode(code);
		//tempPro.setName(name);
		tempPro.setSeqcode(seqcode);
		ProductVO product = service.readProductKorName(tempPro);
		//if (iskor == true) {
			//System.out.println("프로덕트 VO 나옴 : " + product.toString());
		//} else {
			// product = service.readProductEngName(key);
			//System.out.println("占쎈쐻占쎈뼩疫뀐옙占쎈툡占쎈솇占쎌굲."); 
		//}
		//System.out.println(product.getComponents());
		mv.addObject("productResult", product);
		System.out.println("프로덕트 성분표 : " + product.getComponents());
		String[] compos = product.getComponents().split(" ");
		List<ChemVO> list = new ArrayList<>();
		
		for(int i = 0 ; i < compos.length ; i++)
		{
			compos[i] = compos[i].trim();
			ChemVO cvo = service.readChemKorName(compos[i]);
			if(cvo == null){ 
				cvo = new ChemVO();
				cvo.setName(compos[i]);
				cvo.setAvg("NOT");
			}
			list.add(cvo);			
		}
		/*mv.addObject("components", (String[])compos);*/
		mv.addObject("components", list);
		return mv;
	}
}
